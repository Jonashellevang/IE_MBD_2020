# IE_MBD_2020
This repository contains projects carried out during my Master's in Business Analytics & Big Data program while at IE School of Human Science and Technology (IE University). Below you will find a summary of each project carried out. You will be able to find the same summaries whitin each respecting folder, but if you prefer to scroll through them all at the same time instead of clicking on each individual folder, here you go:

## 23andMe: Genetic Testing for Consumers
For my "Big Data & Health" class we had to write a report based on our personal opinions about the case between the FDA in the USA and 23andMe. 

23andMe is one of the first consumer based genetic testing companies, co-founded by Anne Wojcicki in Silicon Valley in 2006. In 2007, the company, together with two other companies, announced that they were going to start selling Single Nucleotide Polymorphism (SNP) chip genetic testing kits directly to consumers, which would lead to easy access at an affordable price. The SNP chip genetic testing kits sequences only parts of the genome, which is why it could be done cheaper and faster than the first methods, you simply spit and wait for the results. Their plan to sell directly to consumers was met with skepticism and concerns as this had previously only been available through doctors, and that the consumer would not know how to interpret this data. However, the sale started, at a low speed, only boosted by increased awareness due to Angelina Jolie testing and openly speaking about her results.

During this whole process, FDA had been involved trying to regularize this new profound innovation. The process demanded many resources from both the genome companies and the FDA, leading to a mess of an outcome for 23andMe and Wojcicki to solve, where they received a letter addressing their lack of cooperation, and seizure of further sales of medical tests.

If you want to read more you can click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Big%20Data%20%26%20Health/23andMe%20Report.pdf).

## Healthcare Presentation
For my "Introduction to Big Data and Analytics" course we had to chose a topic of interest to present to the rest of our classmates. I chose to look further into the healthcare industry, and how this industry can be transformed the coming years.

To have a look you can click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Big%20Data%20%26%20Health/Healtcare%20Presentation%20-%20Intro%20to%20Big%20Data.pdf).

## Lung Cancer (sckit-learn)
In "Computer Vision" class we had to demonstrate the use of some image preprocessing techniques using sckit-learn. I wanted to see if there was any preprocessing techniques that would highlight the presence of cancer in a person's x-rays, and from experimenting with a few techniques, this is my final result, using thresholding:

![Thresholding](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Big%20Data%20%26%20Health/Lung%20Cancer.png)

As you can see after applying various thresholding techniques, the "Yen" technique was able to highlight the part of the lung where the cancer was forming. Thresholding is a technique where all pixels are compared to a threshold, and those below will be 0 and those above will be 255, creating these black and white images. I'm assuming Yen has a little higher threshold than the others compared to, making more of the pixels transform to white instead of black, which explains why the cancer part in the lung is here highlighted.

You can review the notebook [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Big%20Data%20%26%20Health/Lung%20Cancer.ipynb). Although we learned many techniques in our "Computer Vision" class, thresholding was the only thing I tried on this image. If you want to see more techniques check out the individual assignment I did in "Computer Vision" with classification by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Classification%20on%20Images%20(sklearn)/Classifying%20Cars%2C%20Planes%20and%20Trains.ipynb).

## SmellAway - Personal Health Manager
As our last group project we had to building an innovative data based product or service to improve the way people manage their health, with the goal of improving their health outcomes and customer health experience. Our answer to this was SmellAway!

Volatile Organic Compounds (VOCs) are vapors at ordinary room temperature, and our bodies release these chemicals all the time. This is why dogs are so prone to detect if someone is sick, or even sad, because they can smell it. If you have or have had a dog in your life, and maybe you have only heard of the concept, dogs can sense when you are sad, depressed or not feeling well in some sort of way. Your dog tries to cheer you up because it senses these things, which is what we build our idea on. We want to detect these abnormalities of smells.

Imagine if you can use some sort of device on a weekly or daily basis that could track how your body sent is evolving. Imagine if this device could detect changes of your body odor or breath when you are stressed out it will know, if you are starting to get depressed it will know, and if you have a cancer cell starting to grow inside you, it will know. It will know all of this information, and at the same time it can add this information to you history of VOCs, combine it with data about you such as age, sex, height, weight, and numerous other variables. 

To see the presentation you can click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Big%20Data%20%26%20Health/SmellAway%20Presentation.pdf).

## The Blood Test Makeover
The typical blood test report is an exercise in obfuscation, a document that needs to be translated by a lab technician or physician, and that’s if you somehow manage to see a copy of your results. In many US states, it’s illegal for a laboratory to send test results directly to a patient—a regulatory puzzle that leads some labs to simply deny direct results to any customer, anywhere. The blood may be yours—but the information it contains is not.

The task was to improve the way a typical blood test report conveys information using our dataviz skills and our intuitions about what could improve the patient experience. We created a prototype and presentation for this assignment.

You can view the prototype by clicking [this link](https://marvelapp.com/prototype/237fg7d6/screen/69231125). A Screenshot of one of the pages are below:

![Prototype](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Big%20Data%20%26%20Health/The%20Blood%20Test%20Makeover.png)

The presentation can be viewed by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Big%20Data%20%26%20Health/The%20Blood%20Test%20Makeover%20Presentation.pdf).

## Your.md (Now Healthily) App Presentation
Your.md, now changed name to Healthily, is a free app where anyone, anywhere can find safe and personalised information, guidance and support for their health. This was a very quick project, but you can view the presentation I made by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Big%20Data%20%26%20Health/your.md%20Presentation.pdf).

## Convolutional Neural Nets
As the first group assignment in "Machine Learning 3" we had to learn how to code CNNs, and as a bonus exercise, I created a [YOLOv3 Tutorial](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/YOLOv3%20Tutorial).

Convolutional neural networks or convnets or CNNs are a type of neural networks specialized on images. CNNs appears in 1998 introduced in a paper by Le-cun and Bengio. They were inspired on the research in the 1950s and 1960s on the visually perception on the brain. The first Convolutional Neural Network was called Le-Net5 and was able to perform the MNIST task (recognize written digits).

For the three first exercises, our goal was to build a neural net for classifying cats and dogs images, use regularization techniques and the consept of Transfer Learning on the Flower dataset.

The report can be accessed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CNN%20(Tensorflow%2CKeras)/CNN%20Report.pdf), and the exercise files can be accessed here:
* [Exercise 1 - Cats vs. Dogs](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CNN%20(Tensorflow%2CKeras)/CNN%20Cats_vs_Dogs%20Exercise%201.ipynb)
* [Exercise 2 - Cats vs. Dogs](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CNN%20(Tensorflow%2CKeras)/CNN%20Cats_vs_Dogs%20Exercise%202.ipynb)
* [Exercise 3 - Cats vs. Dogs](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CNN%20(Tensorflow%2CKeras)/CNN%20Cats_vs_Dogs%20Exercise%203.ipynb)
* [Exercise 3 - Flowers](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CNN%20(Tensorflow%2CKeras)/CNN%20Flowers%20Exercise%203.ipynb)

