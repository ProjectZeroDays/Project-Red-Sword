import panel as pn

class C2Dashboard:
    def render(self):
        return pn.Column(
            "### Command and Control Dashboard",
            pn.pane.Markdown("Welcome to the C2 Dashboard. Here you can manage and monitor your operations.")
        )

class MITMStingrayDashboard:
    def __init__(self, mitm_stingray):
        self.mitm_stingray = mitm_stingray
        self.intercepted_data = []

    def start_interception(self, event):
        self.mitm_stingray.start()
        self.intercepted_data.append("Interception started")

    def stop_interception(self, event):
        self.mitm_stingray.stop()
        self.intercepted_data.append("Interception stopped")

    def render(self):
        return pn.Column(
            "### MITM Stingray Dashboard",
            pn.pane.Markdown("Monitor and manage MITM Stingray operations."),
            pn.widgets.Button(name="Start Interception", button_type="primary", on_click=self.start_interception),
            pn.widgets.Button(name="Stop Interception", button_type="danger", on_click=self.stop_interception),
            pn.widgets.DataFrame(self.intercepted_data, name="Intercepted Data")
        )
