import sklearn
import os
import datetime as dt
import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestRegressor
from sklearn.compose import make_column_transformer
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import OneHotEncoder

from joblib import dump, load

import pathlib
import platform


def season(mydate):
    """
    Function that takes a date object as input and returns a season, where
    1 = Winter
    2 = Spring
    3 = Summer
    4 = Autumn
    """
    # get the year from the date object
    year = mydate.year

    # create a list of seasons for comparison
    seasons = [
        (1, dt.date(year, 12, 21), dt.date(year, 12, 31)),
        (3, dt.date(year, 6, 21), dt.date(year, 9, 20)),
        (4, dt.date(year, 9, 21), dt.date(year, 12, 20)),
        (1, dt.date(year, 1, 1), dt.date(year, 3, 20)),
        (2, dt.date(year, 3, 21), dt.date(year, 6, 20)),
    ]

    # find the corresponding from the list and return it
    for season in seasons:
        if mydate >= season[1] and mydate <= season[2]:
            return season[0]


def get_seasons(df):
    """
    Function that gets a dataframe as input which contains a datetime column called "date"
    and returns the same dataframe with an additional column called "season" with values 1-4
    corresponding to
    1 = Winter
    2 = Spring
    3 = Summer
    4 = Autumn
    """
    # apply the function season to the date column
    df["season"] = df.date.map(season)

    # turn new column 'season' into datatype category
    df["season"] = df.season.astype("category")

    # return dataframe
    return df


def get_month(df):
    """
    Function that gets a dataframe as input which contains a datetime column called 'date'
    and returns the same dataframe with an additional column called 'mnth' which contains the month
    as an integer 1-12.
    """

    # get the months from the date column
    df["mnth"] = df.date.dt.month

    # turn the new column 'mnth' into datatype category
    df["mnth"] = df.mnth.astype("category")

    # return dataframe
    return df


def get_year(df):
    """
    Function that gets a dataframe as input which contains a datetime column called 'date'
    and returns the same dataframe with an additional column called 'yr' which is 1 if the year is
    2012, else 0.
    """

    # get the binary encoding for the year
    df["yr"] = np.where(df.date.dt.year == 2012, 1, 0)

    # turn the new column 'yr' into datatype category
    df["yr"] = df.yr.astype("category")

    # return dataframe
    return df


def get_hour(df):
    """
    Function that gets a dataframe as input which contains a datetime column called 'date'
    and returns the same dataframe with an additional column called 'hr' which is the hour
    from 0-23.
    """

    # get the hour from the date column
    df["hr"] = df.date.dt.hour

    # return dataframe
    return df


def get_weekday(df):
    """
    Function that gets a dataframe as input which contains a datetime column called 'date'
    and returns the same dataframe with an additional column called 'weekday' which is the day
    of the week from 0 = Monday to 6 = Sunday.
    """

    # get the weekday from the date column
    df["weekday"] = df.date.dt.weekday

    # return dataframe
    return df


def get_workingday(df):
    """
    Function that gets a dataframe as input which contains a column called 'weekday' which is the day of
    the week from 0 = Monday to 6 = Sunday. Returns the same dataframe with an additional column called
    'workingday' which is 1 if the day is not Saturday or Sunday, else 0.
    """

    # create the column workingday, which is 1 if the weekday is not Saturday or Sunday, else 0
    df["workingday"] = np.where(df.weekday < 5, 1, 0)

    # turn new column 'workingday' into datatype category
    df["workingday"] = df.workingday.astype("category")

    # return dataframe
    return df


def get_officehour(df):
    """
    Function that gets a dataframe as input which contains a column called 'weekday' which is the day of
    the week from 0 = Monday to 6 = Sunday and a column called 'hr' which is the hour of the day.
    Returns the same dataframe with an additional column called 'officehour' which is 1 it is a
    workingday and it is between 9-17 o'clock.
    """

    # create a new column 'officehour' as described in the function's docstring
    df["officehour"] = np.where((df.hr >= 9) & (df.hr < 17) & (df.weekday == 1), 1, 0)

    # turn new column 'officehour' into datatype category
    df["officehour"] = df.officehour.astype("category")

    # return dataframe
    return df


