from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Flask on Azure App Service (deployed from Azure DevOps)!\n"

@app.route("/health")
def health():
    return jsonify(status="ok")

if __name__ == "__main__":
    # This block is only used when running locally; container uses gunicorn
    app.run(host="0.0.0.0", port=80)
