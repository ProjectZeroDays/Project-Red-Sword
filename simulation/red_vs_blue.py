class SimulationMode:
    def __init__(self, mode):
        self.mode = mode

    def execute(self):
        if self.mode == 'red':
            self.attack()
        elif self.mode == 'blue':
            self.defend()
        else:
            self.invalid_mode()

    def attack(self):
        print("Executing Red Team attack strategies.")

    def defend(self):
        print("Implementing Blue Team defense measures.")

    def invalid_mode(self):
        print("Invalid mode selected. Please choose 'red' or 'blue'.")
