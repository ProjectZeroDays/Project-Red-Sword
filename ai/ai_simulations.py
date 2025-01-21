import random

class OffensiveSimulation:
    def __init__(self):
        self.scenarios = [
            "SQL Injection",
            "Cross-Site Scripting (XSS)",
            "Phishing Attack",
            "Privilege Escalation",
            "DDoS Attack"
        ]

    def simulate_attack(self):
        if not self.scenarios:
            print("Error: No scenarios available for simulation.")
            return

        try:
            if not self.scenarios:
                raise IndexError("No scenarios available.")
            scenario = random.choice(self.scenarios)
            print(f"[SIMULATION] Executing simulated attack: {scenario}")

        except IndexError as e:
            print(f"Error during simulation: {e}")

        except Exception as e:
            print(f"Error during simulation: {e}")

if __name__ == "__main__":
    simulation = OffensiveSimulation()
    simulation.simulate_attack()
