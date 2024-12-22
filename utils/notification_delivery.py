
# SMS and Email Delivery Logic
from twilio.rest import Client
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail

def send_sms(phone_number, message, account_sid, auth_token):
    client = Client(account_sid, auth_token)
    message = client.messages.create(
        body=message,
        from_="+1234567890",
        to=phone_number
    )
    return message.sid

def send_email(recipient_email, message, sendgrid_api_key):
    sg = SendGridAPIClient(api_key=sendgrid_api_key)
    email = Mail(
        from_email="your_email@example.com",
        to_emails=recipient_email,
        subject="Notification",
        plain_text_content=message
    )
    response = sg.send(email)
    return response.status_code
