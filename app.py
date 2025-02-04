from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def hello_world():  # put application's code here
    return render_template('index.html')

@app.route('/flask')
def flask_page():
    return render_template('flask-page.html')

@app.route('/docker')
def docker_page():
    return render_template('docker-page.html')

@app.route("/healthz")
def healthz():
    return "OK"

@app.route("/healthx")
def healthx():
    return "OK"

if __name__ == '__main__':
    app.run()
