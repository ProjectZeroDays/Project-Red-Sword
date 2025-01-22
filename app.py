import io
import random
import logging
from typing import List, Tuple
import re
import os

import aiohttp
import panel as pn
from PIL import Image
from transformers import CLIPModel, CLIPProcessor

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

from modules.device_control import DeviceControl
from modules.windows_control import WindowsControl
from modules.macos_control import MacOSControl
from modules.linux_control import LinuxControl
from modules.android_control import AndroidControl
from modules.ios_control import iOSControl
from modules.advanced_device_control import AdvancedDeviceControl

from backend.code_parser import CodeParser
from backend.pipeline_manager import PipelineManager

import pika
from kafka import KafkaProducer, KafkaConsumer

from modules.otp_interceptor import OTPInterceptor

pn.extension(design="bootstrap", sizing_mode="stretch_width")

ICON_URLS = {
    "brand-github": "https://github.com/holoviz/panel",
    "brand-twitter": "https://twitter.com/Panel_Org",
    "brand-linkedin": "https://www.linkedin.com/company/panel-org",
    "message-circle": "https://discourse.holoviz.org/",
    "brand-discord": "https://discord.gg/AXRHnJU6sP",
}

# Configure logging
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')


async def random_url(_):
    try:
        pet = random.choice(["cat", "dog"])
        api_url = f"https://api.the{pet}api.com/v1/images/search"
        async with aiohttp.ClientSession() as session:
            async with session.get(api_url) as resp:
                resp.raise_for_status()
                return (await resp.json())[0]["url"]
    except aiohttp.ClientError as e:
        logging.error(f"API request failed: {e}")
        return None
    except Exception as e:
        logging.error(f"Unexpected error: {e}")
        return None


@pn.cache
def load_processor_model(
    processor_name: str, model_name: str
) -> Tuple[CLIPProcessor, CLIPModel]:
    processor = CLIPProcessor.from_pretrained(processor_name)
    model = CLIPModel.from_pretrained(model_name)
    return processor, model


async def open_image_url(image_url: str) -> Image:
    retries = 3
    for _ in range(retries):
        try:
            async with aiohttp.ClientSession() as session:
                async with session.get(image_url) as resp:
                    resp.raise_for_status()
                    return Image.open(io.BytesIO(await resp.read()))
        except aiohttp.ClientError as e:
            logging.error(f"HTTP request failed: {e}")
        except Exception as e:
            logging.error(f"Unexpected error: {e}")
    return None


def get_similarity_scores(class_items: List[str], image: Image) -> List[float]:
    processor, model = load_processor_model(
        "openai/clip-vit-base-patch32", "openai/clip-vit-base-patch32"
    )
    inputs = processor(
        text=class_items,
        images=[image],
        return_tensors="pt",  # pytorch tensors
    )
    outputs = model(**inputs)
    logits_per_image = outputs.logits_per_image
    class_likelihoods = logits_per_image.softmax(dim=1).detach().numpy()
    return class_likelihoods[0]


async def process_inputs(class_names: List[str], image_url: str):
    """
    High level function that takes in the user inputs and returns the
    classification results as panel objects.
    """
    try:
        main.disabled = True
        if not image_url:
            yield "##### ⚠️ Provide an image URL"
            return

        # Check if image_url is a valid URL
        if not re.match(r'^(http|https)://', image_url):
            yield "##### ⚠️ Invalid URL provided"
            return

        if not class_names:
            yield "##### ⚠️ Provide class names"
            return
    
        yield "##### ⚙ Fetching image and running model..."
        try:
            pil_img = await open_image_url(image_url)
            if pil_img is None:
                yield "##### 😔 Something went wrong, please try a different URL!"
                return
            img = pn.pane.Image(pil_img, height=400, align="center")
        except Exception as e:
            logging.error(f"Error processing image URL: {e}")
            yield f"##### 😔 Something went wrong, please try a different URL!"
            return
    
        class_items = class_names.split(",")
        class_likelihoods = get_similarity_scores(class_items, pil_img)
    
        # build the results column
        results = pn.Column("##### 🎉 Here are the results!", img)
    
        for class_item, class_likelihood in zip(class_items, class_likelihoods):
            row_label = pn.widgets.StaticText(
                name=class_item.strip(), value=f"{class_likelihood:.2%}", align="center"
            )
            row_bar = pn.indicators.Progress(
                value=int(class_likelihood * 100),
                sizing_mode="stretch_width",
                bar_color="secondary",
                margin=(0, 10),
                design=pn.theme.Material,
            )
            results.append(pn.Column(row_label, row_bar))
        yield results
    finally:
        main.disabled = False