def get_daytime(df):
    """
    Function that gets a dataframe as input which contains a column  called 'hr' which is the hour of the day.
    Returns the same dataframe with an additional column called 'daytime' which is 1 if the hour is from
    6-22 o'clock, else 0.
    """

    # create column 'datatime', which is 1 if the hour is between 6-22, else 0
    df["daytime"] = np.where((df.hr >= 6) & (df.hr < 22), 1, 0)

    # turn new column 'daytime' into datatype category
    df["daytime"] = df.daytime.astype("category")

    # return dataframe
    return df


def get_rushhour_morning(df):
    """
    Function that gets a dataframe as input which contains a column called 'weekday' which is the day of
    the week from 0 = Monday to 6 = Sunday and a column called 'hr' which is the hour of the day.
    Returns the same dataframe with an additional column called 'rushhour_morning', which is 1 if
    it is a weekday and the time is from 6-10 o'clock, else 0.
    """

    # create column 'rushhour_morning' as described in the function's docstring
    df["rushhour_morning"] = np.where(
        (df.hr >= 6) & (df.hr < 10) & (df.weekday == 1), 1, 0
    )

    # turn new column 'rushhour_morning' into datatype category
    df["rushhour_morning"] = df.rushhour_morning.astype("category")

    # return dataframe
    return df


def get_rushhour_evening(df):
    """
    Function that gets a dataframe as input which contains a column called 'weekday' which is the day of
    the week from 0 = Monday to 6 = Sunday and a column called 'hr' which is the hour of the day.
    Returns the same dataframe with an additional column called 'rushhour_evening', which is 1 if
    it is a weekday and the time is from 15-19 o'clock, else 0.
    """
    # create column 'rushhour_evening' as described in the function's docstring
    df["rushhour_evening"] = np.where(
        (df.hr >= 15) & (df.hr < 19) & (df.weekday == 1), 1, 0
    )

    # turn new column 'rushhour_evening' into datatype category
    df["rushhour_evening"] = df.rushhour_evening.astype("category")

    # return dataframe
    return df


def get_highseason(df):
    """
    Function that gets a dataframe as input which contains a column called 'season' which is the season with
    1 = Winter
    2 = Spring
    3 = Summer
    4 = Autumn

    Returns the same dataframe with an additional column called 'highseason' which is 1 if the season is
    summer, else 0.
    """

    # create a new column 'highseason' which is 1 if the season is summer, else 0
    df["highseason"] = np.where(df.season == 3, 1, 0)

    # turn new column 'highseason' into datatype category
    df["highseason"] = df.highseason.astype("category")

    # return dataframe
    return df


def get_bins(df):
    """
    Function that gets a dataframe as input with two continuous numerical columns called 'temp'
    and 'hum' for the temperature and humidity. Returns a dataframe with two new columns 'temp_binned'
    and 'hum_binned' which are binned versions of these columns.
    """

    # define bins
    bins = [-np.inf, 0.19, 0.49, 0.69, 0.89, np.inf]

    # create columns 'temp_binned' and 'hum_binned' based on the bins defined before
    df["temp_binned"] = pd.cut(df.temp, bins)
    df["hum_binned"] = pd.cut(df.hum, bins)

    # return dataframe
    return df


def get_log1p(df):
    """
    Function that gets a dataframe as input with a column called 'windspeed', which is a continuous
    numerical feature. Returns the same column, applying the numpy.log1p function, which adds 1 to
    the column and the takes the natural logarithm.
    """

    # scale the column 'windspeed' using the numpy.log1p function
    df["windspeed"] = np.log1p(df.windspeed)

    # return dataframe
    return df


def to_categorical(df):
    df["hr"] = df.hr.astype("category")
    df["season"] = df.season.astype("category")
    df["yr"] = df.yr.astype("category")
    df["mnth"] = df.mnth.astype("category")
    df["holiday"] = df.holiday.astype("category")
    df["weekday"] = df.weekday.astype("category")
    df["workingday"] = df.workingday.astype("category")
    df["weathersit"] = df.weathersit.astype("category")
    return df


