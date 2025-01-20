import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from database.models import DocumentAnalysis
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "sqlite:///document_analysis.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class AlertsNotifications:
    def __init__(self, smtp_server, smtp_port, smtp_user, smtp_password):
        self.smtp_server = smtp_server
        self.smtp_port = smtp_port
        self.smtp_user = smtp_user
        self.smtp_password = smtp_password

    def send_email(self, recipient, subject, body):
        msg = MIMEMultipart()
        msg['From'] = self.smtp_user
        msg['To'] = recipient
        msg['Subject'] = subject

        msg.attach(MIMEText(body, 'plain'))

        try:
            with smtplib.SMTP(self.smtp_server, self.smtp_port) as server:
                server.starttls()
                server.login(self.smtp_user, self.smtp_password)
                server.sendmail(self.smtp_user, recipient, msg.as_string())
                print(f"Email sent to {recipient}")
        except Exception as e:
            print(f"Failed to send email: {e}")
            self.save_alert_to_db("email", recipient, subject, body, str(e))

    def send_alert(self, alert_type, alert_details):
        subject = f"Alert: {alert_type}"
        body = f"Details: {alert_details}"
        self.send_email("admin@example.com", subject, body)

    def notify_device_connection(self, device_id):
        subject = "Device Connected"
        body = f"Device {device_id} has been connected."
        self.send_email("admin@example.com", subject, body)

    def notify_device_disconnection(self, device_id):
        subject = "Device Disconnected"
        body = f"Device {device_id} has been disconnected."
        self.send_email("admin@example.com", subject, body)

    def save_alert_to_db(self, alert_type, recipient, subject, body, error):
        session = SessionLocal()
        try:
            alert_result = DocumentAnalysis(
                source="alerts_notifications",
                title=f"Alert: {alert_type}",
                links=f"Recipient: {recipient}, Subject: {subject}, Body: {body}",
                error=error
            )
            session.add(alert_result)
            session.commit()
        except Exception as e:
            print(f"Error saving alert to database: {e}")
        finally:
            session.close()
