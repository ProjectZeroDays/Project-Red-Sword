import openai
import requests
import os
import logging
from backend.code_parser import CodeParser
from backend.pipeline_manager import PipelineManager

class MultiAIChat:
    def __init__(self):
        self.openai_key = os.getenv("OPENAI_API_KEY")
        self.huggingface_key = os.getenv("HUGGINGFACE_API_KEY")
        self.anthropic_key = os.getenv("ANTHROPIC_API_KEY")
        self.code_parser = CodeParser("")
        self.pipeline_manager = PipelineManager()

    def openai_chat(self, prompt):
        if not self.openai_key:
            logging.error("Error: Missing OpenAI API key")
            return ""
        try:
            openai.api_key = self.openai_key
            response = openai.Completion.create(engine="text-davinci-003", prompt=prompt, max_tokens=100)
            return response.choices[0].text.strip()
        except openai.error.AuthenticationError as e:
            logging.error(f"Authentication error during OpenAI chat: {e}")
            return "Authentication error"
        except Exception as e:
            logging.error(f"Error during OpenAI chat: {e}")
            return ""

    def huggingface_chat(self, prompt):
        if not self.huggingface_key:
            logging.error("Error: Missing HuggingFace API key")
            return ""
        try:
            url = "https://api-inference.huggingface.co/models/facebook/blenderbot-400M-distill"
            headers = {"Authorization": f"Bearer {self.huggingface_key}"}
            response = requests.post(url, json={"inputs": prompt}, headers=headers)
            response.raise_for_status()
            return response.json().get("generated_text", "")
        except requests.exceptions.HTTPError as e:
            logging.error(f"HTTP error during HuggingFace chat: {e}")
            return ""
        except Exception as e:
            logging.error(f"Error during HuggingFace chat: {e}")
            return ""

    def anthropic_chat(self, prompt):
        if not self.anthropic_key:
            logging.error("Error: Missing Anthropic API key")
            return ""
        try:
            url = "https://api.anthropic.com/v1/completion"
            headers = {"Authorization": f"Bearer {self.anthropic_key}"}
            response = requests.post(url, json={"prompt": prompt, "model": "claude-v1"})
            response.raise_for_status()
            return response.json().get("output", "")
        except requests.exceptions.HTTPError as e:
            logging.error(f"HTTP error during Anthropic chat: {e}")
            return ""
        except Exception as e:
            logging.error(f"Error during Anthropic chat: {e}")
            return ""

    def parse_code(self, code):
        try:
            self.code_parser = CodeParser(code)
            return self.code_parser.analyze_code()
        except Exception as e:
            logging.error(f"Error during code parsing: {e}")
            return {}

    def manage_pipeline(self, task):
        try:
            return self.pipeline_manager.autogpt_task(task)
        except Exception as e:
            logging.error(f"Error during pipeline management: {e}")
            return ""

if __name__ == "__main__":
    chat = MultiAIChat()
    print(chat.openai_chat("Hello, how can I assist you today?"))
    print(chat.parse_code("def example():\n    return True"))
    print(chat.manage_pipeline("Generate a weekly report."))