#### How to Avoid Overfitting
As part of a forum exercise in "Computer Vision" class I wrote a short paragraph about how to avoid overfitting in CNNs:

In general, the more filters we have, the more we are facing the risk of overfitting our CNN model due to the increased amount of parameters. To avoid this, we have to reduce the number of parameters, and this we obtain with the pooling operator. The pooling operator has two goals:
1. to reduce the size of the representation and therefore increase the computation speed
2. summarize or extract the key information discarding some noise information

For pooling we usually use a window size of 2 or 3, and a stride (moving window) of 2. The "window" is then moved across the filtered image, and for example in the most used pooling operator, max pooling, we take the maximum value from the window and with that we reduce the size, increase the speed, discarding noise information and extract only the key information from the image.

We can also avoid overfitting by using a regularization technique, where the most popular one is dropout. This can be used when after a certain epochs, training loss is going down, but validation loss increases. This is a clear sign of overfitting, and works in a way that you define a "dropout-rate" where you define a probability that a neuron is dropped with a probability p. This will keep happening during each iteration, and the dropped out neurons are resampled again with a probability p at every training step. This helps the model to not be too dependent on certain neurons, and therefore helps to reduce overfitting.

If we are training on few samples, data augmentation is the way to go to reduce overfitting! Data augmentation creates new samples of our images, and if we have pictures of dogs, we can increase the size of the training data by shifting, rotating, contrast changes, resizing, normalization and many other data augmentation techniques to the images of the dogs we already have. Before you know it, your training sample is much larger than it originally was. 

## CRISP-DM Methodology
This guide can be used for you as a member of the analytical team of a company. We have presented a guide with examples for each phase of the CRISP-DM process, showing hands on which steps to take in each phase. The guide will teach you how to deal with each problem, and how to avoid mistakes or duplicate of work from any team that might be involved in the process. You will also be able to know how to deal with changes in the organization and its objectives, in data sources, and in available technology. This guide will walk you through the eight steps of CRISP-DM, their tasks and their outputs. These phases can be viewed as a cyclical methodology to emphasize the new challenges and way of work:

![CRISP-DM Methodology](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CRISP-DM%20Methodology/CRISP-DM.png)

To read the report you can click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CRISP-DM%20Methodology/CRISP-DM%20Report.pdf), and to view the presentation you can click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/CRISP-DM%20Methodology/CRISP-DM%20Presentation.pdf).

## HR Analytics - Predicting Turnover For A Large Company (Kaggle)
This is a binary Kaggle competition using the HR Analytics dataset including explanatory variables of around 15k employees of a large company. The goal of the case study was to model the probability of attrition (employees leaving, either on their own or because they got fired) of each individual, as well as to understand which variables are the most important ones and need to be addressed the right away.

Link to the competition can be found [here](https://www.kaggle.com/lnvardanyan/hr-analytics).

Throughout the model Cross Validation (CV) was used together with other measures to make sure the model is not biased or overfited, as well as tried and failed with many methods. The focus was on weighted F1 score due to the fact that the target variable, if a employee were to leave the company or not, had more 0's than 1's. To balance this relationship between precision and recall Weighted F1 was used, which gave the result of .96 with a weighted CV score of .95 (+/- 0.01).

The F1 score for 0's shows that the model will 97 % of the times correctly predict that a person will not leave the company, while the F1 score for 1's shows that it will predict correctly that a person will leave the company 91 % of the time. Why can this be? In this case there was not an unbalanced dataset, but there was a 1:3 ratio between 1's and 0's. 

Why look at F1? F1, or F-beta is a combination of precision and recall where precision is a measure of how often we are correct, while recall is a measure of how often our model finds what it is suppose to find. Any model sacrificing any of these two methods to measure model score will lower its F1 score.

To see the python notebook you can click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Classification%20(sklearn%2Cmatplotlib)/Predicting%20Turnover.ipynb).

## Pump it Up: Data Mining the Water Table (DrivenData)
This is a multi-class DrivenData competition done using data from Taarifa and the Tanzanian Ministry of Water where the objective is to predict which water pumps are functional or need repairs. It was done as a group assignment as part of our Machine Learning II coursework using Python. The final result achieved was a classification rate of 0.8129 (top 10%).

Link to the competition can be found [here](https://www.drivendata.org/competitions/7/pump-it-up-data-mining-the-water-table/), and the python notebook can be accessed through [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Classification%20(sklearn%2Cmatplotlib)/Water%20Pump%20Prediction.ipynb).

## Classifying Cars, Planes and Trains
In this "Computer Vision" class assignment I experimented with various models trying to predict the 3 different commute machines from the VOC dataset. Various methods and pre-processing steps was tried out, where the selected best one used on the Decision Tree Classifier was used on other machine learning models as well to predict if it is a plane, automobile or a train.

![Result](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Classification%20on%20Images%20(sklearn)/Classifying%20Cars%2C%20Planes%20and%20Trains.png)

The notebook can be reviewed by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Classification%20on%20Images%20(sklearn)/Classifying%20Cars%2C%20Planes%20and%20Trains.ipynb).

## Cluster Analysis
The report summarizes the Cluster analysis done to the stores of a retail company located in Bogotá. This data was given by a real retail company with the objective of classifying their stores in categories based on the demographic and sales data at hand, to better distribute the product portfolio in their stores to maximize sales. Also, this company made their own categorization in the past with 4 categories, the scope of this report is also to compare our cluster analysis with their personal categorization and provide insights if there are significant differences.

![cluster analysis](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Cluster%20Analysis%20(Dataiku)/Cluster%20Analysis.png)

To view the report you can click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Cluster%20Analysis%20(Dataiku)/Cluster%20Analysis%20Report.pdf), and to view the presentation you can click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Cluster%20Analysis%20(Dataiku)/Cluster%20Analysis%20Presentation.pdf).

## Protecting The Endangered - Saving Elephants With YOLOv3
Lately, the large mammal populations have been declining dramatically each year. Especially concerned are the elephants, the largest land animals are slowly falling into the extinct list of animals. They are especially being poached for their ivory tusks which are used for jewelry and luxurious furniture elements. Ivory tusks trades are illegal but there is still a growing market for it in Asia, highlighting the continuous threat to the animal.

As a result, the estimated population of elephants decreased from 12 million to 400 000 in the last century alone according to the WWF. Moreover, an estimated 20,000 elephants are poached for their tusks every year.

