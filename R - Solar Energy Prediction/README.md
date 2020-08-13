# AMS 2013-2014 Solar Energy Prediction Contest (Kaggle)
The goal of this contest was to discover which statistical and machine learning techniques provide the best short term predictions of solar energy production. We  predicted the total daily incoming solar energy at 98 Oklahoma Mesonet sites, which serves as "solar farms" for the Kaggle competition.

## SUPPORT VECTOR MACHINES MODEL (best)
The file "SVM Prediction (best prediction).csv" is the output of the most accurate model "SVM Model (best model).R". This model used the first 20 PCs from "solar_data.RData". The methodology was always a grid search and training a new model for each station.

The MAE score of the best SVM model on Kaggle was 2,290,458 (public) & 2,529,143 (private).

This was also the best score amongst our peers in the class.


## NEURAL NETWORK MODEL (2nd best)
The "Neural Network Models" folder contains all neural network architectures and instructions in "Model History.xlsx". The best model on the validation set was "wide-and-deep 5.R". It was then retrained on the train and validation data and tested on the test data, in "wide-and-deep test.R". After confirming it worked well on the test set, we made predictions on all 98 stations using a for-loop and training a new model every time. The code for that is "wide-and-deep prediction.R" and the output it "wide-and-deep prediction.csv".

The MAE score of the neural network model on Kaggle was 2,368,914 (public) & 2,637,624 (private).
