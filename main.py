import os
import subprocess
from utils.helpers import load_config

def start_all_services():
    config = load_config("config/config.json")
    services = config["services"]
    for service in services:
        subprocess.Popen(["python", service])
    print("All services started!")

if __name__ == "__main__":
    start_all_services()
