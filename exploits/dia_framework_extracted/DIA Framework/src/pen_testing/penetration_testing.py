
def perform_penetration_test(target):
    print(f"Performing penetration test on: {target}")
    return {"vulnerabilities_exploited": ["Weak password", "Unpatched software"]}

if __name__ == "__main__":
    pen_test_results = perform_penetration_test("192.168.1.100")
    print(f"Penetration Test Results: {pen_test_results}")
