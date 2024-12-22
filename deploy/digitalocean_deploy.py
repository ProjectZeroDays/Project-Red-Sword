
# DigitalOcean Deployment Script
import requests
import time

DO_API_TOKEN = "your_digitalocean_api_token"

def create_droplet():
    print("Creating a new droplet for the C2 server...")
    response = requests.post(
        "https://api.digitalocean.com/v2/droplets",
        headers={
            "Authorization": f"Bearer {DO_API_TOKEN}",
            "Content-Type": "application/json"
        },
        json={
            "name": "c2-server",
            "region": "nyc3",
            "size": "s-1vcpu-1gb",
            "image": "ubuntu-20-04-x64"
        }
    )
    droplet_data = response.json()
    time.sleep(60)
    return droplet_data
