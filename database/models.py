from sqlalchemy import create_engine, Column, String, Integer, Text
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

class DocumentAnalysis(Base):
    __tablename__ = "document_analysis"
    id = Column(Integer, primary_key=True, autoincrement=True)
    source = Column(String, nullable=False)
    title = Column(String, nullable=True)
    links = Column(Text, nullable=True)
    error = Column(Text, nullable=True)

DATABASE_URL = "sqlite:///document_analysis.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base.metadata.create_all(bind=engine)

# Connect to the apps, dashboards, modules, tools, payloads, and exploits
from app_security.app_vulnerability_scanner import scan_application
from app import monitoring, threat_intelligence, advanced_threat_intelligence, predictive_analytics, automated_incident_response, ai_red_teaming, apt_simulation, machine_learning_ai, data_visualization, blockchain_logger, cloud_exploitation, iot_exploitation, quantum_computing, edge_computing, serverless_computing, microservices_architecture, cloud_native_applications
from backend.code_parser import CodeParser
from backend.pipeline_manager import PipelineManager
from c2_dashboard import C2Dashboard
from chatbot.app import scan_network, deploy_exploit
from chatbot.chatbot import handle_vulnerability_scanning, handle_exploit_deployment
from dashboard.dashboard import malware_analysis, social_engineering
from exploits.exploits2 import deploy_exploit as deploy_exploit2
from exploits.ios_framework_extracted.iOS_Zero_Click_Framework_Updated.exploits import deploy_exploit as deploy_exploit_ios
from modules.alerts_notifications import AlertsNotifications
from modules.apt_simulation import APTSimulation
