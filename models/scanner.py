import asyncio
import os
import logging
import ipaddress
import subprocess
import time
from core.reporting import generate_html_report, collect_scan_results
from core.utils import validate_config
from core.config import load_config
from core.plugin_manager import PluginManager
from core.logger import setup_logger
from asyncio import Semaphore

def discover_targets_subnet(subnet):
    """Discovers targets in a subnet using ping."""
    targets = []
    try:
        for ip in ipaddress.IPv4Network(subnet):
            ping_command = ['ping', '-c', '1', str(ip)]
            result = subprocess.run(ping_command, capture_output=True, text=True)
            if result.returncode == 0:
                targets.append(str(ip))
        logging.info(f"Discovered targets in {subnet}: {targets}")
    except Exception as e:
        logging.error(f"Error discovering targets in {subnet}: {e}")
    return targets

def get_targets(scan_config):
    """Gets targets based on the target selection type."""
    try:
        target_type = scan_config['target_selection']['type']
        if target_type == 'static':
            return scan_config['target_selection']['targets']
        elif target_type == 'subnet_scan':
            return discover_targets_subnet(scan_config['target_selection']['subnet'])
        else:
            logging.error(f"Target selection type {target_type} not supported")
            return []
    except Exception as e:
        logging.error(f"Error getting targets: {e}")
        return []

async def async_process_scan_module(target, module_config, output_dir, semaphore, plugin_manager):
    """Asynchronously processes a single scan module with rate limiting."""
    module_name = module_config['name']
    if not module_config['enabled']:
        logging.info(f"Module {module_name} is disabled, skipping.")
        return

    logging.info(f"Running module: {module_name} asynchronously on {target}")
    plugin = plugin_manager.get_plugin(module_name)
    if plugin:
        try:
            if hasattr(plugin, 'pre_scan_hook'):
                logging.debug(f"Executing pre-scan hook for module {module_name} on {target}")
                await asyncio.to_thread(plugin.pre_scan_hook, target, module_config, output_dir)
        except Exception as e:
            logging.error(f"Error running pre-scan hook for module {module_name} on {target}: {e}")

        async with semaphore:
            try:
                start_time = time.time()
                logging.debug(f"Starting scan for module {module_name} on {target}")
                await asyncio.to_thread(plugin.run_scan, target, module_config, output_dir)
                end_time = time.time()
                logging.info(f"Module {module_name} completed on {target} in {end_time - start_time:.2f} seconds")
            except Exception as e:
                logging.error(f"Error running module {module_name} on {target}: {e}")

        try:
            if hasattr(plugin, 'post_scan_hook'):
                logging.debug(f"Executing post-scan hook for module {module_name} on {target}")
                await asyncio.to_thread(plugin.post_scan_hook, target, module_config, output_dir)
        except Exception as e:
            logging.error(f"Error running post-scan hook for module {module_name} on {target}: {e}")
    else:
        logging.warning(f"Module {module_name} not found as a plugin.")

async def async_scan_target(target, scan_config, output_dir, semaphore, plugin_manager, role=None):
    """Asynchronously scans a single target."""
    logging.info(f"Scanning target: {target} asynchronously with role: {role}")
    tasks = []
    try:
        if role and role in scan_config['security_roles']:
            enabled_modules = scan_config['security_roles'][role]['enabled_modules']
            for module_config in scan_config['scan_modules']:
                if module_config['name'] in enabled_modules:
                    tasks.append(async_process_scan_module(target, module_config, output_dir, semaphore, plugin_manager))
        else:
            for module_config in scan_config['scan_modules']:
                tasks.append(async_process_scan_module(target, module_config, output_dir, semaphore, plugin_manager))
        await asyncio.gather(*tasks)
    except Exception as e:
        logging.error(f"Error scanning target {target}: {e}")

async def run_scan(config_path=None, role=None):
    """Main function to execute the scan asynchronously."""
    scan_config = load_config(config_path)
    log_level = scan_config['global_options']['log_level']
    log_dir = scan_config['global_options']['log_directory']
    logger = setup_logger(log_level, log_dir)
    logging.getLogger().handlers = logger.handlers # Set root logger handlers to our logger handlers

    try:
        validate_config(scan_config)
    except ValueError as e:
        logger.error(f"Configuration error: {e}")
        return

    output_dir = scan_config['global_options']['output_directory']
    os.makedirs(output_dir, exist_ok=True)

    targets = get_targets(scan_config)
    concurrent_scans = scan_config['global_options'].get('concurrent_scans', 4)
    semaphore = Semaphore(concurrent_scans)

    plugin_manager = PluginManager()

    tasks = [async_scan_target(target, scan_config, output_dir, semaphore, plugin_manager, role) for target in targets]
    try:
        await asyncio.gather(*tasks)
    except Exception as e:
        logging.error(f"Error during scan execution: {e}")

    # Collect scan results
    scan_results = collect_scan_results(output_dir)

    # Generate HTML report
    generate_html_report(scan_results, output_dir)