# create widgets
randomize_url = pn.widgets.Button(name="Randomize URL", align="end")

image_url = pn.widgets.TextInput(
    name="Image URL to classify",
    value=pn.bind(random_url, randomize_url),
)
class_names = pn.widgets.TextInput(
    name="Comma separated class names",
    placeholder="Enter possible class names, e.g. cat, dog",
    value="cat, dog, parrot",
)

input_widgets = pn.Column(
    "##### 😊 Click randomize or paste a URL to start classifying!",
    pn.Row(image_url, randomize_url),
    class_names,
)

# add interactivity
interactive_result = pn.panel(
    pn.bind(process_inputs, image_url=image_url, class_names=class_names),
    height=600,
)

# add footer
footer_row = pn.Row(pn.Spacer(), align="center")
for icon, url in ICON_URLS.items():
    href_button = pn.widgets.Button(icon=icon, width=35, height=35)
    href_button.js_on_click(code=f"window.open('{url}')")
    footer_row.append(href_button)
footer_row.append(pn.Spacer())

# create dashboard
main = pn.WidgetBox(
    input_widgets,
    interactive_result,
    footer_row,
)

title = "Panel Demo - Image Classification"
pn.template.BootstrapTemplate(
    title=title,
    main=main,
    main_max_width="min(50%, 698px)",
    header_background="#F08080",
).servable(title=title)

# Initialize real-time threat intelligence and monitoring modules
try:
    threat_intelligence = RealTimeThreatIntelligence(api_key=os.getenv("REAL_TIME_THREAT_INTELLIGENCE_API_KEY"))
    monitoring = RealTimeMonitoring(threat_intelligence_module=threat_intelligence)
except Exception as e:
    logging.error(f"Error initializing real-time threat intelligence and monitoring modules: {e}")

# Initialize and integrate new modules in the main function
try:
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
    device_control = DeviceControl()
    windows_control = WindowsControl()
    macos_control = MacOSControl()
    linux_control = LinuxControl()
    android_control = AndroidControl()
    ios_control = IOSControl()
    advanced_device_control = AdvancedDeviceControl()
    code_parser = CodeParser("sample_code")
    pipeline_manager = PipelineManager()
    otp_interceptor = OTPInterceptor(
        email_config={
            'host': 'your_email_host',
            'username': 'your_email_username',
            'password': 'your_email_password'
        },
        twilio_config={
            'account_sid': 'your_twilio_account_sid',
            'auth_token': 'your_twilio_auth_token'
        }
    )
except Exception as e:
    logging.error(f"Error initializing modules: {e}")

# Integrate the ThreatIntelligence module with RealTimeMonitoring
try:
    monitoring.threat_intelligence_module = advanced_threat_intelligence
except Exception as e:
    logging.error(f"Error integrating ThreatIntelligence module with RealTimeMonitoring: {e}")

# Add real-time threat data analysis using the ThreatIntelligence module
async def analyze_threat_data():
    try:
        threat_data = await advanced_threat_intelligence.get_threat_intelligence()
        analyzed_data = advanced_threat_intelligence.process_data(threat_data)
        return analyzed_data
    except Exception as e:
        logging.error(f"Error analyzing threat data: {e}")

# Update the RealTimeThreatIntelligence initialization to include the ThreatIntelligence module
try:
    threat_intelligence_module = RealTimeThreatIntelligence(api_key="YOUR_API_KEY")
    threat_intelligence_module.threat_intelligence = advanced_threat_intelligence
except Exception as e:
    logging.error(f"Error updating RealTimeThreatIntelligence initialization: {e}")

# Add real-time threat data monitoring using the ThreatIntelligence module
async def monitor_threat_data():
    try:
        threat_data = await advanced_threat_intelligence.get_threat_intelligence()
        for threat in threat_data:
            if threat["severity"] > 0.8:
                monitoring.trigger_alert(threat)
    except Exception as e:
        logging.error(f"Error monitoring threat data: {e}")

# Integrate the AutomatedIncidentResponse module with RealTimeMonitoring
try:
    monitoring.automated_incident_response = automated_incident_response
except Exception as e:
    logging.error(f"Error integrating AutomatedIncidentResponse module with RealTimeMonitoring: {e}")

