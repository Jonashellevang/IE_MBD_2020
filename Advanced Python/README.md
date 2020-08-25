# Package a Machine Learning Model
The task of this "Advanced Python" class assignment was to convert a machine learning model into a Python library that can be easily deployed. The folder can be accessed by [clicking this link](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/Advanced%20Python/Package%20a%20Machine%20Learning%20Model).

### Requirements of the Assignment:
1. The library must have a pyproject.toml created using flit and a proper directory layout (1 point).
2. There must be a `def train_and_persist()` function importable using `from ie_bike_model.model import train_and_persist` that trains the RandomForestRegressor model displayed in the notebook, using hour.csv as training data, and saves it to a `model.pkl` using joblib (3 points).
* The `model.pkl` must be saved to the user home directory.
* This function must apply all the necessary preprocessing to the training data
* You can put the input .csv file inside `src/ie_bike_model/hour.csv` because with flit "all data files are included automatically".
3. There must be a `def predict(parameters)` function importable using `from ie_bike_model.model import predict` that receives a dictionary of input parameters (see example in README.md), preprocesses the input data (dummy variables, scaling, ...), passes that to the trained model, and returns the number of expected users (3 points).
* The `predict` function must call `train_and_persist` if a persisted/serialized model was not found in the user home directory.
* The function should receive one parameter, and that parameter should be a dictionary.
* The `predict` function must not train the model every time it's called (for performance reasons).
4. An extra point can be earned by:
* Adding an optional parameter to `train_and_persist` as well as `predict` that specifies in which directory to look for the `model.pkl` file (but should work nonetheless if such directory is not given)
* Adding tests that cover some or all of the functionality of the library
* Studying possible corner cases and raise proper errors and warnings
* Adherence to a PEP 8-like Python style guide (black, flake8, pycodestyle)
* Using pull requests departing from a branch as part of the workflow
* General code quality

# Deploy a Machine Learning Model
The task of this "Advanced Python" class assignment was to convert a Python library containing a reusable machine learning model into a web application. The folder can be accessed by [clicking this link](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/Advanced%20Python/Deploy%20a%20Machine%20Learning%20Model).

### Requirements of the Assignment:
1. Create a `app.py` with a simple Flask `/` endpoint that returns a dictionary with the versions of scikit-learn, ie-bike-model, and Python (1 point).
* Include the necessary code so that `python app.py` launches a basic Flask application, and include an optional `--debug` parameter that turns on the debugger.
2. Add a Flask `/train_and_persist` endpoint that calls the `train_and_persist` function from `ie-bike-model` and returns `{"status": "ok"}` (1 point).
3. Add a Flask `/predict` endpoint to `app.py` that uses the URL parameters to call the `predict` function from `ie-bike-model` and returns `{"result": NN: "elapsed_fime": FF.FFF}` where `NN` is the expected number of cyclists and `FF.FFF` is the processing time, in seconds (3 points).
* The server must not crash if the number or the format of the URL parameters is incorrect, and should raise an error 400 instead.
4. Include the `ie-bike-model` code that the web application needs inside a `lib` directory next to the top-level `README.md` and `app.py`, and amend the installation instructions in the top-level `README.md` if necessary (1 point)
* The objective is that `pip install lib/` installs the library code, and then `app.py` contains the application code.
* Notice that the `.gitignore` file available in gitignore.io contains the `lib`, which goes against the purpose of storing this code in version control. Be careful to remove that line from `.gitignore` if you happen to have it, or change the directory to something like `library`.
5. An extra point can be earned by:
* Modify the library code to add more information to the `/predict` or the `/train_and_persist` results, for example test/train score
* Change the `/train_and_persist` to accept only `POST` instead of `GET` (default) HTTP method
* Studying possible corner cases and raise proper errors and warnings
* Adherence to a PEP 8-like Python style guide (black, flake8, pycodestyle)
* General code quality
