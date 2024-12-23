# scripts/test/test_network_scanner.py

import unittest
from scripts.network_scanner import scan_network

class TestNetworkScanner(unittest.TestCase):

    def test_scan_network(self):
        """Test the scan_network function to check if it returns devices."""
        devices = scan_network()
        self.assertIsInstance(devices, list)  # Check if it returns a list
        for device in devices:
            self.assertIn('ip', device)          # Ensure 'ip' is in each device dictionary
            self.assertIn('hostname', device)     # Ensure 'hostname' is in each device dictionary
            self.assertIn('state', device)        # Ensure 'state' is in each device dictionary

if __name__ == "__main__":
    unittest.main()
