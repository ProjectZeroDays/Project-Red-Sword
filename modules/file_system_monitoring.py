import os
import time
import logging

class FileSystemMonitoring:
    def __init__(self, directory):
        self.directory = directory
        self.files_snapshot = self.snapshot_files()
        self.logger = logging.getLogger("FileSystemMonitoring")
        self.logger.setLevel(logging.INFO)
        handler = logging.FileHandler("file_system_monitoring.log")
        handler.setFormatter(logging.Formatter('%(asctime)s - %(message)s'))
        self.logger.addHandler(handler)

    def snapshot_files(self):
        files_snapshot = {}
        for root, _, files in os.walk(self.directory):
            for file in files:
                file_path = os.path.join(root, file)
                files_snapshot[file_path] = os.path.getmtime(file_path)
        return files_snapshot

    def monitor_changes(self):
        while True:
            current_snapshot = self.snapshot_files()
            self.detect_changes(current_snapshot)
            self.files_snapshot = current_snapshot
            time.sleep(10)

    def detect_changes(self, current_snapshot):
        added_files = [file for file in current_snapshot if file not in self.files_snapshot]
        removed_files = [file for file in self.files_snapshot if file not in current_snapshot]
        modified_files = [file for file in current_snapshot if file in self.files_snapshot and current_snapshot[file] != self.files_snapshot[file]]

        for file in added_files:
            self.logger.info(f"File added: {file}")
        for file in removed_files:
            self.logger.info(f"File removed: {file}")
        for file in modified_files:
            self.logger.info(f"File modified: {file}")

    def start_monitoring(self):
        self.logger.info(f"Starting file system monitoring on directory: {self.directory}")
        self.monitor_changes()
