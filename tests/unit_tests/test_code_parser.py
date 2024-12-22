
import unittest
import sys
import os

# Add the src directory to PYTHONPATH
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../../')))

from src.backend.code_parser import CodeParser

class TestCodeParser(unittest.TestCase):
    def test_analyze_code(self):
        code = "def example():\n    return True"
        parser = CodeParser(code)
        analysis = parser.analyze_code()
        self.assertEqual(analysis['num_functions'], 1)
        self.assertEqual(analysis['lines_of_code'], 1)

if __name__ == "__main__":
    unittest.main()
