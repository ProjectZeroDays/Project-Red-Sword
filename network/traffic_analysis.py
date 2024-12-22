
from scapy.all import sniff, IP, TCP, UDP

def analyze_packet(packet):
    if IP in packet:
        ip_src = packet[IP].src
        ip_dst = packet[IP].dst
        if TCP in packet or UDP in packet:
            print(f"Packet: {ip_src} -> {ip_dst}")

def start_sniffing():
    print("Starting network traffic analysis...")
    sniff(prn=analyze_packet, filter="ip", store=0)
