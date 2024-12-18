import bcrypt
import secrets

def generate_password(password):
    return bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

def verify_password(password, hashed_password):
    return bcrypt.checkpw(password.encode('utf-8'), hashed_password.encode('utf-8'))

def generate_random_number(length):
    return secrets.randbelow(10**length)

def generate_random_string(length):
    return secrets.token_urlsafe(length)
