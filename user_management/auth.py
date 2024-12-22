
import hashlib

users = {
    "admin": {"password": hashlib.sha256("admin123".encode()).hexdigest(), "role": "admin"},
    "user": {"password": hashlib.sha256("user123".encode()).hexdigest(), "role": "user"}
}

def authenticate(username, password):
    hashed_password = hashlib.sha256(password.encode()).hexdigest()
    user = users.get(username)
    if user and user["password"] == hashed_password:
        return {"username": username, "role": user["role"]}
    return None

# Example Usage
auth_result = authenticate("admin", "admin123")
if auth_result:
    print(f"Authenticated as {auth_result['role']}")
else:
    print("Authentication failed")
