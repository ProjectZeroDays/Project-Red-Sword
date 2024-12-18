import io
import random
import logging
from typing import List, Tuple
import re

import aiohttp
import panel as pn
from PIL import Image
from transformers import CLIPModel, CLIPProcessor
from flask import Flask, request, jsonify, session, redirect, url_for
from flask_sslify import SSLify
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager, UserMixin, login_user, logout_user, login_required
from flask_talisman import Talisman
import os
import secrets

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
    zero_day_exploits.render()
)

main.append(dashboard)

app = Flask(__name__)
app.config['SECRET_KEY'] = os.urandom(32)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///project_red_sword.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

sslify = SSLify(app)
limiter = Limiter(
    get_remote_address,
    app=app,
    default_limits=["200 per day", "50 per hour"]
)
db = SQLAlchemy(app)
bcrypt = Bcrypt(app)
login_manager = LoginManager(app)
login_manager.login_view = 'login'
talisman = Talisman(app)

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)

    def verify_password(self, password):
        return bcrypt.checkpw(password.encode('utf-8'), self.password.encode('utf-8'))

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

@app.route('/')
def index():
    return "Welcome to Project Red Sword"

@app.route('/login', methods=['GET', 'POST'])
@limiter.limit("10 per minute")
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        if not username or not password:
            return jsonify({'error': 'Invalid input data'}), 400

        user = User.query.filter_by(username=username).first()
        if user and user.verify_password(password):
            login_user(user)
            return jsonify({'message': 'Login successful'}), 200
        else:
            return jsonify({'error': 'Invalid username or password'}), 401

    return '''
        <form method="post">
            Username: <input type="text" name="username"><br>
            Password: <input type="password" name="password"><br>
            <input type="submit" value="Login">
        </form>
    '''

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return jsonify({'message': 'Logged out successfully'}), 200

@app.route('/register', methods=['POST'])
@limiter.limit("5 per minute")
def register():
    username = request.form.get('username')
    password = request.form.get('password')

    if not username or not password:
        return jsonify({'error': 'Invalid input data'}), 400

    existing_user = User.query.filter_by(username=username).first()
    if existing_user:
        return jsonify({'error': 'Username already exists'}), 409

    hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')
    new_user = User(username=username, password=hashed_password)
    db.session.add(new_user)
    db.session.commit()
    return jsonify({'message': 'Registration successful'}), 201

@app.route('/protected')
@login_required
def protected():
    return jsonify({'message': 'This is a protected route'}), 200

@app.route('/exploits')
@login_required
def exploits():
    exploits = get_exploit_catalogue()
    return jsonify(exploits)

@app.route('/payloads')
@login_required
def payloads():
    payloads = get_payload_catalogue()
    return jsonify(payloads)

@app.route('/post-exploitation')
@login_required
def post_exploitation():
    modules = get_advanced_post_exploitation_modules()
    return jsonify(modules)

@app.route('/memory-attacks')
@login_required
def memory_attacks():
    attacks = get_advanced_memory_attacks()
    return jsonify(attacks)

@app.route('/reverse-shells')
@login_required
def reverse_shells():
    shells = get_reverse_shells()
    return jsonify(shells)

@app.route('/paywall-bypass')
@login_required
def paywall_bypass():
    result = bypass_paywall()
    return jsonify({'result': result})

@app.route('/disclosure-pipeline')
@login_required
def disclosure():
    vulnerability = "Example Vulnerability"
    result = disclosure_pipeline(vulnerability)
    return jsonify({'result': result})

@app.route('/visualizations')
@login_required
def visualizations():
    html_fig = create_visualizations()
    return html_fig

@app.route('/defcon')
@login_required
def defcon():
    level = get_defcon_level()
    return jsonify({'defcon_level': level})

@app.route('/blockchain-log', methods=['POST'])
@login_required
def blockchain_log():
    log = request.form.get('log')
    result = add_log_to_blockchain(log)
    return jsonify({'result': result})

@app.route('/blockchain-audit')
@login_required
def blockchain_audit():
    result = get_audit_trail()
    return jsonify({'result': result})

if __name__ == '__main__':
    db.create_all()
    app.run(debug=True, ssl_context='adhoc')