# Integrate the AIRedTeaming module with RealTimeMonitoring
try:
    monitoring.ai_red_teaming = ai_red_teaming
except Exception as e:
    logging.error(f"Error integrating AIRedTeaming module with RealTimeMonitoring: {e}")

# Integrate the APTSimulation module with RealTimeMonitoring
try:
    monitoring.apt_simulation = apt_simulation()
except Exception as e:
    logging.error(f"Error integrating APTSimulation module with RealTimeMonitoring: {e}")

# Integrate the PredictiveAnalytics module with RealTimeMonitoring
try:
    monitoring.predictive_analytics = predictive_analytics
except Exception as e:
    logging.error(f"Error integrating PredictiveAnalytics module with RealTimeMonitoring: {e}")

# Integrate the MachineLearningAI module with RealTimeMonitoring
try:
    monitoring.machine_learning_ai = machine_learning_ai
except Exception as e:
    logging.error(f"Error integrating MachineLearningAI module with RealTimeMonitoring: {e}")

# Integrate the DataVisualization module with RealTimeMonitoring
try:
    monitoring.data_visualization = data_visualization
except Exception as e:
    logging.error(f"Error integrating DataVisualization module with RealTimeMonitoring: {e}")

# Integrate the CloudExploitation module with RealTimeMonitoring
try:
    monitoring.cloud_exploitation = cloud_exploitation
except Exception as e:
    logging.error(f"Error integrating CloudExploitation module with RealTimeMonitoring: {e}")

# Integrate the IoTExploitation module with RealTimeMonitoring
try:
    monitoring.iot_exploitation = iot_exploitation
except Exception as e:
    logging.error(f"Error integrating IoTExploitation module with RealTimeMonitoring: {e}")

# Integrate the QuantumComputing module with RealTimeMonitoring
try:
    monitoring.quantum_computing = quantum_computing
except Exception as e:
    logging.error(f"Error integrating QuantumComputing module with RealTimeMonitoring: {e}")

# Integrate the EdgeComputing module with RealTimeMonitoring
try:
    monitoring.edge_computing = edge_computing
except Exception as e:
    logging.error(f"Error integrating EdgeComputing module with RealTimeMonitoring: {e}")

# Integrate the ServerlessComputing module with RealTimeMonitoring
try:
    monitoring.serverless_computing = serverless_computing
except Exception as e:
    logging.error(f"Error integrating ServerlessComputing module with RealTimeMonitoring: {e}")

# Integrate the MicroservicesArchitecture module with RealTimeMonitoring
try:
    monitoring.microservices_architecture = microservices_architecture
except Exception as e:
    logging.error(f"Error integrating MicroservicesArchitecture module with RealTimeMonitoring: {e}")

# Integrate the CloudNativeApplications module with RealTimeMonitoring
try:
    monitoring.cloud_native_applications = cloud_native_applications
except Exception as e:
    logging.error(f"Error integrating CloudNativeApplications module with RealTimeMonitoring: {e}")

# Integrate the DeviceControl module with RealTimeMonitoring
try:
    monitoring.device_control = device_control
except Exception as e:
    logging.error(f"Error integrating DeviceControl module with RealTimeMonitoring: {e}")

# Integrate the WindowsControl module with RealTimeMonitoring
try:
    monitoring.windows_control = windows_control
except Exception as e:
    logging.error(f"Error integrating WindowsControl module with RealTimeMonitoring: {e}")

# Integrate the MacOSControl module with RealTimeMonitoring
try:
    monitoring.macos_control = macos_control
except Exception as e:
    logging.error(f"Error integrating MacOSControl module with RealTimeMonitoring: {e}")

# Integrate the LinuxControl module with RealTimeMonitoring
try:
    monitoring.linux_control = linux_control
except Exception as e:
    logging.error(f"Error integrating LinuxControl module with RealTimeMonitoring: {e}")

# Integrate the AndroidControl module with RealTimeMonitoring
try:
    monitoring.android_control = android_control
except Exception as e:
    logging.error(f"Error integrating AndroidControl module with RealTimeMonitoring: {e}")

# Integrate the iOSControl module with RealTimeMonitoring
try:
    monitoring.ios_control = ios_control
except Exception as e:
    logging.error(f"Error integrating iOSControl module with RealTimeMonitoring: {e}")

# Integrate the AdvancedDeviceControl module with RealTimeMonitoring
try:
    monitoring.advanced_device_control = advanced_device_control
