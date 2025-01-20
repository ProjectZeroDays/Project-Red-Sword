from cryptography.fernet import Fernet

def encrypt_data(data):
    key = Fernet.generate_key()
    cipher_suite = Fernet(key)
    encrypted_data = cipher_suite.encrypt(data.encode())
    return encrypted_data, key

def decrypt_data(encrypted_data, key):
    cipher_suite = Fernet(key)
    return cipher_suite.decrypt(encrypted_data).decode()

def encrypt_intercepted_data(data):
    return encrypt_data(data)

def decrypt_intercepted_data(encrypted_data, key):
    return decrypt_data(encrypted_data, key)
