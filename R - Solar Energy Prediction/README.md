# AMS 2013-2014 Solar Energy Prediction Contest (Kaggle)
The goal of this contest was to discover which statistical and machine learning techniques provide the best short term predictions of solar energy production. We  predicted the total daily incoming solar energy at 98 Oklahoma Mesonet sites, which serves as "solar farms" for the Kaggle competition. The R-Markdown is published and can be viewed by clicking [this link](https://rpubs.com/jonashellevang/Exploratory_Data_Analysis). You can also see the raw file by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Exploratory%20Data%20Analysis.Rmd).

Link to the competition can be found [here](https://www.kaggle.com/c/ams-2014-solar-energy-prediction-contest).

## SUPPORT VECTOR MACHINES MODEL (best)
The file "[SVM Prediction (best prediction).csv](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/SVM%20Prediction%20(best%20prediction).csv)" is the output of the most accurate model "[SVM Model (best model).R](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/SVM%20Model%20(best%20model).R)". This model used the first 20 PCs from "solar_dataset.RData". The methodology was always a grid search and training a new model for each station.

The MAE score of the best SVM model on Kaggle was 2,290,458 (public) & 2,529,143 (private).

This was also the best score amongst our peers in the class.


## NEURAL NETWORK MODEL (2nd best)
The "[Neural Network Models](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models)" folder contains all neural network architectures and instructions in "[Model History.xlsx](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models/Model%20History.xlsx)" (this needs to be downloaded to be viewed). The best model on the validation set was "[wide-and-deep 5.R](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models/wide-and-deep%205.R)". It was then retrained on the train and validation data and tested on the test data, in "[wide-and-deep test.R](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models/wide-and-deep%20test.R)". After confirming it worked well on the test set, we made predictions on all 98 stations using a for-loop and training a new model every time. The code for that is "[wide-and-deep prediction.R](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models/wide-and-deep%20prediction.R)" and the output it "[wide-and-deep prediction.csv](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models/wide-and-deep%20prediction.csv)".

The MAE score of the neural network model on Kaggle was 2,368,914 (public) & 2,637,624 (private).
