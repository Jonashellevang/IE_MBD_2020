import numpy as np
import datetime as dt
import pytest
import os
import pathlib
import platform
from ie_bike_model.model import train_and_persist, predict


class TestTrainAndPredict(object):
    # put tests for train_and_persist here, e.g.
    # def test_model_saved(self):

    def test_model_pkl_exists(self):
        """
        The test checks if a model.pkl file exists after running train_and_predict.
        """

        # create a model path if OS is Windows
        if "Windows" in platform.system():
            file_path = str(pathlib.Path.home()) + str("\\model.pkl")

        # if not Windows, create model path for other OS
        else:
            file_path = str(pathlib.Path.home()) + str("/model.pkl")

        # remove model if already exists
        try:
            os.remove(file_path)
        except:
            pass

        # run train_and_persist function
        train_and_persist()

        assert os.path.exists(file_path)


class TestPredict(object):
    # put tests for train_and_persist here, e.g.
    # def test_positive_prediction(self):

    def test_date_2013(self):
        """
        The test checks if the prediction for year 2013 returns valid output
        """
        return_value = predict(
            {
                "date": dt.datetime(2013, 1, 1, 0, 0, 0),
                "weathersit": 1,
                "temperature_C": 9.84,
                "feeling_temperature_C": 14.395,
                "humidity": 81.0,
                "windspeed": 0.0,
            }
        )
        assert isinstance(return_value, int)

    def test_wrong_file_path(self):
        """
        The test checks if the model does not exists in the given file path,
        then the function still returns a prediction. 
        """

        return_value = predict(
            {
                "date": dt.datetime(2012, 1, 1, 0, 0, 0),
                "weathersit": 1,
                "temperature_C": 9.84,
                "feeling_temperature_C": 14.395,
                "humidity": 81.0,
                "windspeed": 0.0,
            },
            model_path="/",
        )
        assert isinstance(return_value, int)

    def test_month_greater_than_12(self):
        """
        The test checks if month value entered greater than 12 returns ValueError
        """

        with pytest.raises(ValueError):
            predict(
                {
                    "date": dt.datetime(2012, 25, 1, 0, 0, 0),
                    "weathersit": 1,
                    "temperature_C": 9.84,
                    "feeling_temperature_C": 14.395,
                    "humidity": 81.0,
                    "windspeed": 0.0,
                }
            )

    def test_weathersit_4(self):
        """
        "weathersit" has values between 1 and 4. The test checks if the prediction returns a valid output for the edge case
        """
        return_value = predict(
            {
                "date": dt.datetime(2012, 1, 1, 0, 0, 0),
                "weathersit": 4,
                "temperature_C": 9.84,
                "feeling_temperature_C": 14.395,
                "humidity": 81.0,
                "windspeed": 0.0,
            }
        )
        assert isinstance(return_value, int)

    def test_weathersit_5(self):
        """
        "weathersit" has values between 1 and 4. The test checks if the prediction returns a valueError if the input for the weathersit is outside of the range
        """

        with pytest.raises(ValueError):
            predict(
                {
                    "date": dt.datetime(2012, 1, 1, 0, 0, 0),
                    "weathersit": 5,
                    "temperature_C": 9.84,
                    "feeling_temperature_C": 14.395,
                    "humidity": 81.0,
                    "windspeed": 0.0,
                }
            )

    def test_temperature_list_input(self):
        """
        The test checks if the prediction returns an error when the value is passed as a list of multiple values
        """

        with pytest.raises(TypeError):
            predict(
                {
                    "date": dt.datetime(2012, 1, 1, 0, 0, 0),
                    "weathersit": 4,
                    "temperature_C": [9.84, 9.0],
                    "feeling_temperature_C": 14.395,
                    "humidity": 81.0,
                    "windspeed": 0.0,
                }
            )