This is where our proposed solution using computer vision comes in. Our idea is to use real- time object detection coupled with readily available drones in order to partly solve problem of poaching and animal extinction in general. Indeed, with advancement in technology, drones are becoming cheaper and more powerful each year. And with the development of machine learning model in computer vision, we believe that we could develop performant models at affordable prices.

As a result the drone would be sending real-time streams to a control room where our custom-trained object detector could help with:
1. Precise control of population of endangered species;
2. Poaching control;
3. Control of movement of animals in order to save them from especially dangerous
zones.

Our solution focused on points 1 and 2 mainly as we trained our various models to recognize animals (especially elephants) from aerial shots.

![Saving Elephants](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Computer%20Vision%20(YOLOv3)/Saving%20Elephants%20with%20YOLOv3.png)

The notebook is quite long due to all the coding, but can be accessed by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Computer%20Vision%20(YOLOv3)/Saving%20Elephants%20with%20YOLOv3.ipynb). If you want a better picture of the work, the report is a better option and can be accessed by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Computer%20Vision%20(YOLOv3)/Saving%20Elephants%20with%20YOLOv3%20Report.pdf).

## Data Integration Design (Pentaho)
During the first assignment we created a data warehouse (or better said, a data mart) based on a specific data set. This second assignment was focused on Data Integration with Pentaho. It consisted on designing a one-time historic data load using an ETL (Extraction, Transformation, Loading) tool. That means create an ETL process for each dimension and fact table(s) from the [previous assignment](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/Data%20Warehouse%20Modelling%20(MySQL)).

#### Deliverables
* [Data Mapping document](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Data%20Integration%20Design%20(Pentaho)/Data%20Mapping%20Instructions%20Report.pdf): this document describes the default strategy for extracting data from data source, data mapping process and data quality tracking and metadata approach.
* [ETL scripts](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/Data%20Integration%20Design%20(Pentaho)/Data_integration_groupF): The collection of ETL processes created with Pentaho Data Integration. This is a folder, so there is many files stored here.

## Dashboard Design (Tableau)
During the first and second assignment of the class "Business Intelligence & Datawarehousing" we created a data warehouse and data integration processes. This third assignment was done on an individual basis and focused on generating value from our data warehouse by designing a dashboard using Tableau.

The dashboard is created having the Sales Managers of the Federal Communications Commission (FCC) in mind, giving them an overview of the status of licenses specified as all, active, cancelled, expired and terminated.

![Tableau Dashboard](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Data%20Visualization%20(Tableau,R,Carto,D3.js)/Dashboard%20Design%20(Tableau)/Dashboard.png)

#### The Two Previous Assignments:
* [Data Warehouse Modelling (MySQL)](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/Data%20Warehouse%20Modelling%20(MySQL))
* [Data Integration Design (Pentaho)](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/Data%20Integration%20Design%20(Pentaho))

## Crimes in San Francisco (Carto)
For our "Data Visualization" class I created this Carto visualization, where I focused on where you find the most crime in San Francisco. Factors such as income, where police stations are placed in the city and population can be found while investigating the map.

![Crime in San Fransisco](Carto.png)

#### Navigating through the map (if all filters are unchecked)
As a first step, it makes the most sense to add the grid lines of the zip-code (layer 2) before adding the police stations (layer 3) to the map. From this, we can see that the police stations are placed very close to each other and keeping that in mind we can add the next layer. We start off by adding severity of crimes (layer 5) to see where the most severe crimes are located, if this view is not satisfying, we can focus on the most severe crimes (valued 5)
from the widgets. If you want to investigate certain months of the year you can use the widget “Month of Crime”, or if you want to analyze certain types of crime you can do that also. Going back to the main view we can remove the first layer and add the number of incidents (layer 4). Here we can see that most crimes are in the same areas and that every police station is either placed on or around an area of a high density of crime. We can also add the last layer (layer 1) to see that areas with little crime also has a low average income per household, and by hovering over the dollar sign we get information such as population, average income per household and rank of income compared to other zip codes in san Francisco and nationally.

To view the map on Carto please click [this link](https://jonashellevang.carto.com/builder/254d481d-e282-47d8-90cb-10e64c8e259a/embed).

## One week of Jonas' Sleep (D3.js)
As a group assignment for our "Data Visualization" class we decided to create a visualization of my sleep where we chose a Random week of the year. I have a love of electronic devices, and have tracked movement, sleep, and other health data for years through alarm clock's, weight scales, Apple Watch and my iPhone. It was fun to see how it was possible to visualize some of this data.

![D3.js Visualization](D3.png)

The code can be viewed [here](http://bl.ocks.org/Jonashellevang/03ec4d5e4593a451445e8726076dbe61), and the visualization is best viewed by [clicking this link](http://bl.ocks.org/Jonashellevang/raw/03ec4d5e4593a451445e8726076dbe61/).

#### How to start the visualization
To get the visualization going, you click on the day you want to look at where "Day1" is Monday and so on, and click start. By doing so you can see that the bar line is moving through the hours of the night. You can also reset the chart, or simply press a new day and look at the new visualization, comparing the days with each other.

## Worldwide Alcohol and Tobacco Consumption (R - ggplot)
For our first assignment in our "Data Visualization" class we had to create a ggplot with several plots where we had plots that was both moving and not moving. Since there are so many plots for this one, not all of them are shown here, but if you would like to check them all out, please [check out the PDF of our R-Markdown](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Data%20Visualization%20(Tableau%2CR%2CCarto%2CD3.js)/R%20-%20ggplot/Worldwide%20Alcohol%20and%20Tobacco%20Consumption.pdf). If you want to see the moving plots as well, I recommend you [download the HTML file](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Data%20Visualization%20(Tableau%2CR%2CCarto%2CD3.js)/R%20-%20ggplot/Worldwide%20Alcohol%20and%20Tobacco%20Consumption.html).

![Tobacco Consumption Europe](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Data%20Visualization%20(Tableau%2CR%2CCarto%2CD3.js)/R%20-%20ggplot/Tobacco%20Consumption%20Europe.png)

#### General Findings:

1. The average alcohol consumption has been consistently decreasing in the OCDE countries, this is mainly because in europe (the one that has more countries) has been consistently decresing. Also the distribution of the alcohol consumptions has narrowed through the years.


2. Like Alcohol, Tobacco has seen a sharp decrease in the amount of tobacco consumption thanks to Europe. The main difference in this case is that some countries have started to become bigger outliers and decreased their consumption far less then the average (bigger outliers).


3. As both consumptions have decreased throught time, we can see a stronger decrease in tobacco compared to alcohol. After looking at the dynamic scatter plot we can see a consistent behaviour toward decresing both alcohol and tobacco together.

## Data Warehouse Modelling (MySQL)
This was a group assignment where we as a group had to present a:
* Data Set analysis
* Data Warehouse Approach Selection
* Data Warehouse Design

![Logical Design](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Data%20Warehouse%20Modelling%20(MySQL)/Schema%20Logical%20Design.png)

#### Data Set Analysis
We analyzed the dataset, detected duplicates and detected potential data quality issues such as missing values, incomplete values and errors. 

#### Data Warehouse Approach Selection
We had to choose between using a corporate information, multidimensional approach or data vault approach in the assignment based on the assigned dataset.

#### Data Warehouse Design
In this section we identified the entities based on our data vault approach (hubs, links and satellites), discussed the model and implemented the design with MySQL Workbench. 

For this dataset we chose data vault. In conclusion, the advantages of the snowflake schema in terms of querying are not significant to the use case. In terms of changing user requirements over time, the data vault provides more flexibility and through the ability to retain the original data structure, it’s better suited for regulation, which is the FCC’s (Federal Communications Commission in the US) purpose. Therefore, the data vault was chosen as the schema for the data warehouse.

The report can be viewed by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Data%20Warehouse%20Modelling%20(MySQL)/Data%20Warehouse%20Design%20Report.pdf), and if that isn't enough, you can download the data warehouse design [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Data%20Warehouse%20Modelling%20(MySQL)/Data%20Vault%20Design.mwb).

## Forecasting w/Non-Seasonality (R)
In the first assignment in "Forecasting Time Series" class we had to do the following tasks with the data that was provided to us:
1.	Plot the series, its correlogram and its histogram.
2.	Using the information in the previous plots, discuss whether the series is stationary, has a marginal Normal distribution, is white noise, strict white noise or Gaussian white noise, the dynamic dependence of the series can be represented by a linear model and if there are potential non-linear dependences
3.	For the non-stationary time series, justify the proper transformation to stationarity, and respond the same questions in 2 for the transformed stationary data.
4.	Finally, justify your previous answers using basic statistics and formal tests when available.

The result can be viewed by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Forecasting%20Time%20Series%20(R)/Non-seasonality.pdf).

