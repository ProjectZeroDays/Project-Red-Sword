import json

def get_user_preferences(user_id):
    """
    Retrieve user preferences for the given user.

    Args:
        user_id (str): The user ID.

    Returns:
        dict: The user preferences.
    """
    try:
        with open(f"user_preferences/{user_id}.json", "r") as file:
            preferences = json.load(file)
        return preferences
    except FileNotFoundError:
        return {}

def save_user_preferences(user_id, preferences):
    """
    Save user preferences for the given user.

    Args:
        user_id (str): The user ID.
        preferences (dict): The user preferences.

    Returns:
        bool: True if preferences were saved successfully, False otherwise.
    """
    try:
        with open(f"user_preferences/{user_id}.json", "w") as file:
            json.dump(preferences, file)
        return True
    except Exception as e:
        print(f"Error saving preferences: {e}")
        return False

def toggle_dark_mode(user_id, enable):
    """
    Toggle dark mode for the given user.

    Args:
        user_id (str): The user ID.
        enable (bool): Whether to enable or disable dark mode.

    Returns:
        str: The result of the dark mode toggle.
    """
    preferences = get_user_preferences(user_id)
    preferences["dark_mode"] = enable
    if save_user_preferences(user_id, preferences):
        status = "enabled" if enable else "disabled"
        return f"Dark mode {status} for user {user_id}."
    else:
        return "Failed to save preferences."
