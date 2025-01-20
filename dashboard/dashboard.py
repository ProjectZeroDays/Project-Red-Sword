from flask import Flask, render_template, request, redirect, url_for, session
from functools import wraps
from modules.advanced_malware_analysis import AdvancedMalwareAnalysis
from modules.advanced_social_engineering import AdvancedSocialEngineering
from modules.real_time_threat_intelligence import RealTimeThreatIntelligence
from modules.real_time_monitoring import RealTimeMonitoring
from modules.threat_intelligence import ThreatIntelligence
from modules.predictive_analytics import PredictiveAnalytics
from modules.automated_incident_response import AutomatedIncidentResponse
from modules.ai_red_teaming import AIRedTeaming
from modules.apt_simulation import APTSimulation
from modules.machine_learning_ai import MachineLearningAI
from modules.data_visualization import DataVisualization
from modules.blockchain_logger import BlockchainLogger
from modules.cloud_exploitation import CloudExploitation
from modules.iot_exploitation import IoTExploitation
from modules.quantum_computing import QuantumComputing
from modules.edge_computing import EdgeComputing
from modules.serverless_computing import ServerlessComputing
from modules.microservices_architecture import MicroservicesArchitecture
from modules.cloud_native_applications import CloudNativeApplications
from modules.advanced_decryption import AdvancedDecryption
from modules.advanced_malware_analysis import AdvancedMalwareAnalysis
from modules.advanced_social_engineering import AdvancedSocialEngineering
from modules.alerts_notifications import AlertsNotifications
from modules.device_fingerprinting import DeviceFingerprinting
from modules.exploit_payloads import ExploitPayloads
from modules.fuzzing_engine import FuzzingEngine
from modules.mitm_stingray import MITMStingray
from modules.network_exploitation import NetworkExploitation
from modules.vulnerability_scanner import VulnerabilityScanner
from modules.wireless_exploitation import WirelessExploitation
from modules.zero_day_exploits import ZeroDayExploits
from database.models import DocumentAnalysis
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

app = Flask(__name__)
app.secret_key = 'your_secret_key'

DATABASE_URL = "sqlite:///document_analysis.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Dummy user data for RBAC
users = {
    "admin": {"password": "admin123", "role": "admin"},
    "user": {"password": "user123", "role": "user"}
}

# Role-Based Access Control (RBAC) decorator
def rbac_required(role):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            if 'username' not in session or users[session['username']]['role'] != role:
                return redirect(url_for('login'))
            return f(*args, **kwargs)
        return decorated_function
    return decorator

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        if username in users and users[username]["password"] == password:
            session["username"] = username
            return redirect(url_for("dashboard"))
        return "Invalid credentials"
    return render_template("login.html")

@app.route("/logout")
def logout():
    session.pop("username", None)
    return redirect(url_for("login"))