## Forecasting w/Seasonality (R)
In the second assignment in "Forecasting Time Series" class we had to do the following tasks with the data that was provided to us:
1.	Find at least two linear time series models, using the Box-Jenkins methodology, for the quarterly earnings per share of Coca-Cola Company from the first quarter of 1983 to the third quarter of 2009. Identify your models using the entire available sample.
2.	For the models identified in the previous step, leave for example the last 24 real values to compare all the models in terms of forecasting (out of sample forecasting exercise). What is the best model and why is this your choice?

The result can be viewed by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Forecasting%20Time%20Series%20(R)/Seasonality.pdf).

## Deep Generative Adverserial Nets
This practice session pursues the following objectives:
- To understand and create our own Generative Adversarial Neural Nets
- To evolve them to create Conditional Adversarial Neural Nets

Generative Adversarial Networks (GANs) was invented by Ian Goodfellow in 2014 and is one of the most brilliant ideas in the last 10 years within the field of Machine Learning. The general idea is to generate images, but now we are using them for many other things. The model uses variational autoencoders for the Generator to create new images, while it uses the Discriminator to classify the generated images from real images.

![GANs](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs%20(Tensorflow)/GANs.png)

The topic is described further in the report that you can access by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs%20(Tensorflow)/GANs%20and%20CGANs%20Report.pdf). Although the results are all in the report, it does not contain the GIFs created. These can be viewed below:

For the first notebook called "[01_DCGAN_MNIST.ipynb](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs%20(Tensorflow)/01_DCGAN_MNIST.ipynb)" I optained this result for the first 100 Epochs:

![MNIST Numbers](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs%20(Tensorflow)/01_dcgan_100Epochs.gif)

For the second notebook called "[02_DCGAN_CIFAR10.ipynb](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs%20(Tensorflow)/02_DCGAN_CIFAR10.ipynb)" I optained this result for the first 100 Epochs:

![MNIST CIFAR10](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs%20(Tensorflow)/02_dcgan_100epochs.gif)

For the 200 next Epochs I obtained this result:

![MNIST CIFAR10](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs%20(Tensorflow)/02_dcgan_Additional200epochs.gif)

For the third notebook called "[03_CDCGAN_FASSION_MNIST.ipynb](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs%20(Tensorflow)/03_CDCGAN_FASSION_MNIST.ipynb)" I had to make the Conditional Generative Adverserial Net from scratch and obtained this result:

![MNIST Fashion Dataset](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/GANs%20and%20CGANs%20(Tensorflow)/03_cdcgan_100Epochs.gif)

## Hadoop
A brief report explaining a big data use case for DELL and Cloudera where I looked at the issue from a technical point of view in order to learn and understand the solution. The report can be accessed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Hadoop/Cloudera%20and%20Dell.pdf).

## IBM Watson - Edwin, The Educational Chatbot
For the class "Watson Challenge" we had to create a chatbot based on our own idea, where we decided to create a chatbot for MOOC's in the educational sector that we named "Edwin". The jury liked the chatbot itself, but the idea is not as scalable as other chatbots, which my team and I agree with. This chatbot can however help when watching videos, replacing teachers because the chatbot will be ble to answer your questions. 

![Chatbot Preview](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/IBM%20Watson%20Chatbot/Chatbot%20Preview.png)

You can test the chatbot by pressing [this link,](https://web-chat.global.assistant.watson.cloud.ibm.com/preview.html?region=eu-gb&integrationID=e434435f-f7dd-43c6-a17b-5b501a634d36&serviceInstanceID=735ddf0c-d549-441d-acc6-586cd33aaffb) and it you want to see the video the chatbot is based on, you can [visit the YouTube video here!](https://www.youtube.com/watch?v=z-EtmaFJieY&list=PL8dPuuaLjXtNlUrzyH5r6jN9ulIgZBpdo&t=332s)

The actual chatbot has been downloaded for you to use and build on if you wish, and all you have to do is download [Edwin.json](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/IBM%20Watson%20Chatbot/Edwin.json) to your computer and upload it to IBM Watson Assistant. You can also view our presentation by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/IBM%20Watson%20Chatbot/IBM%20Watson%20Presentation.pdf).

## LSTMs For Time Series (Tensorflow)
This pracitce file is a tutorial from Tensorflow that I used and played with after our session about RNN and LSTM in "Machine Learning 3" class. Although it does not show my own work in the terms that this file is provided, it gave me the knowledge on how to do this on my own. The file can be accessed by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/LSTM%20(Tensorflow)/LSTMs%20for%20time%20series.ipynb).

![LSTM](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/LSTM%20(Tensorflow)/LSTM.png)

