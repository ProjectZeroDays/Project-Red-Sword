import os
import subprocess

def start_all_services():
    services = [
        "cybersecurity_framework/advanced_attacks/attack_simulations/sql_injection.py",
        "cybersecurity_framework/app_security/sast.py",
        "cybersecurity_framework/app_security/dast.py",
        "cybersecurity_framework/atp/sandbox.py",
        "cybersecurity_framework/behavioral_analytics/uba.py",
        "cybersecurity_framework/cloud_security/casb.py",
        "cybersecurity_framework/deception_technology/honeypot.py",
        "cybersecurity_framework/compliance/automated_reporting.py",
        "cybersecurity_framework/network_security/firewall_rules.py",
        "cybersecurity_framework/threat_hunting/hunt_for_iocs.py",
        "cybersecurity_framework/threat_hunting/behavioral_hunting.py",
        "cybersecurity_framework/edr/edr_agent.py",
        "cybersecurity_framework/edr/edr_dashboard.py",
        "cybersecurity_framework/forensics/memory_dump.py",
        "cybersecurity_framework/forensics/disk_image.py",
        "cybersecurity_framework/idps/network_monitor.py",
        "cybersecurity_framework/idps/intrusion_prevention.py",
        "cybersecurity_framework/malware_analysis/static_analysis.py",
        "cybersecurity_framework/malware_analysis/dynamic_analysis.py",
        "cybersecurity_framework/penetration_testing/reconnaissance.py",
        "cybersecurity_framework/penetration_testing/exploit_execution.py",
        "cybersecurity_framework/user_management/auth.py"
    ]
    for service in services:
        subprocess.Popen(["python", service])
    print("All services started!")

if __name__ == "__main__":
    start_all_services()
