import random
import speech_recognition as sr  # For voice-to-text
import json
from network_scanner import scan_network
from vulnerability_assessor import assess_vulnerabilities
from exploit_deployer import deploy_exploit
from database.models import DocumentAnalysis
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "sqlite:///document_analysis.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

def get_response(user_input):
    """Handle user input and provide responses."""
    responses = {
        "hi": "Hello! How can I assist you today?",
        "audit status": "The last audit was completed successfully.",
        "generate report": "Generating the audit report...",
        "feedback": "We value your feedback! Please provide your comments.",
        "scan networks": "Scanning networks for vulnerabilities...",
        "deploy exploit": "Deploying the exploit...",
    }
    return responses.get(user_input.lower(), "I'm sorry, I didn't understand that.")

def handle_vulnerability_scanning():
    """Handle network scanning and vulnerability assessment."""
    devices = scan_network()
    vulnerabilities = assess_vulnerabilities(devices)
    
    # Save scan results to the database
    session = SessionLocal()
    try:
        scan_result = DocumentAnalysis(
            source="network_scan",
            title="Network Scan Results",
            links=str(vulnerabilities),
            error=None
        )
        session.add(scan_result)
        session.commit()
    except Exception as e:
        print(f"Error saving scan results to database: {e}")
    finally:
        session.close()
    
    return vulnerabilities

def handle_exploit_deployment(target):
    """Handle the deployment of exploits."""
    result = deploy_exploit(target)
    
    # Save exploit deployment results to the database
    session = SessionLocal()
    try:
        exploit_result = DocumentAnalysis(
            source="exploit_deployment",
            title="Exploit Deployment Results",
            links=target,
            error=None if result else "Exploit deployment failed"
        )
        session.add(exploit_result)
        session.commit()
    except Exception as e:
        print(f"Error saving exploit deployment results to database: {e}")
    finally:
        session.close()
    
    return "Exploit deployed successfully!" if result else "Exploit deployment failed."

def chat():
    """Main chat function to interact with users."""
    print("Welcome to the Corporate Device Security Audit Chatbot!")
    while True:
        user_input = input("You: ")
        if user_input.lower() in ["exit", "quit"]:
            print("Chatbot: Goodbye!")
            break

        # Check for voice input command
        if user_input.lower() == "voice input":
            print("Chatbot: Listening...")
            recognizer = sr.Recognizer()
            with sr.Microphone() as source:
                audio = recognizer.listen(source)
                try:
                    user_input = recognizer.recognize_google(audio)
                    print(f"You: {user_input}")
                except sr.UnknownValueError:
                    print("Chatbot: Sorry, I didn't catch that.")
                    continue

        # Process specific commands
        if "scan networks" in user_input.lower():
            vulnerabilities = handle_vulnerability_scanning()
            print(f"Chatbot: Found vulnerabilities: {vulnerabilities}")
        elif "deploy exploit" in user_input.lower():
            target = input("Enter target for exploit deployment: ")
            result = handle_exploit_deployment(target)
            print(f"Chatbot: {result}")
        else:
            response = get_response(user_input)
            print(f"Chatbot: {response}")

if __name__ == "__main__":
    chat()
