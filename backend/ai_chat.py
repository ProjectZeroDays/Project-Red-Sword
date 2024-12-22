
import openai
import requests

class MultiAIChat:
    def __init__(self, openai_key, huggingface_key, anthropic_key):
        self.openai_key = openai_key
        self.huggingface_key = huggingface_key
        self.anthropic_key = anthropic_key

    def openai_chat(self, prompt):
        openai.api_key = self.openai_key
        response = openai.Completion.create(engine="text-davinci-003", prompt=prompt, max_tokens=100)
        return response.choices[0].text.strip()

    def huggingface_chat(self, prompt):
        url = "https://api-inference.huggingface.co/models/facebook/blenderbot-400M-distill"
        headers = {"Authorization": f"Bearer {self.huggingface_key}"}
        response = requests.post(url, json={"inputs": prompt}, headers=headers)
        return response.json().get("generated_text", "")

    def anthropic_chat(self, prompt):
        url = "https://api.anthropic.com/v1/completion"
        headers = {"Authorization": f"Bearer {self.anthropic_key}"}
        response = requests.post(url, json={"prompt": prompt, "model": "claude-v1"})
        return response.json().get("output", "")

if __name__ == "__main__":
    chat = MultiAIChat("openai_key", "huggingface_key", "anthropic_key")
    print(chat.openai_chat("Hello, how can I assist you today?"))
