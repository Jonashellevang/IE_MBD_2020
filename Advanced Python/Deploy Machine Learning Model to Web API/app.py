# importing necessary libraries
import argparse
from flask import Flask, request, abort
import sys
import sklearn
import ie_bike_model
from ie_bike_model.model import train_and_persist, predict
import datetime as dt
import timeit

app = Flask(__name__)


@app.route("/")
def api():
    """Get versions"""
    args = dict(request.args)
    return {
        "scikit-learn-version": sklearn.__version__,
        "ie_bike_model-version": ie_bike_model.__version__,
        "python-version": sys.version,
    }


@app.route("/train_and_persist", methods=["GET", "POST"])
def train_and_persist_function():
    """Training the function"""
    if request.method == "POST":
        return {
            "status": "ok",
            "train_score": train_and_persist(),
        }
    else:
        return """
                <form method="POST">
                <input type="submit" value="Submit">
                <br>
                </form>
                """


@app.route("/predict")
def predict_function():
    """predicting outcome based on URL parameters"""
    args = dict(request.args)
    parameters = {
        "date": dt.datetime.strptime(args.get("date"), "%Y-%m-%dT%H:%M:%S"),
        "weathersit": int(args.get("weathersit")),
        "temperature_C": float(args.get("temperature_C")),
        "feeling_temperature_C": float(args.get("feeling_temperature_C")),
        "humidity": float(args.get("humidity")),
        "windspeed": float(args.get("windspeed")),
    }
    start = timeit.timeit()
    prediction = predict(parameters)
    time = timeit.timeit() - start
    if parameters := parameters:
        return {
            "result": prediction,
            "elapsed_time": time,
            "parameters": parameters,
        }
    else:
        abort(400)


if __name__ == "__main__":
    # Use python app.py --help to showcase argument parsing
    parser = argparse.ArgumentParser(
        description="Flask application for machine learning model"
    )
    parser.add_argument("--debug", action="store_true", help="Enable debug mode")
    args = parser.parse_args()

    app.run(debug=args.debug)
