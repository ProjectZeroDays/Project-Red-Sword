import os
import json
import subprocess
import requests
import argparse

# Parse the command-line arguments
parser = argparse.ArgumentParser(description='Create a new project directory and install the necessary dependencies')
parser.add_argument('project_name', help='The name of the project')
args = parser.parse_args()

# Set the directories
PROJECT_DIR = args.project_name
APP_DIR = f"{PROJECT_NAME}/app"
requirements_DIR = f"{PROJECT_NAME}/requirements"
config_DIR = f"{PROJECT_NAME}/config"
logs_DIR = f"{PROJECT_NAME}/logs"

# Create the project directory
os.makedirs(PROJECT_DIR, exist_ok=True)
os.chdir(PROJECT_DIR)

# Create the app directory
os.makedirs(APP_DIR, exist_ok=True)

# Create the requirements directory
os.makedirs(requirements_DIR, exist_ok=True)

# Create the config directory
os.makedirs(config_DIR, exist_ok=True)

# Create the logs directory
os.makedirs(logs_DIR, exist_ok=True)

# Request the necessary credentials for the Google account user
client_id = input("Enter the Google account user's client ID: ")
client_secret = input("Enter the Google account user's client secret: ")
project_id = input("Enter the Google Cloud Platform project ID: ")
voice_api_client_id = input("Enter the Google Voice API client ID: ")
voice_api_client_secret = input("Enter the Google Voice API client secret: ")

# Create the service account
response = requests.post(
    "https://accounts.google.com/o/oauth2/v2/auth/userinfo",
    headers={"Content-Type": "application/x-www-form-urlencoded"},
    data={
        "access_type": "offline",
        "client_id": client_id,
        "client_secret": client_secret,
        "grant_type": "offline_access"
    }
)

# Create the service account key file
with open(f"service_account_key.json", "w") as service_account_key_file:
    service_account_key_file.write(response.json()["access_token"])

# Create the voice API credentials
response = requests.post(
    "https://accounts.google.com/o/oauth2/v2/auth/userinfo",
    headers={"Content-Type": "application/x-www-form-urlencoded"},
    data={
        "access_type": "offline",
        "client_id": voice_api_client_id,
        "client_secret": voice_api_client_secret,
        "grant_type": "offline_access",
        "id": response.json()["id"]
    }
)

# Create the voice API credentials file
with open(f"{voice_api_client_id}.json", "w") as voice_api_client_id_file:
    voice_api_client_id_file.write(response.json()["access_token"])

# Create the API keys
with open(f"{config_file}", "w") as config_file:
    config = {
        "client_id": client_id,
        "client_secret": client_secret,
        "project_id": project_id,
        "voice_api_client_id": voice_api_client_id,
        "voice_api_client_secret": voice_api_client_secret,
        "voice_api_project_id": voice_api_project_id
    }
    config_file.write(json.dumps(config))

# Create the requirements file
with open(f"{requirements_file}", "w") as requirements_file:
    requirements_file.write("flask flask-sqlalchemy google-cloud-voice google-api-python-client\n")

# Create the app file
with open(f"{app_file}", "w") as app_file:
    app_file.write("from flask import Flask, request, jsonify\n\n\napp = Flask(__name__)\n\n@app.route('/make_call', methods=['POST'])\ndef make_call():\n\n    # Get the request body\n    request_body = request.get_json()\n\n    # Make a call to the recipient's Google Voice number\n    response = client.patch(\n        f'projects/{voice_api_project_id}/locations/{client.location_code}/voices/{client.voice_name}/recordings/record',\n        data={'media_body': 'recording', 'caller_id': request_body.get('caller_id')}\n    )\n\n    # Return the response\n    return jsonify({'message': 'Recorded successfully'})\n\nmake_call()\n\nif __name__ == '__main__':\n\n    app.run(debug=True)")

# Create the logs file
with open(f"{logs_file}", "w") as logs_file:
    logs_file.write("")