def predict(param_dict, model_path=None):
    """
    Function that loads a model from a file path and makes predictions using a parameter dictionary
    as input data.
    """

    # if there is no model path provided, create a model path from the home directory
    if model_path is None:

        # create a model path if OS is Windows
        if "Windows" in platform.system():
            file_path = str(pathlib.Path.home()) + str("\\model.pkl")
            home_path = file_path

        # if not Windows, create model path for other OS
        else:
            file_path = str(pathlib.Path.home()) + str("/model.pkl")
            home_path = file_path

    # if file directory was passed as an imput parameter, create the filepath using that directory path
    else:
        file_path = model_path + str("model.pkl")

        # create a model path if OS is Windows
        if "Windows" in platform.system():
            home_path = str(pathlib.Path.home()) + str("\\model.pkl")

        # if not Windows, create model path for other OS
        else:
            home_path = str(pathlib.Path.home()) + str("/model.pkl")

    # load the model, if it doesn't exist run train_and_persist() and then load the model
    try:
        model = load(file_path)
    except:
        train_and_persist()
        model = load(home_path)

    # turn param_dict into a dataframe, values in dictionary need to be a list first
    for key, val in param_dict.items():
        param_dict[key] = [val]

    data = pd.DataFrame(param_dict)

    # rename columns
    data["temp"] = data["temperature_C"]
    data["hum"] = data["humidity"]

    # create column that isn't passed in the param_dict
    data["holiday"] = 0

    # apply preprocessing functions
    data = get_seasons(data)
    data = get_month(data)
    data = get_year(data)
    data = get_hour(data)
    data = get_weekday(data)
    data = get_workingday(data)
    data = get_officehour(data)
    data = get_daytime(data)
    data = get_rushhour_morning(data)
    data = get_rushhour_evening(data)
    data = get_highseason(data)
    data = get_bins(data)
    data = get_log1p(data)
    data = to_categorical(data)

    # drop unnecessary columns
    data.drop("date", axis=1, inplace=True)
    data.drop("temperature_C", axis=1, inplace=True)
    data.drop("humidity", axis=1, inplace=True)
    data.drop("feeling_temperature_C", axis=1, inplace=True)

    # sort columns
    data = data.reindex(sorted(data.columns), axis=1)

    # create prediction
    pred = model.predict(data)

    # return prediction as integer
    return int(pred)


def train_and_persist(rf_param_dict=None, model_path=None):
    """
    This function loads a csv file provided with the library, applies preprocessing steps and
    then trains a random forest regressor which it saves to a file path provided by the user
    or to the user's home directory.
    """
    # load raw data from csv file
    csv_name = os.path.dirname(__file__) + "/hour.csv"
    hour = pd.read_csv(csv_name, index_col="instant")

    # change column 'dteday' to datatype datetime
    hour["dteday"] = pd.to_datetime(hour["dteday"])

    # scale the column 'windspeed'
    hour = get_log1p(hour)

    # scale the column 'cnt'
    hour["cnt"] = np.sqrt(hour.cnt)

    # data preprocessing
    hour = get_officehour(hour)
    hour = get_daytime(hour)
    hour = get_rushhour_morning(hour)
    hour = get_rushhour_evening(hour)
    hour = get_highseason(hour)
    hour = get_bins(hour)
    hour = to_categorical(hour)

    # drop unnecessary colummns
    train = hour.drop(columns=["dteday", "casual", "atemp", "registered"])

    # seperate the features and target
    train_X = train.drop(columns=["cnt"], axis=1)
    train_y = train["cnt"]

    # sort the columns of train_X
    train_X = train_X.reindex(sorted(train_X.columns), axis=1)

    # if no random forest parameters are passed, use as default n_estimators = 50 and random_state = 42
    if rf_param_dict is None:
        rf = RandomForestRegressor(n_estimators=50, random_state=42)
    else:
        rf = RandomForestRegressor(**rf_param_dict)

    # create a machine learning pipeline that one-hot encodes categorical features and uses random forest for prediction
    categorical = train_X.dtypes == "category"
    preprocess = make_column_transformer(
        (OneHotEncoder(), categorical), remainder="passthrough"
    )
    pipeline = make_pipeline(preprocess, rf)

    # fit the pipeline
    pipeline.fit(train_X, train_y)

    # create a filepath to the home directory if no directory is given, else create file path from given directory
    if model_path is None:
        if "Windows" in platform.system():
            filename = str(pathlib.Path.home()) + str("\\model.pkl")
        else:
            filename = str(pathlib.Path.home()) + str("/model.pkl")
    else:
        filename = model_path + str("model.pkl")

    # save model to filepath
    dump(pipeline, filename)
