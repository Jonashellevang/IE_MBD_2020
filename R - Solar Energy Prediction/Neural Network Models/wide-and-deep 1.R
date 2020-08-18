########## [1] - Load Libraries and Data ##########

# change filepath here
filepath_solar_data <- '/Users/Jonas/Documents/GitHub/IE_MBD_2020/R - Solar Energy Prediction/solar_dataset.RData'
filepath_additional_variables <- '/Users/Jonas/Documents/GitHub/IE_MBD_2020/R - Solar Energy Prediction/additional_variables.RData'

# load libraries
library(data.table)
library(imputeTS)
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
# we keep the first 30 PCs from the solar_data table
data <- merge(solar_data[,1:129], 
              additional_variables_pc[,1:9], 
              by = 'Date',
              suffixes = c('','_add_var'))

# remove data without target value
data <- data[Date <= 20071231]

# scale features to mean = 0 and sd = 1
data[,100:127] <- data.table(sapply(data[,100:127], scale, center = TRUE, scale = TRUE))

########## [3] - Train/Validation/Test Split ##########

# create train-validation-test split
X_train <- as.array(as.matrix(data[Date <= 20031231, c(100:137)]))
y_train <- as.array(as.matrix(data[Date <= 20031231, c(2:99)]))

X_validation <- as.array(as.matrix(data[Date > 20031241 & Date <= 20051231, c(100:137)]))
y_validation <- as.array(as.matrix(data[Date > 20031241 & Date <= 20051231, c(2:99)]))

X_test <- as.array(as.matrix(data[Date > 20151231, c(100:137)]))
y_test <- as.array(as.matrix(data[Date > 20151231, c(2:99)]))

########## [4] - Build Neural Network Architecture ##########

# create layers
inputs <- layer_input(shape = c(38))

# create deep output
deep_output <- inputs %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dense(units = 1, activation = 'relu')

# create wide output
wide_output <- inputs %>%
  layer_dense(units = 1, activation = 'relu')

# create total output
total_output <- layer_add(list(deep_output, wide_output))

# create model
model <- keras_model(inputs = inputs, outputs = total_output)

# compile model
model %>% compile(
  optimizer = 'adam',
  loss = 'mean_absolute_error',
  metrics = c('mean_absolute_percentage_error')
)

########## [5] - Train Model ##########

# train model
model %>% fit(
  x = list(X_train),
  y = list(y_train[,1]),
  epochs = 100,
  batch_size = 64,
  validation_data = list(X_validation, y_validation[,1])
)