@app.route("/")
@rbac_required("user")
def dashboard():
    malware_analysis = AdvancedMalwareAnalysis()
    social_engineering = AdvancedSocialEngineering()
    threat_intelligence = RealTimeThreatIntelligence(api_key="YOUR_API_KEY")
    monitoring = RealTimeMonitoring(threat_intelligence_module=threat_intelligence)
    advanced_threat_intelligence = ThreatIntelligence()
    predictive_analytics = PredictiveAnalytics()
    automated_incident_response = AutomatedIncidentResponse()
    ai_red_teaming = AIRedTeaming()
    apt_simulation = APTSimulation()
    machine_learning_ai = MachineLearningAI()
    data_visualization = DataVisualization()
    blockchain_logger = BlockchainLogger()
    cloud_exploitation = CloudExploitation()
    iot_exploitation = IoTExploitation()
    quantum_computing = QuantumComputing()
    edge_computing = EdgeComputing()
    serverless_computing = ServerlessComputing()
    microservices_architecture = MicroservicesArchitecture()
    cloud_native_applications = CloudNativeApplications()
    advanced_decryption = AdvancedDecryption()
    advanced_malware_analysis = AdvancedMalwareAnalysis()
    advanced_social_engineering = AdvancedSocialEngineering()
    alerts_notifications = AlertsNotifications(smtp_server="smtp.example.com", smtp_port=587, smtp_user="user@example.com", smtp_password="password")
    device_fingerprinting = DeviceFingerprinting()
    exploit_payloads = ExploitPayloads()
    fuzzing_engine = FuzzingEngine()
    mitm_stingray = MITMStingray(interface="wlan0")
    network_exploitation = NetworkExploitation()
    vulnerability_scanner = VulnerabilityScanner()
    wireless_exploitation = WirelessExploitation()
    zero_day_exploits = ZeroDayExploits()

    monitoring.threat_intelligence_module = advanced_threat_intelligence
    monitoring.automated_incident_response = automated_incident_response
    monitoring.ai_red_teaming = ai_red_teaming
    monitoring.apt_simulation = apt_simulation
    monitoring.predictive_analytics = predictive_analytics
    monitoring.machine_learning_ai = machine_learning_ai
    monitoring.data_visualization = data_visualization
    monitoring.cloud_exploitation = cloud_exploitation
    monitoring.iot_exploitation = iot_exploitation
    monitoring.quantum_computing = quantum_computing
    monitoring.edge_computing = edge_computing
    monitoring.serverless_computing = serverless_computing
    monitoring.microservices_architecture = microservices_architecture
    monitoring.cloud_native_applications = cloud_native_applications

    # Add tool tips and advanced help options for all functions
    def add_tool_tips():
        tool_tips = {
            "advanced_threat_intelligence": "Provides advanced threat intelligence capabilities.",
            "predictive_analytics": "Utilizes predictive analytics for threat detection.",
            "automated_incident_response": "Automates incident response processes.",
            "ai_red_teaming": "AI-driven red teaming for security testing.",
            "apt_simulation": "Simulates advanced persistent threats.",
            "machine_learning_ai": "Machine learning-based AI for threat detection.",
            "data_visualization": "Visualizes data for better insights.",
            "blockchain_logger": "Logs data using blockchain technology.",
            "cloud_exploitation": "Exploits vulnerabilities in cloud environments.",
            "iot_exploitation": "Exploits vulnerabilities in IoT devices.",
            "quantum_computing": "Utilizes quantum computing for security.",
            "edge_computing": "Secures edge computing environments.",
            "serverless_computing": "Secures serverless computing environments.",
            "microservices_architecture": "Secures microservices architectures.",
            "cloud_native_applications": "Secures cloud-native applications.",
            "advanced_decryption": "Advanced decryption capabilities.",
            "advanced_malware_analysis": "Analyzes and detects advanced malware.",
            "advanced_social_engineering": "Detects and prevents social engineering attacks.",
            "alerts_notifications": "Sends alerts and notifications.",
            "device_fingerprinting": "Identifies devices using fingerprinting.",
            "exploit_payloads": "Manages exploit payloads.",
            "fuzzing_engine": "Fuzzing engine for vulnerability detection.",
            "mitm_stingray": "Manages MITM Stingray attacks.",
            "network_exploitation": "Exploits network vulnerabilities.",
            "vulnerability_scanner": "Scans for vulnerabilities.",
            "wireless_exploitation": "Exploits wireless vulnerabilities.",
            "zero_day_exploits": "Manages zero-day exploits."
        }
        return tool_tips

    tool_tips = add_tool_tips()

    # Add a continue button for the AI chatbot to continue incomplete responses
    continue_button = pn.widgets.Button(name="Continue", button_type="primary")

    # Add a download icon button for downloading zip files of projects
    download_button = pn.widgets.Button(name="Download .zip", button_type="primary", icon="download")

    # Save dashboard data to the database
    session = SessionLocal()
    try:
        dashboard_data = DocumentAnalysis(
            source="dashboard",
            title="Dashboard Data",
            links=str({
                "threats_detected": 5,
                "exploits_deployed": 3,
                "malware_analysis": malware_analysis.render(),
                "social_engineering": social_engineering.render(),
                "threat_intelligence": threat_intelligence.render(),
                "monitoring": monitoring.render(),
                "advanced_threat_intelligence": advanced_threat_intelligence.render(),
                "predictive_analytics": predictive_analytics.render(),
                "automated_incident_response": automated_incident_response.render(),
                "ai_red_teaming": ai_red_teaming.render(),
                "apt_simulation": apt_simulation.render(),
                "machine_learning_ai": machine_learning_ai.render(),
                "data_visualization": data_visualization.render(),
                "blockchain_logger": blockchain_logger.render(),
                "cloud_exploitation": cloud_exploitation.render(),
                "iot_exploitation": iot_exploitation.render(),
                "quantum_computing": quantum_computing.render(),
                "edge_computing": edge_computing.render(),
                "serverless_computing": serverless_computing.render(),
                "microservices_architecture": microservices_architecture.render(),
                "cloud_native_applications": cloud_native_applications.render(),
                "advanced_decryption": advanced_decryption.render(),
                "advanced_malware_analysis": advanced_malware_analysis.render(),
                "advanced_social_engineering": advanced_social_engineering.render(),
                "alerts_notifications": alerts_notifications.render(),
                "device_fingerprinting": device_fingerprinting.render(),
                "exploit_payloads": exploit_payloads.render(),
                "fuzzing_engine": fuzzing_engine.render(),
                "mitm_stingray": mitm_stingray.render(),
                "network_exploitation": network_exploitation.render(),
                "vulnerability_scanner": vulnerability_scanner.render(),
                "wireless_exploitation": wireless_exploitation.render(),
                "zero_day_exploits": zero_day_exploits.render()
            }),
            error=None
        )
        session.add(dashboard_data)
        session.commit()
    except Exception as e:
        print(f"Error saving dashboard data to database: {e}")
    finally:
        session.close()

    return render_template("dashboard.html", data={
        "threats_detected": 5,
        "exploits_deployed": 3,
        "malware_analysis": malware_analysis.render(),
        "social_engineering": social_engineering.render(),
        "threat_intelligence": threat_intelligence.render(),
        "monitoring": monitoring.render(),
        "advanced_threat_intelligence": advanced_threat_intelligence.render(),
        "predictive_analytics": predictive_analytics.render(),
        "automated_incident_response": automated_incident_response.render(),
        "ai_red_teaming": ai_red_teaming.render(),
        "apt_simulation": apt_simulation.render(),
        "machine_learning_ai": machine_learning_ai.render(),
        "data_visualization": data_visualization.render(),
        "blockchain_logger": blockchain_logger.render(),
        "cloud_exploitation": cloud_exploitation.render(),
        "iot_exploitation": iot_exploitation.render(),
        "quantum_computing": quantum_computing.render(),
        "edge_computing": edge_computing.render(),
        "serverless_computing": serverless_computing.render(),
        "microservices_architecture": microservices_architecture.render(),
        "cloud_native_applications": cloud_native_applications.render(),
        "advanced_decryption": advanced_decryption.render(),
        "advanced_malware_analysis": advanced_malware_analysis.render(),
        "advanced_social_engineering": advanced_social_engineering.render(),
        "alerts_notifications": alerts_notifications.render(),
        "device_fingerprinting": device_fingerprinting.render(),
        "exploit_payloads": exploit_payloads.render(),
        "fuzzing_engine": fuzzing_engine.render(),
        "mitm_stingray": mitm_stingray.render(),
        "network_exploitation": network_exploitation.render(),
        "vulnerability_scanner": vulnerability_scanner.render(),
        "wireless_exploitation": wireless_exploitation.render(),
        "zero_day_exploits": zero_day_exploits.render(),
        "continue_button": continue_button,
        "download_button": download_button
    })

@app.route("/admin")
@rbac_required("admin")
def admin_dashboard():
    return render_template("admin_dashboard.html", data={"compliance_status": "Compliant", "training_status": "Completed"})

@app.route("/compliance")
@rbac_required("admin")
def compliance_dashboard():
    return render_template("compliance_dashboard.html", data={"compliance_status": "Compliant"})

@app.route("/training")
@rbac_required("user")
def training_dashboard():
    return render_template("training_dashboard.html", data={"training_status": "Completed"})

if __name__ == "__main__":
    app.run(debug=True)
