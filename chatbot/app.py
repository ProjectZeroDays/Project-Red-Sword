from flask import Flask, render_template, request, jsonify
from database.models import DocumentAnalysis
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

app = Flask(__name__)

DATABASE_URL = "sqlite:///document_analysis.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

def scan_network():
    # Placeholder function for scanning network
    devices = ["Device1", "Device2", "Device3"]
    return devices

def deploy_exploit(target):
    # Placeholder function for deploying exploit
    if target in ["Device1", "Device2", "Device3"]:
        return "Exploit deployed successfully!"
    return "Exploit deployment failed."

def save_scan_results_to_db(source, title, links, error):
    session = SessionLocal()
    try:
        scan_result = DocumentAnalysis(
            source=source,
            title=title,
            links=links,
            error=error
        )
        session.add(scan_result)
        session.commit()
    except Exception as e:
        print(f"Error saving scan results to database: {e}")
    finally:
        session.close()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/scan_network', methods=['POST'])
def scan_network_endpoint():
    devices = scan_network()
    vulnerabilities = assess_vulnerabilities(devices)
    save_scan_results_to_db("network_scan", "Network Scan Results", str(vulnerabilities), None)
    return jsonify(vulnerabilities)

@app.route('/deploy_exploit', methods=['POST'])
def deploy_exploit_endpoint():
    target = request.json.get('target')
    result = deploy_exploit(target)
    save_scan_results_to_db("exploit_deployment", "Exploit Deployment Results", target, result)
    return jsonify({"result": result})

if __name__ == "__main__":
    app.run(debug=True)
