from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from twilio.rest import Client
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail
import paramiko

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///users.db"
db = SQLAlchemy(app)

# Twilio API key and auth token
twilio_account_sid = "your_twilio_account_sid"
twilio_auth_token = "your_twilio_auth_token"
twilio_client = Client(twilio_account_sid, twilio_auth_token)

# SendGrid API key
sendgrid_api_key = "your_sendgrid_api_key"

# Paramiko SSH connection
ssh = paramiko.SSHClient()

@app.route("/register", methods=["POST"])
def register():
    username = request.json["username"]
    password = request.json["password"]
    user = User(username=username, password=password)
    db.session.add(user)
    db.session.commit()
    return jsonify({"message": "User created successfully"})

@app.route("/login", methods=["POST"])
def login():
    username = request.json["username"]
    password = request.json["password"]
    user = User.query.filter_by(username=username).first()
    if user and user.password == password:
        return jsonify({"message": "User logged in successfully"})
    else:
        return jsonify({"message": "Invalid username or password"})

@app.route("/commands", methods=["GET"])
def display_commands():
    return jsonify({"commands": ["deploy_exploit", "deploy_sms_message", "deploy_email_message", "control_device_remote", "privilege_escalation", "advanced_commands"]})

@app.route("/deploy", methods=["POST"])
def deploy_exploit():
    ip = request.json["ip"]
    port = request.json["port"]
    phone = request.json["phone"]
    email = request.json["email"]
    deploy_exploit(ip, port, phone, email)

@app.route("/sms", methods=["POST"])
def deploy_sms_message():
    ip = request.json["ip"]
    port = request.json["port"]
    phone_number = request.json["phone_number"]
    message = request.json["message"]
    deploy_sms_message(ip, port, phone_number, message)

@app.route("/email", methods=["POST"])
def deploy_email_message():
    ip = request.json["ip"]
    port = request.json["port"]
    email_address = request.json["email_address"]
    message = request.json["message"]
    deploy_email_message(ip, port, email_address, message)

@app.route("/control", methods=["POST"])
def control_device_remote():
    ip = request.json["ip"]
    port = request.json["port"]
    phone = request.json["phone"]
    email = request.json["email"]
    control_device_remote(ip, port, phone, email)

@app.route("/privilege_escalation", methods=["POST"])
def privilege_escalation():
    ip = request.json["ip"]
    port = request.json["port"]
    phone = request.json["phone"]
    email = request.json["email"]
    privilege_escalation(ip, port, phone, email)

@app.route("/advanced_commands", methods=["GET"])
def advanced_commands():
    return jsonify({"commands": ["get_user_info", "get_system_info", "get_network_info"]})

if __name__ == "__main__":
    app.run(debug=True)