
# DDNS Management with No-IP API
import requests

def update_no_ip_ddns(username, password, hostname, ip_address):
    url = f"https://dynupdate.no-ip.com/nic/update?hostname={hostname}&myip={ip_address}"
    response = requests.get(url, auth=(username, password))
    if "good" in response.text or "nochg" in response.text:
        print("DDNS updated successfully.")
    else:
        print("Failed to update DDNS.")
