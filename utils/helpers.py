# Helper functions for the cybersecurity framework
import json

def load_config(file_path):
    with open(file_path, "r") as file:
        config = json.load(file)
    return config

def save_config(file_path, config):
    with open(file_path, "w") as file:
        json.dump(config, file, indent=4)

def log_event(event):
    print(f"Event logged: {event}")

def send_notification(message):
    print(f"Notification sent: {message}")

if __name__ == "__main__":
    print("Helper functions ready!")
