from flask import Flask, render_template, request, redirect, url_for, session
from functools import wraps
from modules.advanced_malware_analysis import AdvancedMalwareAnalysis
from modules.advanced_social_engineering import AdvancedSocialEngineering

app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Dummy user data for RBAC
users = {
    "admin": {"password": "admin123", "role": "admin"},
    "user": {"password": "user123", "role": "user"}
}

# Role-Based Access Control (RBAC) decorator
def rbac_required(role):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            if 'username' not in session or users[session['username']]['role'] != role:
                return redirect(url_for('login'))
            return f(*args, **kwargs)
        return decorated_function
    return decorator

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        if username in users and users[username]["password"] == password:
            session["username"] = username
            return redirect(url_for("dashboard"))
        return "Invalid credentials"
    return render_template("login.html")

@app.route("/logout")
def logout():
    session.pop("username", None)
    return redirect(url_for("login"))

@app.route("/")
@rbac_required("user")
def dashboard():
    malware_analysis = AdvancedMalwareAnalysis()
    social_engineering = AdvancedSocialEngineering()
    return render_template("dashboard.html", data={
        "threats_detected": 5,
        "exploits_deployed": 3,
        "malware_analysis": malware_analysis.render(),
        "social_engineering": social_engineering.render()
    })

@app.route("/admin")
@rbac_required("admin")
def admin_dashboard():
    return render_template("admin_dashboard.html", data={"compliance_status": "Compliant", "training_status": "Completed"})

@app.route("/compliance")
@rbac_required("admin")
def compliance_dashboard():
    return render_template("compliance_dashboard.html", data={"compliance_status": "Compliant"})

@app.route("/training")
@rbac_required("user")
def training_dashboard():
    return render_template("training_dashboard.html", data={"training_status": "Completed"})

if __name__ == "__main__":
    app.run(debug=True)
