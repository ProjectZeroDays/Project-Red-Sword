import os
import subprocess
from flask import Flask
from exploits.exploits2 import deploy_exploit_route, deploy_sms_message_route, deploy_email_message_route
from modules.exploits2 import control_device_remote_route, privilege_escalation_route, advanced_commands_route
from modules.zero_day_exploits import identify_vulnerability_route, develop_exploit_route, deploy_exploit_route as zero_day_deploy_exploit_route
from c2_dashboard import render_c2_dashboard
from dashboard.dashboard import dashboard, admin_dashboard, compliance_dashboard, training_dashboard
from gui.dashboard import Dashboard

app = Flask(__name__)

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
    app.run(debug=True)
    start_all_services()
