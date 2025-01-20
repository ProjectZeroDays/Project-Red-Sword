import panel as pn
from database.models import DocumentAnalysis
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "sqlite:///document_analysis.db"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class C2Dashboard:
    def render(self):
        return pn.Column(
            "### Command and Control Dashboard",
            pn.pane.Markdown("Welcome to the C2 Dashboard. Here you can manage and monitor your operations."),
            pn.pane.Markdown("#### Detailed Metrics and Insights"),
            pn.widgets.DataFrame(name="Metrics Data"),
            pn.pane.Markdown("#### Visualizations"),
            pn.widgets.DataFrame(name="Assets Data"),
            pn.pane.Markdown("#### Message Boards"),
            pn.widgets.DataFrame(name="Message Board Data"),
            pn.pane.Markdown("#### Announcements"),
            pn.widgets.DataFrame(name="Announcements Data"),
            pn.pane.Markdown("#### Latest News on Exploits"),
            pn.widgets.DataFrame(name="Latest News Data"),
            pn.pane.Markdown("#### AI Interface"),
            pn.widgets.DataFrame(name="AI Interface Data"),
            pn.pane.Markdown("#### System Connections"),
            pn.widgets.DataFrame(name="System Connections Data"),
            pn.pane.Markdown("#### Logs"),
            pn.widgets.DataFrame(name="Logs Data"),
            pn.pane.Markdown("#### System Status"),
            pn.widgets.DataFrame(name="System Status Data"),
            pn.pane.Markdown("#### System Settings"),
            pn.widgets.DataFrame(name="System Settings Data"),
            pn.pane.Markdown("#### Attack Simulations"),
            pn.widgets.DataFrame(name="Attack Simulations Data"),
            pn.pane.Markdown("#### Fuzzing"),
            pn.widgets.DataFrame(name="Fuzzing Data"),
            pn.pane.Markdown("#### Asset Control"),
            pn.widgets.DataFrame(name="Asset Control Data"),
            pn.pane.Markdown("#### Reverse Shell Settings"),
            pn.widgets.DataFrame(name="Reverse Shell Settings Data"),
            pn.pane.Markdown("#### Advanced Connection Methods"),
            pn.widgets.DataFrame(name="Advanced Connection Methods Data")
        )

    def save_dashboard_to_db(self, source, title, links, error):
        session = SessionLocal()
        try:
            dashboard_result = DocumentAnalysis(
                source=source,
                title=title,
                links=links,
                error=error
            )
            session.add(dashboard_result)
            session.commit()
        except Exception as e:
            print(f"Error saving dashboard to database: {e}")
        finally:
            session.close()

if __name__ == "__main__":
    dashboard = C2Dashboard()
    dashboard.save_dashboard_to_db("c2_dashboard.py", "C2 Dashboard", "[]", None)
    print("Dashboard saved to database.")
