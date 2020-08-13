library(data.table);
library(doParallel);
library(foreach);
library(e1071);
library(dplyr);

#### PLEASE UPDATE FOLDER PATH ####
folder_path <- "c:/Users/Guille/Desktop/R/Group assignment/";


#### CALL THE FUNCTIONS#### 

solardata <- as.data.frame(readRDS(file.path(folder_path, "solar_dataset.RData")));
stationinfo <- as.data.frame(fread(file.path(folder_path,"station_info.csv")));
Aditional_variables <- as.data.frame(readRDS(file.path(folder_path, "additional_variables.RData")));

#### SIMULATION BEST SVM

# Create the tables to output the data
result <- data.frame(date = solardata[5114:nrow(solardata),1]);
comp <- data.frame();

# For loop that iterates throught all the station columns
for(x in 2:2){
  
  # Track progress
  print(x)
  
  # Create new table with only 1 station
  Data <- cbind(production = solardata[,x],solardata[,100:ncol(solardata)]);

  # split data into predicting data and final data for Kaggle
  station <- as.data.table(Data[1:5113,]);
  predict <- as.data.table(Data[5114:nrow(Data),]);

  # row indices for station data (70%)
  
  train_index <- sample(1:nrow(station), 0.70*nrow(station));
  val_index <- sample(setdiff(1:nrow(station), train_index), 0.15*nrow(station))
  test_index <- setdiff(1:nrow(station), c(train_index, val_index));
  
  # training data tables
  
  train <- station[train_index]; 
  val <- station[val_index]
  test <- station[test_index];
  
  # Create hyperparameters Values
  
  c_values <- 10^seq(from = -2, to = 2, by = 1);
  eps_values <- 10^seq(from = -2, to = 0, by = 1);
  gamma_values <- 10^seq(from = -3, to = 2, by = 1);
  
  # Create table to store hyperparameters results
 
  grid_results <- data.table()
  
  # Track progress
  
  print("start Hyperparameters")
  
  # For each that iterates through all the combinations
  
  foreach (c = c_values) %:%
    foreach (eps = eps_values) %:%
    foreach (gamma = gamma_values) %dopar%{
    
      # train SVM model with a particular set of hyperparamets
      # Filter only first 20 Pc variables
      model <- svm(production ~ ., data = train[,1:21],
                   cost = c, epsilon = eps, gamma = gamma);
      
      # Get model predictions
      predictions_train <- predict(model, newdata = train[,1:21]);
      predictions_val <- predict(model, newdata = val[,1:21]);
      
      # Get errors
      errors_train <- predictions_train - train$production;
      errors_val <- predictions_val - val$production;
      
      # Compute Metrics
      mse_train <- round(mean(errors_train^2), 2);
      mae_train <- round(mean(abs(errors_train)), 2);
      
      mse_val <- round(mean(errors_val^2), 2);
      mae_val <- round(mean(abs(errors_val)), 2);
      
      # Build comparison table
      grid_results <- rbind(grid_results,
                            data.table(c = c, eps = eps, gamma = gamma, 
                                       mse_train = mse_train, mae_train = mae_train,
                                       mse_val = mse_val, mae_val = mae_val));
    }
  
  # Track results
  
   print("finish Hyperparameters")
   
  # Get best Hypeparameters for the station
  
  grid_results <- grid_results[order(mae_val, mse_val)];
  best <- grid_results[1];
  
  # Final trained model using the best Hyper parameters
  
  model <- svm(production ~ ., data = rbind(train[,1:21],val[,1:21]), 
               cost = best$c, epsilon = best$eps, gamma = best$gamma);
  
  # Track results
  
  print("Model Predicted")
  
  # Get model predictions
  predictions_train <- predict(model, newdata = train); 
  predictions_test <- predict(model, newdata = test);
  
  # Get errors
  errors_train <- predictions_train - train$production;
  errors_test <- predictions_test - test$production;
  
  # Compute Metrics
  mse_train <- round(mean(errors_train^2), 2);
  mae_train <- round(mean(abs(errors_train)), 2);
  
  mse_test <- round(mean(errors_test^2), 2);
  mae_test <- round(mean(abs(errors_test)), 2);
  
  # Store the modelation results for each station
  
  comp <- rbind(comp,
                data.table(station = stationinfo[x-1,1], 
                           mse_train = mse_train, mae_train = mae_train,
                           mse_test = mse_test, mae_test = mae_test,
                           cost = best$c, epsilon = best$eps, gamma = best$gamma));
  
  # Predict new station data for kaggle
  
  predictions_final <- predict(model, newdata = predict[,-1]);
  result <- cbind(result, predictions_final)
}

# Check Results

comp;
result;

# update colnames predicted data

namesstation <- c("DATE",colnames(solardata[2:99]))

colnames(result) <- namesstation;

# Create Csv file

write.csv(result, file.path(folder_path, "prediction.csv"), row.names=F);
