import ast
import logging
from database.models import DocumentAnalysis
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "sqlite:///document_analysis.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Configure logging
logging.basicConfig(level=logging.ERROR, format='%(asctime)s - %(levelname)s - %(message)s')

class CodeParser:
    def __init__(self, code):
        try:
            if not code.strip():
                raise ValueError("Input code cannot be empty")
            self.tree = ast.parse(code)
        except ValueError as e:
            logging.error(f"ValueError: {e}")
            raise
        except SyntaxError as e:
            logging.error(f"SyntaxError: {e}")
            raise
        except Exception as e:
            logging.error(f"Unexpected error in CodeParser constructor: {e}")
            raise

    def find_functions(self):
        return [node.name for node in ast.walk(self.tree) if isinstance(node, ast.FunctionDef)]

    def analyze_code(self):
        if not self.tree.body:
            return {"error": "Empty code input"}
        analysis = {
            "num_functions": len(self.find_functions()),
            "lines_of_code": len(self.tree.body),
        }
        return analysis

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
            logging.error(f"Error saving analysis to database: {e}")
        finally:
            session.close()

    def verify_database_connection(self):
        try:
            session = SessionLocal()
            session.execute('SELECT 1')
            session.close()
            print("Database connection verified.")
        except Exception as e:
            print(f"Database connection verification failed: {e}")

if __name__ == "__main__":
    sample_code = "def example():\n    return True"
    parser = CodeParser(sample_code)
    analysis = parser.analyze_code()
    try:
        parser.save_analysis_to_db("sample_code.py", "Code Analysis", str(analysis), None)
    except Exception as e:
        logging.error(f"Unexpected error in save_analysis_to_db: {e}")
    parser.verify_database_connection()
    print(analysis)
