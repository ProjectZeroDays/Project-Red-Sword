import ast
from database.models import DocumentAnalysis
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "sqlite:///document_analysis.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class CodeParser:
    def __init__(self, code):
        self.tree = ast.parse(code)

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
            print(f"Error saving analysis to database: {e}")
        finally:
            session.close()

if __name__ == "__main__":
    sample_code = "def example():\n    return True"
    parser = CodeParser(sample_code)
    analysis = parser.analyze_code()
    parser.save_analysis_to_db("sample_code.py", "Code Analysis", str(analysis), None)
    print(analysis)
