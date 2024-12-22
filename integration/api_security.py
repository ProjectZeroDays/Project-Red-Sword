
from flask import Flask, request, jsonify
import os

app = Flask(__name__)

@app.route('/secure-endpoint', methods=['POST'])
def secure_endpoint():
    secret = os.getenv("API_SECRET", "default_secret")
    data = request.json
    if "api_key" not in data or data["api_key"] != secret:
        return jsonify({"status": "failure", "error": "Unauthorized"}), 401
    if "command" in data and isinstance(data["command"], str):
        command = data["command"]
        if command.isalnum():
            return jsonify({"status": "success", "output": f"Command '{command}' executed securely"})
    return jsonify({"status": "failure", "error": "Invalid command"}), 400

if __name__ == "__main__":
    app.run(debug=True, port=5000)
