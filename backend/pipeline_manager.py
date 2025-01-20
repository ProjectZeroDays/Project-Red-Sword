import openai
import requests
import os

class PipelineManager:
    def __init__(self):
        pass

    def autogpt_task(self, task):
        openai.api_key = os.getenv("OPENAI_API_KEY")
        response = openai.Completion.create(
            engine="text-davinci-003",
            prompt=task,
            max_tokens=150
        )
        return response.choices[0].text.strip()

    def pinocchio_fact_check(self, text):
        url = "https://factchecktools.googleapis.com/v1alpha1/claims:search"
        params = {
            "query": text,
            "key": os.getenv("GOOGLE_FACT_CHECK_API_KEY")
        }
        response = requests.get(url, params=params)
        if response.status_code == 200:
            result = response.json()
            if "claims" in result:
                return result["claims"]
            else:
                return "No claims found."
        else:
            return f"Error: {response.status_code}"

if __name__ == "__main__":
    manager = PipelineManager()
    print(manager.autogpt_task("Generate a weekly report."))
    print(manager.pinocchio_fact_check("Earth is flat."))