except Exception as e:
    logging.error(f"Error integrating AdvancedDeviceControl module with RealTimeMonitoring: {e}")

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
        "zero_day_exploits": "Manages zero-day exploits.",
        "device_control": "Controls various device functions.",
        "windows_control": "Controls Windows devices.",
        "macos_control": "Controls macOS devices.",
        "linux_control": "Controls Linux devices.",
        "android_control": "Controls Android devices.",
        "ios_control": "Controls iOS devices.",
        "advanced_device_control": "Provides advanced device control features.",
        "code_parser": "Parses and analyzes code.",
        "pipeline_manager": "Manages pipelines for various tasks."
    }
    return tool_tips

tool_tips = add_tool_tips()

# Add a continue button for the AI chatbot to continue incomplete responses
continue_button = pn.widgets.Button(name="Continue", button_type="primary")

# Add a download icon button for downloading zip files of projects
download_button = pn.widgets.Button(name="Download .zip", button_type="primary", icon="download")

# Update the dashboard to display real-time insights and analytics
dashboard = pn.Column(
    "### Advanced Capabilities Dashboard",
    pn.pane.Markdown("Welcome to the Advanced Capabilities Dashboard. Here you can monitor and manage advanced security features."),
    advanced_threat_intelligence.render(),
    predictive_analytics.render(),
    automated_incident_response.render(),
    ai_red_teaming.render(),
    apt_simulation.render(),
    machine_learning_ai.render(),
    data_visualization.render(),
    blockchain_logger.render(),
    cloud_exploitation.render(),
    iot_exploitation.render(),
    quantum_computing.render(),
    edge_computing.render(),
    serverless_computing.render(),
    microservices_architecture.render(),
    cloud_native_applications.render(),
    advanced_decryption.render(),
    advanced_malware_analysis.render(),
    advanced_social_engineering.render(),
    alerts_notifications.render(),
    device_fingerprinting.render(),
    exploit_payloads.render(),
    fuzzing_engine.render(),
    mitm_stingray.render(),
    network_exploitation.render(),
    vulnerability_scanner.render(),
    wireless_exploitation.render(),
    zero_day_exploits.render(),
    device_control.render(),
    windows_control.render(),
    macos_control.render(),
    linux_control.render(),
    android_control.render(),
    ios_control.render(),
    advanced_device_control.render(),
    code_parser.render(),
    pipeline_manager.render(),
    otp_interceptor.intercept_email_otp(),
    otp_interceptor.intercept_sms_otp(),
    continue_button,
    download_button
)

main.append(dashboard)

# Implement best practices for integrating message queues
def setup_message_queue():
    try:
        connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
        channel = connection.channel()
        channel.queue_declare(queue='task_queue', durable=True)
        return channel
    except Exception as e:
        logging.error(f"Error setting up message queue: {e}")
        return None

message_queue_channel = setup_message_queue()

def send_message_to_queue(message):
    try:
        if message_queue_channel:
            message_queue_channel.basic_publish(
                exchange='',
                routing_key='task_queue',
                body=message,
                properties=pika.BasicProperties(
                    delivery_mode=2,  # make message persistent
                ))
            logging.info(f"Sent message to queue: {message}")
        else:
            logging.error("Message queue channel is not available.")
    except Exception as e:
        logging.error(f"Error sending message to queue: {e}")

# Example usage of sending a message to the queue
send_message_to_queue("Test message")

def setup_kafka():
    try:
        producer = KafkaProducer(bootstrap_servers='localhost:9092')
        consumer = KafkaConsumer('my_topic', bootstrap_servers='localhost:9092', auto_offset_reset='earliest', enable_auto_commit=True, group_id='my-group')
        return producer, consumer
    except Exception as e:
        logging.error(f"Error setting up Kafka: {e}")
        return None, None

def send_message_to_kafka(producer, topic, message):
    try:
        producer.send(topic, message.encode('utf-8'))
        producer.flush()
        logging.info(f"Sent message to Kafka topic {topic}: {message}")
    except Exception as e:
        logging.error(f"Error sending message to Kafka: {e}")

def receive_message_from_kafka(consumer):
    try:
        for message in consumer:
            logging.info(f"Received message from Kafka: {message.value.decode('utf-8')}")
    except Exception as e:
        logging.error(f"Error receiving message from Kafka: {e}")

if __name__ == "__main__":
    producer, consumer = setup_kafka()
    if producer and consumer:
        send_message_to_kafka(producer, 'my_topic', 'Test Kafka message')
        receive_message_from_kafka(consumer)
