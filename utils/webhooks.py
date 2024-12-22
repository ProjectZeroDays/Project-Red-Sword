
import requests

def send_webhook(url, message):
    payload = {"text": message}
    response = requests.post(url, json=payload)
    return response.status_code

# Example Usage
status = send_webhook("https://hooks.slack.com/services/your/webhook/url", "Deployment successful!")
print(f"Webhook status: {status}")
