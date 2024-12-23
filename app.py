import io
import random
import logging
from typing import List, Tuple
import re

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
from modules.blockchain_logger import BlockchainLogger
from modules.exploit_payloads import ExploitPayloads
from modules.network_exploitation import NetworkExploitation
from modules.advanced_decryption import AdvancedDecryption
from modules.apt_simulation import APTSimulation
from modules.cloud_exploitation import CloudExploitation
from modules.custom_dashboards import CustomDashboards
from modules.dark_web_scraper import DarkWebScraper
from modules.data_visualization import DataVisualization
from modules.iot_exploitation import IoTExploitation
from modules.wireless_exploitation import WirelessExploitation
from modules.zero_day_exploits import ZeroDayExploits
from modules.secure_coding_frameworks import (
    ruby_secure_coding_framework,
    php_secure_coding_framework,
    go_secure_coding_framework,
    rust_secure_coding_framework,
)
from modules.secure_coding_tools import (
    java_secure_coding_tools,
    python_secure_coding_tools,
    cpp_secure_coding_tools,
    javascript_secure_coding_tools,
    ruby_secure_coding_tools,
    php_secure_coding_tools,
    go_secure_coding_tools,
    rust_secure_coding_tools,
)
from modules.secure_coding_cloud import (
    use_secure_cloud_storage,
    implement_secure_cloud_authentication,
    use_secure_cloud_communication_protocols,
    implement_secure_cloud_data_storage,
    use_secure_cloud_key_management,
)
from modules.secure_coding_cloud_tools import (
    aws_secure_coding_guidelines,
    azure_secure_coding_guidelines,
    google_cloud_secure_coding_guidelines,
    cloud_security_frameworks,
)

pn.extension(design="bootstrap", sizing_mode="stretch_width")

ICON_URLS = {
    "brand-github": "https://github.com/holoviz/panel",
    "brand-twitter": "https://twitter.com/Panel_Org",
    "brand-linkedin": "https://www.linkedin.com/company/panel-org",
    "message-circle": "https://discourse.holoviz.org/",
    "brand-discord": "https://discord.gg/AXRHnJU6sP",
}

# Configure logging
logging.basicConfig(level=logging.ERROR, format='%(asctime)s - %(levelname)s - %(message)s')

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


@pn.cache
def load_processor_model(
    processor_name: str, model_name: str
) -> Tuple[CLIPProcessor, CLIPModel]:
    processor = CLIPProcessor.from_pretrained(processor_name)
    model = CLIPModel.from_pretrained(model_name)
    return processor, model


async def open_image_url(image_url: str) -> Image:
    try:
        async with aiohttp.ClientSession() as session:
            async with session.get(image_url) as resp:
                resp.raise_for_status()
                return Image.open(io.BytesIO(await resp.read()))
    except aiohttp.ClientError as e:
        logging.error(f"HTTP request failed: {e}")
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
threat_intelligence = RealTimeThreatIntelligence(api_key="YOUR_API_KEY")
monitoring = RealTimeMonitoring(threat_intelligence_module=threat_intelligence)

# Initialize and integrate new modules in the main function
advanced_threat_intelligence = ThreatIntelligence()
predictive_analytics = PredictiveAnalytics()
automated_incident_response = AutomatedIncidentResponse()
ai_red_teaming = AIRedTeaming()
blockchain_logger = BlockchainLogger()
exploit_payloads = ExploitPayloads()
network_exploitation = NetworkExploitation()
advanced_decryption = AdvancedDecryption()
apt_simulation = APTSimulation()
cloud_exploitation = CloudExploitation()
custom_dashboards = CustomDashboards()
dark_web_scraper = DarkWebScraper()
data_visualization = DataVisualization()
iot_exploitation = IoTExploitation()
wireless_exploitation = WirelessExploitation()
zero_day_exploits = ZeroDayExploits()

# Integrate the ThreatIntelligence module with RealTimeMonitoring
monitoring.threat_intelligence_module = advanced_threat_intelligence

# Add real-time threat data analysis using the ThreatIntelligence module
async def analyze_threat_data():
    threat_data = await advanced_threat_intelligence.get_threat_intelligence()
    analyzed_data = advanced_threat_intelligence.process_data(threat_data)
    return analyzed_data

# Update the RealTimeThreatIntelligence initialization to include the ThreatIntelligence module
threat_intelligence_module = RealTimeThreatIntelligence(api_key="YOUR_API_KEY")
threat_intelligence_module.threat_intelligence = advanced_threat_intelligence

# Add real-time threat data monitoring using the ThreatIntelligence module
async def monitor_threat_data():
    threat_data = await advanced_threat_intelligence.get_threat_intelligence()
    for threat in threat_data:
        if threat["severity"] > 0.8:
            monitoring.trigger_alert(threat)

# Integrate the AutomatedIncidentResponse module with RealTimeMonitoring
monitoring.automated_incident_response = automated_incident_response

