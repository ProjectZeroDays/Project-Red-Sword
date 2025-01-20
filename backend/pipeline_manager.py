import openai
import requests
from database.models import DocumentAnalysis
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "sqlite:///document_analysis.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class PipelineManager:
    def __init__(self):
        pass

    def autogpt_task(self, task):
        try:
            openai.api_key = "YOUR_API_KEY"
            response = openai.Completion.create(
                engine="text-davinci-003",
                prompt=task,
                max_tokens=150
            )
            return response.choices[0].text.strip()
        except Exception as e:
            print(f"Error during autogpt_task: {e}")
            return ""

    def pinocchio_fact_check(self, text):
        try:
            url = "https://factchecktools.googleapis.com/v1alpha1/claims:search"
            params = {
                "query": text,
                "key": "YOUR_API_KEY"
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
        except Exception as e:
            print(f"Error during pinocchio_fact_check: {e}")
            return ""

    def save_analysis_to_db(self, source, title, links, error):
        session = SessionLocal()
        try:
            analysis_result = DocumentAnalysis(
                source=source,
                title=title,
                links=links,
                error=error
            )
            session.add(analysis_result)
            session.commit()
        except Exception as e:
            print(f"Error saving analysis to database: {e}")
        finally:
            session.close()

if __name__ == "__main__":
    manager = PipelineManager()
    print(manager.autogpt_task("Generate a weekly report."))
    print(manager.pinocchio_fact_check("Earth is flat."))
