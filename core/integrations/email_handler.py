# app/core/integrations/email_handler.py

from typing import Optional, List, Dict
import imaplib
import email
import logging
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

class EmailHandler:
    def __init__(self, config):
        self.logger = logging.getLogger(__name__)
        self.config = config
        self.imap = None
        self.smtp = None
        
    async def connect(self):
        """Connect to email servers"""
        try:
            # IMAP connection
            self.imap = imaplib.IMAP4_SSL(self.config.IMAP_HOST)
            self.imap.login(self.config.EMAIL, self.config.PASSWORD)
            
            # SMTP connection
            self.smtp = smtplib.SMTP(self.config.SMTP_HOST, self.config.SMTP_PORT)
            self.smtp.starttls()
            self.smtp.login(self.config.EMAIL, self.config.PASSWORD)
            
            return True
        except Exception as e:
            self.logger.error(f"Connection error: {e}")
            return False

    async def disconnect(self):
        """Close email connections"""
        try:
            if self.imap:
                self.imap.logout()
            if self.smtp:
                self.smtp.quit()
        except Exception as e:
            self.logger.error(f"Disconnect error: {e}")

    async def fetch_recent_emails(self, folder="INBOX", limit=10) -> List[Dict]:
        """Fetch recent emails from specified folder"""
        if not isinstance(limit, int) or limit <= 0:
            self.logger.error(f"Invalid limit parameter: {limit}")
            return []
        try:
            self.imap.select(folder)
            _, messages = self.imap.search(None, "ALL")
            email_list = []
            
            for num in messages[0].split()[-limit:]:
                _, msg = self.imap.fetch(num, "(RFC822)")
                email_message = email.message_from_bytes(msg[0][1])
                
                email_data = {
                    'subject': email_message['subject'],
                    'from': email_message['from'],
                    'date': email_message['date'],
                    'body': self.get_email_body(email_message)
                }
                email_list.append(email_data)
                
            return email_list
        except Exception as e:
            self.logger.error(f"Error fetching emails: {e}")
            return []

    def get_email_body(self, email_message) -> str:
        """Extract email body from message"""
        try:
            if email_message.is_multipart():
                body = ""
                for part in email_message.walk():
                    if part.get_content_type() == "text/plain":
                        body += part.get_payload(decode=True).decode()
                return body
            return email_message.get_payload(decode=True).decode()
        except Exception as e:
            self.logger.error(f"Error extracting email body: {e}")
            return ""
