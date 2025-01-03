import base64
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import padding

class AdvancedDecryption:
    def __init__(self):
        self.backend = default_backend()

    def decrypt_data(self, encrypted_data, key, iv):
        cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=self.backend)
        decryptor = cipher.decryptor()
        padded_data = decryptor.update(encrypted_data) + decryptor.finalize()
        unpadder = padding.PKCS7(algorithms.AES.block_size).unpadder()
        data = unpadder.update(padded_data) + unpadder.finalize()
        return data

    def downgrade_encryption(self, encrypted_data, key, iv):
        # Implement encryption downgrading logic
        downgraded_data = self.decrypt_data(encrypted_data, key, iv)
        return downgraded_data

    def decrypt_collected_data(self, encrypted_data, key, iv):
        decrypted_data = self.decrypt_data(encrypted_data, key, iv)
        return decrypted_data

    def render(self):
        return "Advanced Decryption Module: Ready to automatically decrypt collected data, including encryption downgrading and decryption of encrypted data."
