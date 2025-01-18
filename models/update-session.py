import requests

# Replace with your Hugging Face API token
api_token = "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"

# Replace with your repository name
repo_name = "googlesprojectzero/empire"

# Set the API endpoint and headers
endpoint = f"https://api.huggingface.co/repos/{repo_name}/tree/main/requirements.txt"
headers = {
    "Authorization": f"Bearer {api_token}",
    "Content-Type": "application/json",
}

# Set the required dependencies
requirements = ["flask==2.2.2"]

# Create the payload
payload = {
    "content": "\n".join(requirements),
    "branch": "main",
    "commit_message": "Install required dependencies",
}

# Send the request
response = requests.put(endpoint, headers=headers, json=payload)

# Check the response
if response.status_code == 200:
    print("Requirements installed successfully")
else:
    print("Failed to install requirements")
