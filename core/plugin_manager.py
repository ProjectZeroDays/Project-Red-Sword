import os
import importlib
import logging
import inspect
import json
from jsonschema import validate, exceptions, Draft7Validator

PLUGIN_DIR = "scan_modules"

class PluginManager:
    """Manages the loading and execution of scan modules (plugins)."""

    def __init__(self):
        self.plugins = {}
        self.load_plugins()

    def load_plugins(self):
        """Loads all available plugins from the plugin directory."""
        for filename in os.listdir(PLUGIN_DIR):
            if filename.endswith("_module.py"):
                module_name = filename[:-3]
                module_path = os.path.join(PLUGIN_DIR, filename)
                try:
                    spec = importlib.util.spec_from_file_location(module_name, module_path)
                    module = importlib.util.module_from_spec(spec)
                    spec.loader.exec_module(module)
                    if hasattr(module, 'Plugin'):
                        plugin_class = module.Plugin
                        dependencies = getattr(plugin_class, 'dependencies', [])
                        config_schema = getattr(plugin_class, 'config_schema', None)
                        if self.check_dependencies(dependencies):
                            plugin_instance = plugin_class()
                            if config_schema:
                                try:
                                    Draft7Validator.check_schema(config_schema)
                                    plugin_instance.config_schema = config_schema
                                except exceptions.SchemaError as e:
                                    logging.error(f"Invalid config schema for plugin '{plugin_instance.name}': {e}")
                                    continue
                            self.plugins[plugin_instance.name] = plugin_instance
                            logging.info(f"Plugin '{plugin_instance.name}' loaded successfully.")
                        else:
                            logging.warning(f"Plugin '{module_name}' dependencies not met, skipping.")
                    else:
                        logging.warning(f"Module '{module_name}' does not have a 'Plugin' class.")
                except Exception as e:
                    logging.error(f"Error loading plugin '{module_name}': {e}")

    def check_dependencies(self, dependencies):
        """Checks if all plugin dependencies are met."""
        for dep in dependencies:
            if dep not in self.plugins:
                logging.warning(f"Dependency '{dep}' not found.")
                return False
        return True

    def get_plugin(self, plugin_name):
        """Returns a plugin instance by name."""
        return self.plugins.get(plugin_name)

    def get_all_plugins(self):
        """Returns a dictionary of all loaded plugins."""
        return self.plugins

    def run_plugin(self, plugin_name, target, config, output_dir):
        """Runs a specific plugin."""
        plugin = self.get_plugin(plugin_name)
        if plugin:
            try:
                if hasattr(plugin, 'config_schema'):
                    self.validate_plugin_config(config['parameters'], plugin.config_schema)
                plugin.run_scan(target, config, output_dir)
            except Exception as e:
                logging.error(f"Error running plugin '{plugin_name}': {e}")
        else:
            logging.warning(f"Plugin '{plugin_name}' not found.")

    def validate_plugin_config(self, config_params, config_schema):
        """Validates plugin configuration against its schema."""
        try:
            validate(instance=config_params, schema=config_schema)
        except exceptions.ValidationError as e:
            logging.error(f"Plugin configuration validation error: {e}")
            raise ValueError(f"Plugin configuration validation error: {e}")
