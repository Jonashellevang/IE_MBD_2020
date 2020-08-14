# HR Analytics - Predicting Turnover For A Large Company (Kaggle)
The HR Analytics dataset includes explanatory variables of around 15k employees of a large company. The goal of the case study was to model the probability of attrition (employees leaving, either on their own or because they got fired) of each individual, as well as to understand which variables are the most important ones and need to be addressed the right away.

Link to the competition can be found [here](https://www.kaggle.com/lnvardanyan/hr-analytics).

Throughout the model Cross Validation (CV) was used together with other measures to make sure the model is not biased or overfited, as well as tried and failed with many methods. The focus was on weighted F1 score due to the fact that the target variable, if a employee were to leave the company or not, had more 0's than 1's. To balance this relationship between precision and recall Weighted F1 was used, which gave the result of .96 with a weighted CV score of .95 (+/- 0.01).

The F1 score for 0's shows that the model will 97 % of the times correctly predict that a person will not leave the company, while the F1 score for 1's shows that it will predict correctly that a person will leave the company 91 % of the time. Why can this be? In this case there was not an unbalanced dataset, but there was a 1:3 ratio between 1's and 0's. 

Why look at F1? F1, or F-beta is a combination of precision and recall where precision is a measure of how often we are correct, while recall is a measure of how often our model finds what it is suppose to find. Any model sacrificing any of these two methods to measure model score will lower its F1 score.
