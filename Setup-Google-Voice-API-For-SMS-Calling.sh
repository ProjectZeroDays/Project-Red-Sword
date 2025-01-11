#!/bin/bash

# Request the client ID
read -p "Enter your client ID: " CLIENT_ID

# Request the client secret
read -p "Enter your client secret: " CLIENT_SECRET

# Request the project ID
read -p "Enter your project ID: " PROJECT_ID

# Request the voice API client ID
read -p "Enter your voice API client ID: " VOICE_API_CLIENT_ID

# Request the voice API client secret
read -p "Enter your voice API client secret: " VOICE_API_CLIENT_SECRET

# Request the voice API project ID
read -p "Enter your voice API project ID: " VOICE_API_PROJECT_ID

# Request the service account key file
read -p "Enter the path to the service account key file: " SERVICE_ACCOUNT_KEY_FILE

# Request the voice API credentials
read -p "Enter the path to the voice API credentials file: " VOICE_API_CREDENTIALS_FILE

# Request the logs file
read -p "Enter the path to the logs file: " LOGS_FILE

# Set the environment variables
export CLIENT_ID=$CLIENT_ID
export CLIENT_SECRET=$CLIENT_SECRET
export PROJECT_ID=$PROJECT_ID
export VOICE_API_CLIENT_ID=$VOICE_API_CLIENT_ID
export VOICE_API_CLIENT_SECRET=$VOICE_API_CLIENT_SECRET
export VOICE_API_PROJECT_ID=$VOICE_API_PROJECT_ID

# Reload the .bashrc file
source ~/.bashrc

# Create the project directory
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# Create the necessary directories and files
mkdir -p app requirements config logs

# Create the app file
echo "from flask import Flask, request, jsonify
import os
import json
import requests

app = Flask(__name__)

@app.route('/make_call', methods=['POST'])
def make_call():
    request_body = request.get_json()
    client_id = os.environ['CLIENT_ID']
    client_secret = os.environ['CLIENT_SECRET']
    project_id = os.environ['PROJECT_ID']
    voice_api_client_id = os.environ['VOICE_API_CLIENT_ID']
    voice_api_client_secret = os.environ['VOICE_API_CLIENT_SECRET']
    voice_api_project_id = os.environ['VOICE_API_PROJECT_ID']

    response = requests.post(
        f'https://accounts.google.com/o/oauth2/v2/auth/userinfo',
        headers={'Content-Type': 'application/x-www-form-urlencoded'},
        data={
            'access_type': 'offline',
            'client_id': client_id,
            'client_secret': client_secret,
            'grant_type': 'offline_access'
        }
    )

    response = requests.post(
        f'https://accounts.google.com/o/oauth2/v2/auth/userinfo',
        headers={'Content-Type': 'application/x-www-form-urlencoded'},
        data={
            'access_type': 'offline',
            'client_id': client_id,
            'client_secret': client_secret,
            'grant_type': 'offline_access',
            'id': response.json()['id']
        }
    )

    with open('service_account_key.json', 'w') as service_account_key_file:
        service_account_key_file.write(response.json()['access_token'])

    response = requests.post(
        f'https://accounts.google.com/o/oauth2/v2/auth/userinfo',
        headers={'Content-Type': 'application/x-www-form-urlencoded'},
        data={
            'access_type': 'offline',
            'client_id': voice_api_client_id,
            'client_secret': voice_api_client_secret,
            'grant_type': 'offline_access',
            'id': response.json()['id']
        }
    )

    with open(f'voice_api_client_id.json', 'w') as voice_api_client_id_file:
        voice_api_client_id_file.write(response.json()['access_token'])

    with open(f'config.json', 'w') as config_file:
        config = {
            'client_id': client_id,
            'client_secret': client_secret,
            'project_id': project_id,
            'voice_api_client_id': voice_api_client_id,
            'voice_api_client_secret': voice_api_client_secret,
            'voice_api_project_id': voice_api_project_id
        }
        config_file.write(json.dumps(config))

    with open(f'requirements.txt', 'w') as requirements_file:
        requirements_file.write('flask flask-sqlalchemy google-cloud-voice google-api-python-client\n')

    with open(f'app.py', 'w') as app_file:
        app_file.write("from flask import Flask, request, jsonify
import os
import json
import requests

app = Flask(__name__)

@app.route('/make_call', methods=['POST'])
def make_call():
    request_body = request.get_json()
    client_id = os.environ['CLIENT_ID']
    client_secret = os.environ['CLIENT_SECRET']
    project_id = os.environ['PROJECT_ID']
    voice_api_client_id = os.environ['VOICE_API_CLIENT_ID']
    voice_api_client_secret = os.environ['VOICE_API_CLIENT_SECRET']
    voice_api_project_id = os.environ['VOICE_API_PROJECT_ID']

    response = requests.post(
        f'projects/{voice_api_project_id}/locations/{client.location_code}/voices/{client.voice_name}/recordings/record',
        data={'media_body': 'recording', 'caller_id': request_body.get('caller_id')}
    )

    return jsonify({'message': 'Recorded successfully'})

if __name__ == '__main__':
    app.run(debug=True)")

# Create the logs file
touch logs.txt