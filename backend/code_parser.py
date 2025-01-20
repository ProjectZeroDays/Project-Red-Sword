import ast

class CodeParser:
    def __init__(self, code):
        self.tree = ast.parse(code)

    def find_functions(self):
        return [node.name for node in ast.walk(self.tree) if isinstance(node, ast.FunctionDef)]

    def analyze_code(self):
        if not self.tree.body:
            return {"error": "Empty code input"}
        
        num_functions = 0
        num_classes = 0
        lines_of_code = 0

        for node in self.tree.body:
            if isinstance(node, ast.FunctionDef):
                num_functions += 1
            elif isinstance(node, ast.ClassDef):
                num_classes += 1
            lines_of_code += len(node.body)

        analysis = {
            "num_functions": num_functions,
            "num_classes": num_classes,
            "lines_of_code": lines_of_code,
        }
        return analysis

if __name__ == "__main__":
    sample_code = "def example():\n    return True"
    parser = CodeParser(sample_code)
    print(parser.analyze_code())
