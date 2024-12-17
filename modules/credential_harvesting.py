import os
import json

def extract_credentials(target_system):
    """
    Extract and store credentials from the target system.

    Args:
        target_system (str): The target system to extract credentials from.

    Returns:
        str: The result of the credential extraction.
    """
    # Placeholder for credential extraction logic
    credentials = {
        "username": "admin",
        "password": "password123"
    }
    store_credentials(target_system, credentials)
    return "Credentials extracted and stored."

def store_credentials(target_system, credentials):
    """
    Store the extracted credentials in a secure location.

    Args:
        target_system (str): The target system the credentials belong to.
        credentials (dict): The extracted credentials.

    Returns:
        bool: True if credentials were stored successfully, False otherwise.
    """
    try:
        with open(f"credentials/{target_system}.json", "w") as file:
            json.dump(credentials, file)
        return True
    except Exception as e:
        print(f"Error storing credentials: {e}")
        return False

def retrieve_credentials(target_system):
    """
    Retrieve stored credentials for the given target system.

    Args:
        target_system (str): The target system to retrieve credentials for.

    Returns:
        dict: The retrieved credentials.
    """
    try:
        with open(f"credentials/{target_system}.json", "r") as file:
            credentials = json.load(file)
        return credentials
    except FileNotFoundError:
        return {}

def delete_credentials(target_system):
    """
    Delete stored credentials for the given target system.

    Args:
        target_system (str): The target system to delete credentials for.

    Returns:
        bool: True if credentials were deleted successfully, False otherwise.
    """
    try:
        os.remove(f"credentials/{target_system}.json")
        return True
    except FileNotFoundError:
        return False
    except Exception as e:
        print(f"Error deleting credentials: {e}")
        return False
