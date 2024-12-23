# scripts/user_setup.py

import json
import os

def collect_api_keys():
    """Collect API keys from the user."""
    api_keys = {}
    services = ["Gemini", "OpenAI Codex", "OpenAI 3.5 Free Tier"]

    for service in services:
        count = int(input(f"How many API keys do you want to use for {service}? (max 5): "))
        if count > 5:
            print("You can only enter a maximum of 5 API keys.")
            return
        keys = [input(f"Enter API key {i + 1} for {service}: ") for i in range(count)]
        api_keys[service] = keys

    return api_keys

def collect_sms_provider():
    """Collect the SMS provider preference from the user."""
    sms_provider = input("Which SMS provider do you want to use? (e.g., Twilio, Nexmo): ")
    return sms_provider

def save_configuration(api_keys, sms_provider):
    """Save the collected configurations to a JSON file."""
    config = {
        "api_keys": api_keys,
        "sms_provider": sms_provider
    }

    with open('config.json', 'w') as config_file:
        json.dump(config, config_file, indent=4)

    print("Configuration saved successfully.")

def main():
    print("Welcome to the Corporate Device Security Audit Setup!")
    api_keys = collect_api_keys()
    sms_provider = collect_sms_provider()
    save_configuration(api_keys, sms_provider)

if __name__ == "__main__":
    main()
