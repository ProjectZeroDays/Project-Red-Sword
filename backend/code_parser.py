
import ast

class CodeParser:
    def __init__(self, code):
        self.tree = ast.parse(code)

    def find_functions(self):
        return [node.name for node in ast.walk(self.tree) if isinstance(node, ast.FunctionDef)]

    def analyze_code(self):
        analysis = {
            "num_functions": len(self.find_functions()),
            "lines_of_code": len(self.tree.body),
        }
        return analysis

if __name__ == "__main__":
    sample_code = "def example():\n    return True"
    parser = CodeParser(sample_code)
    print(parser.analyze_code())
