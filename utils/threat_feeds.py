
import requests

def fetch_threat_intelligence():
    url = "https://example.com/threat-feeds"
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    return {"error": "Unable to fetch feeds"}

if __name__ == "__main__":
    feeds = fetch_threat_intelligence()
    print(feeds)
