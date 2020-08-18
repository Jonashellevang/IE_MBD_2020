########## [1] - Load Libraries and Data ##########

# change filepath here
filepath_solar_data <- '/Users/Jonas/Documents/GitHub/IE_MBD_2020/R - Solar Energy Prediction/solar_dataset.RData'
filepath_additional_variables <- '/Users/Jonas/Documents/GitHub/IE_MBD_2020/R - Solar Energy Prediction/additional_variables.RData'
filepath_output <- '/Users/Jonas/Documents/GitHub/IE_MBD_2020/R - Solar Energy Prediction/Neural Network Models/wide-and-deep prediction.csv'

# load libraries
library(data.table)
library(imputeTS)
library(foreach)
library(keras)

# IMPORTANT: if you run Keras for the first time, execute the following line
# install_keras()

# load data
solar_data <- readRDS(filepath_solar_data)
additional_variables <- readRDS(filepath_additional_variables)

########## [2] - Data Preparation ##########

# impute missing values of additional_information
additional_variables <- data.frame(
  Date = additional_variables$Date,
  sapply(additional_variables[,2:101], na_interpolation, option = 'linear'))

# dimensionality reduction of additional_information
pca <- prcomp(additional_variables[,2:101], center = TRUE, scale = TRUE)
additional_variables_pc <- data.table(Date = additional_variables$Date, pca$x)

# merge additional_variables_pc and solar_data
# we keep the first 8 PCs from the principal components of additional_variables
# we keep the first 20 PCs from the solar_data table
data <- merge(solar_data[,1:129], 
              additional_variables_pc[,1:9], 
              by = 'Date',
              suffixes = c('','_add_var'))

# scale features to mean = 0 and sd = 1
data[,100:137] <- data.table(sapply(data[,100:137], scale, center = TRUE, scale = TRUE))

########## [3] - Train/Prediction Split ##########

# create train data
X_train <- as.matrix(data[Date < 20071231, c(100:137)])
y_train <- as.matrix(data[Date < 20071231, c(2:99)])

prediction_features <- as.matrix(data[Date >= 20080101, c(100:137)])
prediction <- data[Date >= 20080101, 1]

########## [4] - Train Neural Network & Make Prediction ##########

# we use a simple for loop since neural networks automatically train in parallel
for(i in 1:98){
  # print interation we are on
  print(sprintf('Iteration %d', i))
  print(prediction)
  
  # create input layer
  inputs <- layer_input(shape = c(38))
  
  # create deep output
  deep_output <- inputs %>%
    layer_dense(units = 128, activation = 'relu') %>%
    layer_dropout(0.1) %>%
    layer_dense(units = 128, activation = 'relu') %>%
    layer_dropout(0.1) %>%
    layer_dense(units = 128, activation = 'relu') %>%
    layer_dropout(0.1) %>%
    layer_dense(units = 128, activation = 'relu') %>%
    layer_dropout(0.1) %>%
    layer_dense(units = 128, activation = 'relu') %>%
    layer_dropout(0.1) %>%
    layer_dense(units = 1, activation = 'relu')
  
  # create wide output
  wide_output <- inputs %>%
    layer_dense(units = 1, activation = 'relu')
  
  # create total output which adds the deep output and wide output
  total_output <- layer_add(list(deep_output, wide_output))
  
  # create model
  model <- keras_model(inputs = inputs, outputs = total_output)
  
  # compile model
  model %>% compile(
    optimizer = 'adam',
    loss = 'mean_absolute_error',
    metrics = c('mean_absolute_percentage_error')
  )
  
  # train model
  model %>% fit(
    x = list(X_train),
    y = list(y_train[,i]),
    epochs = 100,
    batch_size = 64,
    verbose = 0
  )
  
  # make predictions
  station_prediction <- model %>% predict(
    prediction_features,
    batch_size = 64
  )
  
  # add predictions to our prediction matrix
  prediction <- cbind(prediction, station_prediction)
}

# get dimensions of predictions to verify correctness
dim(prediction)

# change date column to integer
prediction$Date <- as.integer(prediction$Date)

# save predictions as csv-file for submitting it to Kaggle
write.csv(prediction,
          file = filepath_output,
          row.names = FALSE)



