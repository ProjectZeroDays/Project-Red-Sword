
import unittest
import sys
import os

# Add the src directory to PYTHONPATH
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../../')))

from src.backend.pipeline_manager import PipelineManager

class TestPipelineManager(unittest.TestCase):
    def test_autogpt_task(self):
        manager = PipelineManager()
        task_result = manager.autogpt_task("Create report")
        self.assertIn("AutoGPT executing", task_result)

if __name__ == "__main__":
    unittest.main()
