
def authenticate_user(username, password):
    print(f"Authenticating user: {username}")
    return {"authenticated": username == "admin" and password == "password123"}

if __name__ == "__main__":
    auth_result = authenticate_user("admin", "password123")
    print(f"Authentication Result: {auth_result}")