# Integrate the AIRedTeaming module with RealTimeMonitoring
monitoring.ai_red_teaming = ai_red_teaming

# Integrate the APTSimulation module with RealTimeMonitoring
monitoring.apt_simulation = apt_simulation

# Integrate the PredictiveAnalytics module with RealTimeMonitoring
monitoring.predictive_analytics = predictive_analytics

# Integrate the MachineLearningAI module with RealTimeMonitoring
monitoring.machine_learning_ai = machine_learning_ai

# Integrate the DataVisualization module with RealTimeMonitoring
monitoring.data_visualization = data_visualization

# Integrate the CloudExploitation module with RealTimeMonitoring
monitoring.cloud_exploitation = cloud_exploitation

# Integrate the IoTExploitation module with RealTimeMonitoring
monitoring.iot_exploitation = iot_exploitation

# Integrate the QuantumComputing module with RealTimeMonitoring
monitoring.quantum_computing = quantum_computing

# Integrate the EdgeComputing module with RealTimeMonitoring
monitoring.edge_computing = edge_computing

# Integrate the ServerlessComputing module with RealTimeMonitoring
monitoring.serverless_computing = serverless_computing

# Integrate the MicroservicesArchitecture module with RealTimeMonitoring
monitoring.microservices_architecture = microservices_architecture

# Integrate the CloudNativeApplications module with RealTimeMonitoring
monitoring.cloud_native_applications = cloud_native_applications

# Update the dashboard to display real-time insights and analytics
dashboard = pn.Column(
    "### Advanced Capabilities Dashboard",
    pn.pane.Markdown("Welcome to the Advanced Capabilities Dashboard. Here you can monitor and manage advanced security features."),
    advanced_threat_intelligence.render(),
    predictive_analytics.render(),
    automated_incident_response.render(),
    ai_red_teaming.render(),
    blockchain_logger.render(),
    exploit_payloads.render(),
    network_exploitation.render(),
    advanced_decryption.render(),
    apt_simulation.render(),
    cloud_exploitation.render(),
    custom_dashboards.render(),
    dark_web_scraper.render(),
    data_visualization.render(),
    iot_exploitation.render(),
    wireless_exploitation.render(),
    zero_day_exploits.render(),
    pn.pane.Markdown("### Secure Coding Insights"),
    pn.pane.Markdown(f"**Ruby Secure Coding Framework:** {ruby_secure_coding_framework()}"),
    pn.pane.Markdown(f"**PHP Secure Coding Framework:** {php_secure_coding_framework()}"),
    pn.pane.Markdown(f"**Go Secure Coding Framework:** {go_secure_coding_framework()}"),
    pn.pane.Markdown(f"**Rust Secure Coding Framework:** {rust_secure_coding_framework()}"),
    pn.pane.Markdown(f"**Java Secure Coding Tools:** {java_secure_coding_tools()}"),
    pn.pane.Markdown(f"**Python Secure Coding Tools:** {python_secure_coding_tools()}"),
    pn.pane.Markdown(f"**C++ Secure Coding Tools:** {cpp_secure_coding_tools()}"),
    pn.pane.Markdown(f"**JavaScript Secure Coding Tools:** {javascript_secure_coding_tools()}"),
    pn.pane.Markdown(f"**Ruby Secure Coding Tools:** {ruby_secure_coding_tools()}"),
    pn.pane.Markdown(f"**PHP Secure Coding Tools:** {php_secure_coding_tools()}"),
    pn.pane.Markdown(f"**Go Secure Coding Tools:** {go_secure_coding_tools()}"),
    pn.pane.Markdown(f"**Rust Secure Coding Tools:** {rust_secure_coding_tools()}"),
    pn.pane.Markdown(f"**Secure Cloud Storage:** {use_secure_cloud_storage()}"),
    pn.pane.Markdown(f"**Secure Cloud Authentication:** {implement_secure_cloud_authentication()}"),
    pn.pane.Markdown(f"**Secure Cloud Communication Protocols:** {use_secure_cloud_communication_protocols()}"),
    pn.pane.Markdown(f"**Secure Cloud Data Storage:** {implement_secure_cloud_data_storage()}"),
    pn.pane.Markdown(f"**Secure Cloud Key Management:** {use_secure_cloud_key_management()}"),
    pn.pane.Markdown(f"**AWS Secure Coding Guidelines:** {aws_secure_coding_guidelines()}"),
    pn.pane.Markdown(f"**Azure Secure Coding Guidelines:** {azure_secure_coding_guidelines()}"),
    pn.pane.Markdown(f"**Google Cloud Secure Coding Guidelines:** {google_cloud_secure_coding_guidelines()}"),
    pn.pane.Markdown(f"**Cloud Security Frameworks:** {cloud_security_frameworks()}")
)

main.append(dashboard)
