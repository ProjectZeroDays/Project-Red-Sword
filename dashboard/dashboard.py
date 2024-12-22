
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def dashboard():
    return render_template("dashboard.html", data={"threats_detected": 5, "exploits_deployed": 3})

if __name__ == "__main__":
    app.run(debug=True)
