import unittest
import asyncio
import os
import shutil
from core.scanner import run_scan
from core.config import load_config
from core.plugin_manager import PluginManager
import logging
import re

class TestScanner(unittest.TestCase):
    def setUp(self):
        self.config_path = "test_config.yaml"
        self.output_dir = "test_scan_reports"
        self.log_dir = "test_logs"
        self.create_test_config()
        self.logger = logging.getLogger()
        self.log_handler = TestLogHandler()
        self.logger.addHandler(self.log_handler)
        self.log_handler.setLevel(logging.DEBUG)

    def tearDown(self):
        if os.path.exists(self.output_dir):
            shutil.rmtree(self.output_dir)
        if os.path.exists(self.log_dir):
            shutil.rmtree(self.log_dir)
        if os.path.exists(self.config_path):
            os.remove(self.config_path)
        self.logger.removeHandler(self.log_handler)

    def create_test_config(self):
        test_config = {
            'description': 'Test Network Security Audit',
            'timeout_seconds': 3600,
            'target_selection': {
                'type': 'static',
                'targets': ['127.0.0.1'],
            },
            'scan_modules': [
                {
                    'name': 'nmap_port_scan',
                    'type': 'nmap',
                    'enabled': True,
                    'parameters': {
                        'ports': '80',
                        'timing_template': 3,
                        'scan_type': 'syn',
                        'os_detection': False,
                        'version_detection': False,
                        'script_scan': None
                    },
                    'post_processing': {
                        'report_format': 'json',
                        'save_to_file': 'test_nmap_scan_results.json'
                    }
                },
                {
                    'name': 'example_dependent_scan',
                    'type': 'example',
                    'enabled': True,
                    'parameters': {},
                    'post_processing': {
                        'report_format': 'txt',
                        'save_to_file': 'test_dependent_scan_results.txt'
                    }
                },
                {
                    'name': 'nikto_web_scan',
                    'type': 'nikto',
                    'enabled': True,
                    'parameters': {
                        'target_ports': '80,443',
                        'plugins': 'default',
                        'tuning': 'x0'
                    },
                    'post_processing': {
                        'report_format': 'txt',
                        'save_to_file': 'test_nikto_scan_results.txt'
                    }
                },
                {
                    'name': 'ssl_scan',
                    'type': 'sslscan',
                    'enabled': True,
                    'parameters': {
                        'target_ports': '443',
                        'ssl_protocols': 'TLSv1.2,TLSv1.3'
                    },
                    'post_processing': {
                        'report_format': 'csv',
                        'save_to_file': 'test_sslscan_results.csv'
                    }
                }
            ],
            'global_options': {
                'log_level': 'DEBUG',
                'output_directory': self.output_dir,
                'concurrent_scans': 1,
                'rate_limit_delay': 0.5,
                'log_directory': self.log_dir
            },
            'security_roles': {
                'red_team': {
                    'enabled_modules': ['nmap_port_scan', 'example_dependent_scan', 'nikto_web_scan', 'ssl_scan']
                }
            }
        }
        import yaml
        with open(self.config_path, 'w') as f:
            yaml.dump(test_config, f)

    def test_run_scan(self):
        asyncio.run(run_scan(config_path=self.config_path, role='red_team'))
        self.assertTrue(os.path.exists(self.output_dir))
        self.assertTrue(os.path.exists(os.path.join(self.output_dir, 'test_nmap_scan_results.json')))
        self.assertTrue(os.path.exists(os.path.join(self.output_dir, 'test_dependent_scan_results.txt')))
        self.assertTrue(os.path.exists(os.path.join(self.output_dir, 'test_nikto_scan_results.txt')))
        self.assertTrue(os.path.exists(os.path.join(self.output_dir, 'test_sslscan_results.csv')))
        self.assertTrue(os.path.exists(self.log_dir))
        self.assertTrue(any(f.startswith('red_sword') for f in os.listdir(self.log_dir)))

        log_messages = self.log_handler.messages
        self.assertTrue(any(re.search(r"Nmap pre-scan hook executed for 127\.0\.0\.1", msg) for msg in log_messages))
        self.assertTrue(any(re.search(r"Nmap post-scan hook executed for 127\.0\.0\.1", msg) for msg in log_messages))
        self.assertTrue(any(re.search(r"Example dependent pre-scan hook executed for 127\.0\.0\.1", msg) for msg in log_messages))
        self.assertTrue(any(re.search(r"Example dependent post-scan hook executed for 127\.0\.0\.1", msg) for msg in log_messages))
        self.assertTrue(any(re.search(r"Nikto pre-scan hook executed for 127\.0\.0\.1", msg) for msg in log_messages))
        self.assertTrue(any(re.search(r"Nikto post-scan hook executed for 127\.0\.0\.1", msg) for msg in log_messages))
        self.assertTrue(any(re.search(r"SSLScan pre-scan hook executed for 127\.0\.0\.1", msg) for msg in log_messages))
        self.assertTrue(any(re.search(r"SSLScan post-scan hook executed for 127\.0\.0\.1", msg) for msg in log_messages))

    def test_plugin_dependencies(self):
        plugin_manager = PluginManager()
        self.assertIn('nmap_port_scan', plugin_manager.get_all_plugins())
        self.assertIn('example_dependent_scan', plugin_manager.get_all_plugins())
        self.assertIn('nikto_web_scan', plugin_manager.get_all_plugins())
        self.assertIn('ssl_scan', plugin_manager.get_all_plugins())

    def test_plugin_config_validation(self):
        plugin_manager = PluginManager()
        nmap_plugin = plugin_manager.get_plugin('nmap_port_scan')
        with self.assertRaises(ValueError):
            plugin_manager.validate_plugin_config({'ports': '80'}, nmap_plugin.config_schema)
        plugin_manager.validate_plugin_config({'ports': '80', 'timing_template': 3}, nmap_plugin.config_schema)

class TestLogHandler(logging.Handler):
    def __init__(self, *args, **kwargs):
        self.messages = []
        super().__init__(*args, **kwargs)

    def emit(self, record):
        self.messages.append(self.format(record))

if __name__ == '__main__':
    unittest.main()
