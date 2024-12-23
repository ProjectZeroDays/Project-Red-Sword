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
from modules.ai_features import ai_chat_pipeline

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

# Update the dashboard to display real-time insights and analytics
dashboard = pn.Column(
    "### Advanced Capabilities Dashboard",
    pn.pane.Markdown("Welcome to the Advanced Capabilities Dashboard. Here you can monitor and manage advanced security features."),
    advanced_threat_intelligence.render(),
    predictive_analytics.render(),
    automated_incident_response.render(),
    ai_red_teaming.render(),
    blockchain_logger.render()
)

main.append(dashboard)

# New functions for AI-driven exploit generation, post-exploitation modules, and real-time notifications

def generate_exploit():
    # Placeholder for AI-driven exploit generation logic
    return "Exploit generated."

def post_exploitation_modules():
    # Placeholder for post-exploitation modules logic
    return "Post-exploitation modules executed."

def real_time_notifications():
    # Placeholder for real-time notifications logic
    return "Real-time notifications sent."

def toggle_dark_mode():
    # Placeholder for dark mode toggle logic
    return "Dark mode toggled."

def drag_and_drop_web_cards():
    # Placeholder for drag-and-drop web cards logic
    return "Drag-and-drop web cards enabled."

# New function for AI chat pipeline

def ai_chat_pipeline():
    # Placeholder for AI chat pipeline logic
    return "AI chat pipeline initiated."

# Integrate AI chat pipeline into the main dashboard

chat_pipeline_result = pn.panel(
    pn.bind(ai_chat_pipeline),
    height=600,
)

main.append(chat_pipeline_result)