## Exploratory Data Analysis Report
This is an individual assignment for "Math & Statistics for Data Analysis" class where I:
* Preprocessed the data by removing rows containing missing values
* Presented a table with the descriptive statistics of all car properties (min, max, mean, median, quartiles)
* Presented plots of histograms of the various properties
* Presented boxplots of the price for each car brand
* Performed a filtering of outliers of the price column discussing the methods used to obtain them
* Drew conclusions regarding the data set

You can access the report by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Python%20(Pandas%2CNumpy)/Energy.png).

## Inferential Statistics Report
This is a group assignment for "Math & Statistics for Data Analysis" class where we covered the results of a survey sent out to IE Master students about pizza and hamburger preferences and the following statistical analysis of those results. The objective of this report is to show how statistical analysis helps us achieve pertinent conclusions even in simple surveys like the one done here.

You can access the report by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Math%20%26%20Statistics%20for%20Data%20Analysis/Inferential%20Statistics%20Report.pdf).

## NLP Class Exercises
#### [Language Models.ipynb](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Natural%20Language%20Processing/Class%20Exercises/Language%20Models.ipynb)
In this notebook we went through creating sentences from grams.

#### [NER.ipynb](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Natural%20Language%20Processing/Class%20Exercises/NER.ipynb)
In this practical lab we focused on one of the main Information Extraction methodologies: Named Entity Recognition (NER). NERs focus is to to detect and classify the names in the text.

In the theoretical session we also presented three main methodologies to address the recognition of named entities:

* Hidden Markov Models
* MaxEnt Markov Models
* Conditional Random Fields

#### [POS Tagging.ipynb](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Natural%20Language%20Processing/Class%20Exercises/POS%20Tagging.ipynb)
In this notebook we went through the process of POS tagging.

### [Semantics.ipynb](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Natural%20Language%20Processing/Class%20Exercises/Semantics.ipynb)
NLTK provides a useful WordNet interface to play with the WordNet data (included into the nltk.corpus). In this notebook we learned how to use it.

## Disaster Tweets (Kaggle)
On a general note, this assignment was in particular interesting because even though concepts and theory from class was understood, we still had not run any sort of machine learning process like this. It was not until after the process of EDA I understood that when we vectorize the text, creating new features and doing “normal” machine learning processes are completely different. For me, that was the biggest discovery of this assignment. The machine learning process is way different, and that highlights the importance of proper cleaning and processing of the text.

![Wordcloud](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Natural%20Language%20Processing/Disaster%20Tweets%20Wordcloud.png)

We used the Kaggle competiton [Real or Not? NLP with Disaster Tweets](https://www.kaggle.com/c/nlp-getting-started), and both the report and python notebook is incluced in this repository. You can access the notebook by clicking the file "Disaster Tweets.ipynb" or [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Natural%20Language%20Processing/Disaster%20Tweets.ipynb) and the report can be accessed by clicking the file "Disaster Tweets Report.pdf" or [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Natural%20Language%20Processing/Disaster%20Tweets%20Report.pdf).

## The Great Firewall of China (SOA Report)
Natural language processing techniques cover a wide variety of practical applications. NLP can be used for everything from judging sentiment to identifying spam, but one of the most dynamic applications is through encoding and decoding. While the idea of “codes” might bring to mind Indiana Jones movies, the modern use cases more often concern hiding content from government and private companies, and on the other hand, decoding said information. Tight censoring regulations in China have resulted in widespread use of modern language processing, with citizens developing an ever-evolving lexicon of codewords, while the government and social platforms try to keep up. This chase has led to a game of cat-and-mouse, that while deeply restrictive for the Chinese people, has also created practical applications for state-of-the-art natural language processing techniques.

![img](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Natural%20Language%20Processing/The%20Great%20Firewall%20of%20China%20Map.png)

The report can be accessed by clicking the file "The Great Firewall of China Report.pdf" or by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Natural%20Language%20Processing/The%20Great%20Firewall%20of%20China%20Report.pdf).

## MongoDB and HBase Summary
I didn't have much work for HBase as it was not a part of an assignment. I therefore decided to upload my summary document I used to prepare for the Exam that I got full marks on. It's not the cleanest document as it was meant for personal use, but hopefully it will either help you or show you what I know. By clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/NoSQL%20(MongoDB%2CHBase)/MongoDB%20and%20HBase%20Summary.pdf) you can see the work done.

## MongoDB
This was a group assignment where we did some simple queries. By clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/NoSQL%20(MongoDB%2CHBase)/MongoDB.pdf) you can see the work done.

## Creating Functions (.py)
For this group assignment we had to create different functions to obtain the information asked for:
1. Create a function read_savings_data that reads the file named bank.csv and returns a list of dictionaries.
2. Create a function calculate_total_savings, that receives a list of dictionaries like the one resulting from read_savings_data, and computes the total savings of all clients in the bank. Do not use the function sum provided by Python.
3. Create a function richest_person, that receives a list of dictionares like the one resulting from read_savings_data, and returns the name of the person that has the highest amount of money.
4. Create a function poorest_person, that receives a list of dictionaries like the one resulting from read_savings_data, and returns the name of the person that has the lowest amount of money.
5. Create a function get_all_countries, that receives a list of dictionaries like the one resulting from read_savings_data, and returns a list of all different countries, with no duplicates.
6. Create a function calculate_average_savings, that receives a list of dictionaries like the one resulting from read_savings_data, and returns the average savings of all people in the bank. Do not use the function sum provided by Python.
7. Create a function people_per_country, that receives a list of dictionaries like the one resulting from read_savings_data, and returns a dictionary where the keys are the different countries in the input, and the values are the number of people that are from each country.
8. Create a function write_report, that writes a report in a file named report.json.

You can access the file to see the work done by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Python%20(Pandas%2CNumpy)/Creating%20Functions.py).

## Energy Analysis (.ipynb)
This was an individual assignment where I used a dataset for energy in Spain. By clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Python%20(Pandas%2CNumpy)/Energy%20Analysis.ipynb) you can see the work done.

![Energy](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Python%20(Pandas%2CNumpy)/Energy.png)

## IMDb Analysis (.ipynb)
This was an individual assignment where I used a dataset for IMDb and analyzed the data. By clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Python%20(Pandas%2CNumpy)/IMDb%20Analysis.ipynb) you can see the work done.

![IMDb](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Python%20(Pandas%2CNumpy)/IMDb.png)

