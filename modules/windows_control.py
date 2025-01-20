import os
import subprocess
import logging

class WindowsControl:
    def __init__(self):
        self.logger = logging.getLogger(__name__)

    def execute_command(self, command):
        try:
            result = subprocess.run(command, shell=True, capture_output=True, text=True)
            if result.returncode == 0:
                return result.stdout
            else:
                self.logger.error(f"Command failed: {result.stderr}")
                return None
        except Exception as e:
            self.logger.error(f"Error executing command: {e}")
            return None

    def list_files(self, directory):
        try:
            return os.listdir(directory)
        except Exception as e:
            self.logger.error(f"Error listing files in directory {directory}: {e}")
            return None

    def read_file(self, file_path):
        try:
            with open(file_path, 'r') as file:
                return file.read()
        except Exception as e:
            self.logger.error(f"Error reading file {file_path}: {e}")
            return None

    def write_file(self, file_path, content):
        try:
            with open(file_path, 'w') as file:
                file.write(content)
                return True
        except Exception as e:
            self.logger.error(f"Error writing to file {file_path}: {e}")
            return False

    def delete_file(self, file_path):
        try:
            os.remove(file_path)
            return True
        except Exception as e:
            self.logger.error(f"Error deleting file {file_path}: {e}")
            return False

    def get_system_info(self):
        try:
            return {
                "os": os.name,
                "platform": os.sys.platform,
                "cwd": os.getcwd()
            }
        except Exception as e:
            self.logger.error(f"Error getting system info: {e}")
            return None

    def monitor_system(self):
        try:
            # Example monitoring logic
            cpu_usage = self.execute_command("wmic cpu get loadpercentage")
            memory_usage = self.execute_command("systeminfo | findstr /C:\"Total Physical Memory\"")
            return {
                "cpu_usage": cpu_usage,
                "memory_usage": memory_usage
            }
        except Exception as e:
            self.logger.error(f"Error monitoring system: {e}")
            return None
