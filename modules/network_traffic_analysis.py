import scapy.all as scapy
import logging

class NetworkTrafficAnalysis:
    def __init__(self):
        self.packets = []

    def capture_packets(self, interface="eth0"):
        """
        Capture network packets on the specified interface.

        Args:
            interface (str): The network interface to capture packets on.

        Returns:
            None
        """
        try:
            self.packets = scapy.sniff(iface=interface, prn=self.process_packet, store=True)
        except Exception as e:
            logging.error(f"Error capturing packets: {e}")

    def process_packet(self, packet):
        """
        Process a captured network packet.

        Args:
            packet: The captured network packet.

        Returns:
            None
        """
        try:
            if packet.haslayer(scapy.IP):
                ip_src = packet[scapy.IP].src
                ip_dst = packet[scapy.IP].dst
                logging.info(f"Packet captured: {ip_src} -> {ip_dst}")
        except Exception as e:
            logging.error(f"Error processing packet: {e}")

    def analyze_traffic(self):
        """
        Analyze the captured network traffic.

        Returns:
            dict: Analysis results.
        """
        analysis_results = {
            "total_packets": len(self.packets),
            "unique_sources": len(set(packet[scapy.IP].src for packet in self.packets if packet.haslayer(scapy.IP))),
            "unique_destinations": len(set(packet[scapy.IP].dst for packet in self.packets if packet.haslayer(scapy.IP))),
        }
        return analysis_results

    def save_capture(self, filename):
        """
        Save the captured packets to a file.

        Args:
            filename (str): The filename to save the packets to.

        Returns:
            None
        """
        try:
            scapy.wrpcap(filename, self.packets)
            logging.info(f"Packets saved to {filename}")
        except Exception as e:
            logging.error(f"Error saving packets: {e}")