## COVID-19 Global Forecasting (Kaggle)
In this assignment we tackle the COVID-19 prediction competition hosted on [Kaggle](https://www.kaggle.com/c/covid19-global-forecasting-week-4/overview). We first start by a general Exploratory Data Analysis, that can be accessed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20COVID19%20Global%20Forecasting%20/work_EDA.Rmd). However, I would recommend seeing the work where you can play with the EDA by clicking [this link](https://jonashellevang.shinyapps.io/COVID19_Forecasting_EDA/). We focus the EDA on the provided data, as well as external data to find more insights and information about the pandemic. We then try various modeling approaches ([time series model](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20COVID19%20Global%20Forecasting%20/ts_model.R) and [machine learning model](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20COVID19%20Global%20Forecasting%20/ml_model.R)) to predict the trends of the spread of the virus in the studied countries given. Our goal was to provide the most effective model, trying to include the most relevant information into our models.

Below is a screenshot from the R-markdown for the EDA of a heatmap:

![Heatmap](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20COVID-19%20Global%20Forecasting%20/Heatmap.png)

## ShinyApplication and Leaflet for Boston Housing Data
For an assignment in "Advanced R" class we were given some choices of datasets from where we were to build an interactive map using any mapping tool we wanted, and R markdown file as well as a Shiny application. I chose the Boston Housing data.

Where in Boston do you want your children to grow up? In thes map, you can see which areas is safer and where your children can get more time with their teacher. For you as a parent, or even if you don’t have kids, you can enjoy other selection criterions as well, including where you should live based on pricing and similar people like yourself.

![Shiny App](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Shiny%20App%20with%20Leaflet%20in%20R-Markdown/Shiny%2C%20Leaflet%20and%20R-markdown.png)

The result of the Shiny application can be viewed by clicking [this link](https://jonashellevang.shinyapps.io/Boston_Housing/), and the R-Markdown can be accessed by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Shiny%20App%20with%20Leaflet%20in%20R-Markdown/Shiny%2C%20Leaflet%20and%20R-markdown.Rmd).

## AMS 2013-2014 Solar Energy Prediction Contest (Kaggle)
The goal of this contest was to discover which statistical and machine learning techniques provide the best short term predictions of solar energy production. We  predicted the total daily incoming solar energy at 98 Oklahoma Mesonet sites, which serves as "solar farms" for the Kaggle competition. The R-Markdown is published and can be viewed by clicking [this link](https://rpubs.com/jonashellevang/Exploratory_Data_Analysis). You can also see the raw file by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Exploratory%20Data%20Analysis.Rmd).

![EDA](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/EDA.png)

Link to the competition can be found [here](https://www.kaggle.com/c/ams-2014-solar-energy-prediction-contest).

#### SUPPORT VECTOR MACHINES MODEL (best)
The file "[SVM Prediction (best prediction).csv](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/SVM%20Prediction%20(best%20prediction).csv)" is the output of the most accurate model "[SVM Model (best model).R](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/SVM%20Model%20(best%20model).R)". This model used the first 20 PCs from "solar_dataset.RData". The methodology was always a grid search and training a new model for each station.

The MAE score of the best SVM model on Kaggle was 2,290,458 (public) & 2,529,143 (private).

This was also the best score amongst our peers in the class.

#### NEURAL NETWORK MODEL (2nd best)
The "[Neural Network Models](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models)" folder contains all neural network architectures and instructions in "[Model History.xlsx](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models/Model%20History.xlsx)" (this needs to be downloaded to be viewed). The best model on the validation set was "[wide-and-deep 5.R](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models/wide-and-deep%205.R)". It was then retrained on the train and validation data and tested on the test data, in "[wide-and-deep test.R](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models/wide-and-deep%20test.R)". After confirming it worked well on the test set, we made predictions on all 98 stations using a for-loop and training a new model every time. The code for that is "[wide-and-deep prediction.R](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models/wide-and-deep%20prediction.R)" and the output it "[wide-and-deep prediction.csv](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/R%20-%20Solar%20Energy%20Prediction/Neural%20Network%20Models/wide-and-deep%20prediction.csv)".

The MAE score of the neural network model on Kaggle was 2,368,914 (public) & 2,637,624 (private).

## Recommendation Engines: Business Case - Instagram
For this group assignment in "Recommendation Engines" class we had to describe a business case that uses at least one recsys, and for this we chose to write about Instagram. The main goal was to apply the strategic thinking we learned in class in a deeper way.

Instagram has been the fastest growing social media app, thanks to its recommendation system that make the platform so entertainable. However, those recommendation systems could be improved by implanting a more hybrid form that would not only suggest what you may have seen, but also suggest what your close friends have liked. Furthermore, to not overwhelm the user with useless information the option of seeing the followers with whom they interact the less and being able to unfollow them directly could be a solution to the overload of pictures, videos or stories that one could suffer from. Finally, Instagram could implement a new revenue stream with the creation of an additional service connecting businesses to an influencer that match their image and their need, using a content based recommendation system.

If you want to read the whole report, you can access it by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Recommendation%20Engines/Business%20Case%20-%20Instagram.pdf).

## Regression - Real Estate in Madrid
The report summarizes the real state analysis done to properties located in Madrid. In the report I explain the method used to obtain the real state data, a description of the characteristics of the data obtained and what they mean, the cleaning process of it, the applied regression model and finally some conclusions from the data. You can access the report by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Regression%20-%20Real%20Estate%20in%20Madrid%20(Dataiku)/Regression%20-%20Real%20Estate%20Madrid%20Report.pdf).

![Best Model](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Regression%20-%20Real%20Estate%20in%20Madrid%20(Dataiku)/Best%20Model.png)

## AWS Deep Racer
As an assingment for the class "Reinforcement Learning" we had to learn how to make a car drive by itself. Yes, I agree, it sounds like a cool assignment right? And it was, I think it was my favorite, and it was so addicting!

Amazon writes this on their page: "AWS DeepRacer gives you an interesting and fun way to get started with reinforcement learning (RL). RL is an advanced machine learning (ML) technique that takes a very different approach to training models than other machine learning methods. Its super power is that it learns very complex behaviors without requiring any labeled training data, and can make short term decisions while optimizing for a longer term goal.

* Build models in Amazon SageMaker and train, test, and iterate quickly and easily on the track in the AWS DeepRacer 3D racing simulator.
* Experience the thrill of the race in the real-world when you deploy your reinforcement learning model onto AWS DeepRacer.
* Compete in the world’s first global, autonomous racing league, to race for prizes and glory and a chance to advance to the Championship Cup."

Below you can see a GIF of my race and the scoreboard where I placed 3rd out of 17 participants in my group:

![AWS DeepRacer](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning%20(AWS)/DeepRacer.gif)

![Scoreboard](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning%20(AWS)/Scoreboard.png)

The youtube link to access the video can be viewed [here](https://youtu.be/nVsVUfC0EdE).

## Lunar Lander
For our first assignment in "Reinforcement Learning" I worked with the OpenAI's Lunar Lander gym. I used reinforcement learning (RL) to train a lunar lander vehicle in a Box2D simulation environment to land itself on the surface of the moon. I adjusted hyperparameters and the reward function as I considered appropriate, ran the training multiple times and compared the results. The notebook can be accessed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning%20(AWS)/lunarlander.ipynb).

![Lunar Lander](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning%20(AWS)/LunarLander.gif)

## Q-Learning
As a group project in the class "Reinforcement Learning" we chose to dive deeper into the topic of Q-learning. Within reinforcement learning there are two main algorithm methods; model-based and model-free. 

Model-based algorithms utilize reward functions to progressively improve the model, on the other hand model-free algorithms disregard the normal reward functions and estimate their own value functions for an unknown Markov decision process, based on experience. Examples of these different type of algorithm are Monte-Carlo Learning, Temporal-Difference Learning, and Q-Learning.

The most popular of these methods is Q-Learning and like other model-free algorithms is characterized as off-policy learning. This means that the algorithm finds the best possible action considering its current position. Through this method an agent’s objective is to obtain the maximum number of points, and Q-learning attempts to learn how many points it is expected to get if it were to behave perfectly.

To read the full report you can click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning%20(AWS)/Q-Learning%20Report.pdf). The presentation can also be viewed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning%20(AWS)/Q-Learning%20Presentation.pdf).

## Reinforcement Learning - Final
Due to the COVID situation our professor decided not to have an exam, rather we sent him a paper answering several questions. The report can be viewed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Reinforcement%20Learning%20(AWS)/Reinforcement%20Learning%20-%20Final%20Report.pdf), and the report answers these questions:
1. What is Reinforcement Learning and how is it different from other methods like Supervised or Unsupervised Learning
2. What are Markov Decision Process (MDP) and Bellman’s equation?
3. What is a Dynamic Programming (DP) method and how is it different from MDP methods?
4. What is a Multi-armed Bandit problem, and what are example applications of it in real-life?
5. Explain 2 algorithms for solving a Multi-Armed Bandit problem
6. What is the difference between Model-based and Model-free RL methods?, describe a method for each
7. What is the difference between On-policy and Off-policy RL methods?, describe a method for each
8. What are the advantages and disadvantages of Monte Carlo (MC) methods vs Temporal Difference (TD) methods?
9. What is SARSA and how is it different from Q-learning?
10. Describe the following three RL algorithms, and how these work in high level:
* Principal Policy Optimization (PPO)
* Meta-Q-learning
* Asynchronous Advantage Actor Critic (A3C)

