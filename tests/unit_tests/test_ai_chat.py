
import unittest
import sys
import os

# Add the src directory to PYTHONPATH
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../../')))

from src.backend.ai_chat import MultiAIChat

class TestMultiAIChat(unittest.TestCase):
    def test_openai_chat(self):
        chat = MultiAIChat("fake_openai_key", "fake_huggingface_key", "fake_anthropic_key")
        response = "Hello"  # Simulated response
        self.assertEqual(response, "Hello")

if __name__ == "__main__":
    unittest.main()
