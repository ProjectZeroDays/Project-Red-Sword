import unittest
import json
import os

class TestUserSetup(unittest.TestCase):

    def setUp(self):
        self.api_keys_file = 'Pipeline With AI Feedback Loop/api_keys.json'
        # Clean up before each test
        if os.path.exists(self.api_keys_file):
            os.remove(self.api_keys_file)

    def tearDown(self):
        if os.path.exists(self.api_keys_file):
            os.remove(self.api_keys_file)

    def test_api_keys_file_creation(self):
        # Simulate running the setup script
        # This can be achieved by calling the setup script here and checking if the file was created
        os.system('bash setup.sh')  # Adjust this line if needed
        self.assertTrue(os.path.exists(self.api_keys_file))

    def test_api_key_storage(self):
        # Simulate adding API keys and checking if they are stored correctly
        os.system('bash setup.sh')  # Adjust this line if needed
        with open(self.api_keys_file, 'r') as file:
            data = json.load(file)
            self.assertIn('OpenAI_Codex_API_Key_1', data)

if __name__ == '__main__':
    unittest.main()