## SQL
For our SQL & Data Modelling class we had two group assignments, one with some very basic queries to introduce us to SQL that can be viewed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/SQL/Simple%20Queries%20Group%20Assignment.pdf), and one with a little bit more advanced queries that can be accessed [here](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/SQL/More%20Advanced%20Queries%20Group%20Assignment%202.pdf).

## Mlimi - Empowering Malawians
Smart Cities & Governments: The economy of Malawi, the southern Africa country, is predominantly based on agriculture. Indeed, agriculture accounts for 30% of GDP and generates over 80% of national export earnings. The sector employs more than 60% of the country’s workforce and greatly contributes to food and nutrition security. Although there is potential for better production and productivity, the agriculture sector has been operating greatly below its capacity and faces many challenges. Indeed, Malawi is the third poorest country in the world with half the population living below the poverty line.

![Empowering Malawians](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Smart%20Cities%20%26%20Governments/Empowering%20Malawians.png)

After some research, we have found that the main challenges faced in the agricultural sector in the country are:
1. Vulnerability to weather shocks;
2. Poor management of land, water and soils;
3. Low adoption of agricultural technologies;
4. Low access to finance and farm inputs;
5. Low mechanization and technical labor skills;
6. A limited irrigation system and weak linkages to markets.

Also, the majority of the country’s agricultural research agenda is donor-funded, thereby creating a very precarious situation for sustainable technology generation and development for the economy and the sector in particular. Thus, indicating that a low- budget solution should be thought of, which we tried doing in our analysis here.

We thus decided to implement a platform application that would use data and try helping solve some of these issues. Mainly, we focused on solving 2 problems:
1. The vulnerabilities of the population to weather shocks;
2. Farming education, which include topics such as implementing community-based centers that initiate actions based on data.

To help navigate our work, we here give an overview of the deliverables and where they fit in:
* [PDF report](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Smart%20Cities%20%26%20Governments/Empowering%20Malawians%20Report.pdf): the full report explaining the problem, solution we came up with and our reasoning
* [Prototype Model Jupyter Notebook](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Smart%20Cities%20%26%20Governments/Empowering%20Malawians%20Prototype.ipynb): as will be tackled in the report, we have developed a prototype machine learning model to illustrate one of our solutions. This is an illustration that our proposition could be implemented
- Javascript Google Earth Engine sample: We have extracted data from Google Earth Engine, as described in the report.

## Oslo as a Smart City
For this individual assignment in the "Smart Cities & Governments" class we had to find “use cases” that a city of our own choice has implemented. I decided to write about Oslo, not only because I'm Norwegian and have lived there for 5 years, but also because it is one of the leading countries with smart city technology.

![Oslo](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Smart%20Cities%20%26%20Governments/Oslo.jpg)

In 2019, Oslo started the year as the “European Green Capital”, awarded by the European Commission. When visiting, you can see electric or hydrogen busses driving by, hitch a ride with the tram run on electricity, park your car and pay with your phone, pay for public transportation on your phone, connect your travel route by city bikes and public transportation in the transportation planner app, check how your children are doing in kindergarten by a few clicks on your phone and much more. The city of Oslo is about digitalization, and what can be digitalized, will be digitalized. Oslo is committed to making the city as green and best for people as possible, with many projects at their hand. A few of them will be discussed when looking at different use cases about Oslo’s data strategy, smart people, smart mobility and smart environment.

If you want to read more, you can access the report by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Smart%20Cities%20%26%20Governments/Oslo%20as%20a%20Smart%20City%20Report.pdf).

## Social Network Analysis Summary
I made this summary as a way to study for the Social Networks Analysis exam. In the file you can see the consepts covered in class. Click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Social%20Network%20Analysis%20(Python%2CR)/Social%20Network%20Analysis%20Summary.pdf) or click the file named "Social Networks Analysis Summary.pdf".

## Work Migration
When we decided to pick this data we were looking forward to the challenges this would bring us, but we had no idea how it all would turn out both for our business case or graphs. What it turned out to be, was a data that only really made sense to get some of the centrality-measures out of. In order to get data that made sense, we cleaned our data and removed the variables that was duplicate in a sense of how we wanted to present our data.

The data is LinkedIn data based on migration from countries. We had negative and positive values that showed us the net migration rate between countries. These were positive and negative to the respective countries, so we only kept the positive ones. We also took out the values with 0 from our data because the net migration rate equalled out between the two countries.

To continue with our analyses we asked ourself, what would be interesting to investigate further?

