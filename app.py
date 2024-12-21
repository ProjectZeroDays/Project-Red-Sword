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
    cloud_native_applications.render()
)

main.append(dashboard)
