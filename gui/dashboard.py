
import tkinter as tk
from tkinter import ttk
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

class Dashboard:
    def __init__(self, root):
        self.root = root
        self.root.title("Cybersecurity Framework Dashboard")
        self.root.geometry("800x600")

        self.metrics = {"Threats Detected": 3, "Active Exploits": 7, "Resolved Alerts": 15}

        self.create_widgets()

    def create_widgets(self):
        ttk.Label(self.root, text="Cybersecurity Dashboard", font=("Arial", 18)).pack(pady=10)

        self.chart_frame = ttk.LabelFrame(self.root, text="System Metrics")
        self.chart_frame.pack(fill="both", expand=True, padx=10, pady=10)

        self.update_chart()

        ttk.Button(self.root, text="Refresh", command=self.refresh_metrics).pack(pady=5)

    def update_chart(self):
        fig = Figure(figsize=(6, 4), dpi=100)
        ax = fig.add_subplot(111)
        ax.bar(self.metrics.keys(), self.metrics.values(), color="skyblue")
        ax.set_title("System Metrics")

        canvas = FigureCanvasTkAgg(fig, master=self.chart_frame)
        canvas.draw()
        canvas.get_tk_widget().pack(fill="both", expand=True)

    def refresh_metrics(self):
        self.metrics["Threats Detected"] += 1
        self.metrics["Active Exploits"] -= 1
        self.metrics["Resolved Alerts"] += 2
        self.update_chart()


if __name__ == "__main__":
    root = tk.Tk()
    app = Dashboard(root)
    root.mainloop()