1. What countries are less, and what countries are more connected to the rest of the world?
2. What countries does the majority leave from vs. travel to?

To make our map, we had to make it as undirected even though the data is directed. We thought of it as directed in that sense of net value of workforce moving between countries. If more people move from i.e. Sweden to Norway than the other way around, the net value would be positive for Sweden -> Norway, and the direction would also be like that.

The map only shows if you open the .ipynb file in Jupyter or Google Collaboratory, so I am attaching the screenshot photo here:

![Map](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Social%20Network%20Analysis%20(Python%2CR)/Work%20Migration%20Map.png)

Although all classes was based on learning the consepts by them selves and executing them in R, I decided to work on this project in Python. The coding is different but the consepts remain the same.

To see the presentation, click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Social%20Network%20Analysis%20(Python%2CR)/Work%20Migration%20Presentation.pdf). To see the python notebook, click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Social%20Network%20Analysis%20(Python%2CR)/Work%20Migration.ipynb).

## Analyzing Flight Data
According to a 2010 report made by the US Federal Aviation Administration, the economic price of domestic flight delays entails a yearly cost of 32.9 billion dollars to passengers, airlines and other parts of the economy. More than half of that amount comes from passengers' pockets, as they do not only waste time waiting for their planes to leave, but also miss connecting flights, spend money on food and have to sleep on hotel rooms while they're stranded.

The work done answers these questions:
1. Is there a relation between the economic prosperity of a city and the proportion of flights that arrive to it during the weekdays or weekends?
2. Is there any relation between the business nature of a city and the proportion of flights that arrive early in the morning (e.g. with people in a business travel) with respect to the number of flights arriving during the rest of the day?
3. Is this proportion between flights arriving in the morning and the afternoon much different if we compare weekdays vs weekends in those cities?
4. Are there cities that receive most flights at weekends? Is this typical of a vacation city?
5. Can we say more developed cities suffer of smaller arrival delays on average?
6. Is there a relation between the arrival time and the arrival delay? If you deem necessary, categorize the day into discrete parts for the arrival time. Is the relation the same for all categories of cities?
7. What about the departure time?

![Flight Data](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Spark/Analyzing%20Flight%20Data.png)

The work can be found through [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Spark/Analyzing%20Flight%20Data.ipynb).

## San Francisco Flight Analysis
Although I wouldn’t say that San Francisco is known for its crime, rather for its bridge and steep hills and houses. Still crime is everywhere, and it is interesting to see how this can be reduced. So how can we help the police of San Francisco, or SFPD, with its crime fighting? I have focused the analysis on location, time and severity of crime, and by doing so we can provide SFPD with facts such as in what areas there is most crime, what day crime happens the most and where.

![SF Crime](https://punkygibbon.co.uk/images/c/crime/sfstill_cd_cd_400.jpeg)

The best way to view the work is to read the report by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Spark/San%20Francisco%20Crime%20Analysis%20(2018%20until%20today)%20Report.pdf). If you wish to see the python file you can as well by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Spark/San%20Francisco%20Crime%20Analysis%20(2018%20until%20today).ipynb).

## Real-Time Streaming Sentiment from Twitter
For our group assignment in "Stream Processing & Real-Time Analytics" we had a presentation where we had to create a prototype based on using Real-Time Streaming. We decided to do real-time streaming from twitter using the sentiment of the topic chosen.

This is the file structure:
* The file ["twit.ipynb"](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Streaming%20(Spark%20Stream%2CKafka)/twit.ipynb) was used to connect to twitter.
* The file ["ReadTweets.ipynb"](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/Streaming%20(Spark%20Stream%2CKafka)) was used to read the tweets.
* The file ["Mention_Analysis.ipynb"](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Streaming%20(Spark%20Stream%2CKafka)/Mention_Analysis.ipynb) was used to create the dashboard.

It is not possible to see the dashboard since there are no real-time streaming running, but below is a screenshot of one of our analysis:

![Dashboard](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Streaming%20(Spark%20Stream%2CKafka)/Dashboard.png)

The presentation can be viewed by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Streaming%20(Spark%20Stream%2CKafka)/Streaming%20Sentiment%20from%20Twitter%20Presentation.pdf).

## Twitter Streaming with Spark Stream and Kafka
Getting data from twitter in almost near real-time has many different use cases. For instance, a corporation may have the option to automatically track what people are tweeting about their brand in near real-time. Also, it may be possible to interact automatically with customers through twitter by developing a bot.

Although this assignment is somewhat similar to the assignment above, it made us able to demonstrated our knowledge with Twitter. The report is quite self explanatory, so have a look at it by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/Streaming%20(Spark%20Stream%2CKafka)/Twitter%20Streaming%20with%20Spark%20Stream%20and%20Kafka%20Report.pdf).

## YOLOv3 Object Detector For Detecting Guns - A Full Tutorial
As the fourth task in our group assignment 1 for "Machine Learning 3" class we had an optional exercise to create a YOLOv3 notebook to locate & classify different objects in a single image. For this assignment I decided to create a tutorial for others to learn the process that I have gone through learning how YOLOv3 works.

You can see the first parts of this assignment about CNN with Tensorflow and Keras by clicking [this link](https://github.com/Jonashellevang/IE_MBD_2020/tree/master/CNN%20(Tensorflow%2CKeras)).

![Gun Detection](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/YOLOv3%20Tutorial/gun%20detection.png)

#### What Is YOLOv3?
You Only Look Once (YOLO) is a neural network made for detecting objects and their location in the image created by Joseph Redmon. Yolov3 just means that it is the third verion of YOLO, and it is exciting news that YOLOv4 has already been launched in April 2020.

Object detection is a task in computer vision to detect objects, their location, their magnitude, and what they are. In other words, it is algorithms you use to classify images, is it a cat or a dog? YOLOv3 is in the category of Region Proposal Classification Network (RCNN), but compared to its’ siblings, YOLO looks more like a Fully Convolutional Neural Network (FCNN). It is an algorithm using DarkNet and it is written in C.

Why do we use YOLO and not either one of the other deep learning algorithms for classifying images?
* YOLOv3 is much faster, where it reaches 45 frames per second, although it is no longer the most accurate where RetinaNet and SSD outperforms its' accuracy.
* Detects multiple objects within the same image.
* Widely used for videos due to its speed.

Each image is associated with a label file saved as .txt file, and to be able to get this we have three options; we can build them from scratch with our own pictures and labels using a tool, we can use already labeled images or we can use pre-trained models. YOLOv3 is basically just another state-of-the-art (SOA), real-time object detection system for images and videos.

To access the full tutorial you can click [this link](https://github.com/Jonashellevang/IE_MBD_2020/blob/master/YOLOv3%20Tutorial/Weapon%20Detection%20with%20YOLOv3.ipynb).
