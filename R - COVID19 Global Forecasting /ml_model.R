rm(list = ls())

library(dplyr)
library(shiny)
library(ggplot2)
library(scales)
library(tidyr)
library(forecast)
library(metric)
library(randomForest)
library(reshape2)
library(xgboost)
#read_files
train<-read.csv("train.csv")
test<-read.csv("test.csv")
submission_file<-read.csv("submission.csv")
female_leaders<-read.csv("female_leaders.csv", sep=";") #from wikipedia
ts_predictions<-read.csv("ts_best_submission.csv") #our ts prediction to input into our model
############# 1. Data Preparation ##########


#date to class date
train$Date<-as.Date(as.POSIXct(train$Date, format='%Y-%m-%d'))
test$Date<-as.Date(as.POSIXct(test$Date, format='%Y-%m-%d'))

actual<-train %>%
  filter(Date >= "2020-04-01" & Date<= "2020-05-13") %>%
  ungroup() 

#paste country and province together
train$country_province <- paste(train$Country_Region,train$Province_State)
test$country_province <- paste(test$Country_Region,test$Province_State)

#min/max dates
min(train$Date)
max(train$Date)

min(test$Date)
max(test$Date)

############# 2. Data Enhacement ##########


##### 2.1 Adding female leaders ####

#adding female_leaders
train_grouped <-train %>%
  group_by(country_province) %>%
  summarize(count=.N) %>%
  arrange(country_province)

test_grouped <-test %>%
  group_by(country_province) %>%
  summarize(count=.N) %>%
  arrange(country_province)

female_leaders <- female_leaders %>% arrange(Country_Region,Province_State)

train_grouped$female_leaders <- female_leaders$Female_Leader
test_grouped$female_leaders <- female_leaders$Female_Leader

train<- merge(train, train_grouped,all=TRUE)
test<- merge(test, test_grouped,all=TRUE)

##### 2.2 Adding Predicted Confirmed Cases to test ####

test$Fatalities = ts_predictions$Fatalities
test$ConfirmedCases = ts_predictions$ConfirmedCases

#### 2.3 Mutate Data and add the daily change of Confirmed Cases and Fatalities ####

#mutate data - train
train_m <-train %>%
  group_by(country_province) %>% 
  mutate(change_cc = lead(ConfirmedCases, 1) - ConfirmedCases)%>%
  mutate(change_cf = lead(Fatalities, 1) - Fatalities)%>%
  mutate(weekend = ifelse(wday(Date) %in% c(1, 7), 1, 0)) %>%
  filter(Date < "2020-04-01") %>% #TO AVOID DATA LEAKAGE
  ungroup() 

#mutate data - test
test_m <-test %>%
  group_by(country_province) %>% 
  mutate(change_cc = lead(ConfirmedCases, 1) - ConfirmedCases)%>%
  mutate(change_cf = lead(Fatalities, 1) - Fatalities)%>%
  mutate(weekend = ifelse(wday(Date) %in% c(1, 7), 1, 0)) %>%
  #filter(Date < "2020-04-01") %>%
  ungroup() 

#fill zeros
train_m[is.na(train_m)] <- 0
test_m[is.na(test_m)] <- 0

#### 2.4 Add Month, day , weekday ####

### add month, date and weekday
train_m$month = month(train_m$Date)
train_m$day = day(train_m$Date)
train_m$dayofweek=weekdays(train_m$Date)

test_m$month = month(test_m$Date)
test_m$day = day(test_m$Date)
test_m$dayofweek = weekdays(test_m$Date)

#### 2.5 Encode Variables ####

###encode country_provice
factors <- factor(train_m$country_province)
factors<-as.numeric(factors)
train_m$region_encoded = factors

factors <- factor(test_m$country_province)
factors<-as.numeric(factors)
test_m$region_encoded= factors

###encode weekday
factors <- factor(train_m$dayofweek)
factors<-as.numeric(factors)
train_m$dow_encoded = factors

factors <- factor(test_m$dayofweek)
factors<-as.numeric(factors)
test_m$dow_encoded = factors

#### get cases and fatalities

cases = train_m$ConfirmedCases
fatalities = train_m$Fatalities

##### 3.1 XG Boost model - Confirmed Cases ####

dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                     "ConfirmedCases","change_cc","Fatalities","change_cf","female_leaders"))), 
                                 label = as.numeric(cases))

dat_test_xgboost <- xgb.DMatrix(data = as.matrix(test_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                    "ConfirmedCases","change_cc","Fatalities","change_cf","female_leaders"))))

set.seed(100)
model <- xgboost(dat_train_xgboost, nrounds=25 ,
                 max_depth_values=1,
                 min_child_weight=1, 
                 colsample_bytree=1,
                 subsample=1, 
                 gamma=10^-3)
pred_train <- predict(model, newdata = dat_test_xgboost)
pred_df <- as.data.frame(pred_train)

rmsle(pred_df$pred_train, actual$ConfirmedCases)

pred_df[pred_df<0] <- 0

rmsle(pred_df$pred_train, actual$ConfirmedCases)

submission_file$ConfirmedCases <- pred_df$pred_train

##### 3.2 XG Boost model - Fatalities ####

dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                     "ConfirmedCases","change_cc","Fatalities","change_cf","female_leaders"))), 
                                 label = as.numeric(fatalities))

dat_test_xgboost <- xgb.DMatrix(data = as.matrix(test_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                   "ConfirmedCases","change_cc","Fatalities","change_cf","female_leaders"))))

set.seed(100)
model <- xgboost(dat_train_xgboost, nrounds=25 ,
                 max_depth_values=1,
                 min_child_weight=5, 
                 colsample_bytree=1,
                 subsample=0.5, 
                 gamma=10^3,
                 num_parallel_tree=10,
                 eta_values=10^0)

pred_train <- predict(model, newdata = dat_test_xgboost)
pred_df <- as.data.frame(pred_train)

rmsle(pred_df$pred_train, actual$Fatalities)

pred_df[pred_df<0] <- 0

#rmsle(pred_df$pred_train, actual$ConfirmedCases)

submission_file$Fatalities <- pred_df$pred_train


##### 3.3 Write Submission file ####

write.csv(submission_file,"/Users/lina/Documents/Masters/Term_3/advanced_r/group_assignment/covid19-global-forecasting-week-4/submission_xgboost1.csv",row.names=F)

##### 4.0More Feature Creation #####


#### 4.1 Days since case x -train ####
train_m$days_since_case_1 <- 0
train_m$days_since_case_10 <- 0
train_m$days_since_case_50 <- 0
train_m$days_since_case_75 <- 0

train_m$days_since_death_1 <- 0
train_m$days_since_death_10 <- 0
train_m$days_since_death_50 <- 0
train_m$days_since_death_75 <- 0


for (i in 1:nrow(train_m)){
  g <- train_m$country_province[i]
  
  case1 <- min(train_m$Date[train_m$ConfirmedCases>=1 & train_m$country_province==g])
  case10 <- min(train_m$Date[train_m$ConfirmedCases>=10 & train_m$country_province==g])
  case50 <- min(train_m$Date[train_m$ConfirmedCases>=50 & train_m$country_province==g])
  case75 <- min(train_m$Date[train_m$ConfirmedCases>=75 & train_m$country_province==g])
  
   
  death1 <- min(train_m$Date[train_m$Fatalities>=1 & train_m$country_province==g])
  death10 <- min(train_m$Date[train_m$Fatalities>=10 & train_m$country_province==g])
  death50 <- min(train_m$Date[train_m$Fatalities>=50 & train_m$country_province==g])
  death75 <- min(train_m$Date[train_m$Fatalities>=75 & train_m$country_province==g])
  
  
  train_m$days_since_case_1[i] <- max(0, (train_m$Date[i]-case1))
  train_m$days_since_case_10[i] <- max(0, (train_m$Date[i]-case10))
  train_m$days_since_case_50[i] <- max(0, (train_m$Date[i]-case50))
  train_m$days_since_case_75[i] <- max(0, (train_m$Date[i]-case75))
  
  train_m$days_since_death_1[i] <- max(0, (train_m$Date[i]-death1))
  train_m$days_since_death_10[i] <- max(0, (train_m$Date[i]-death10))
  train_m$days_since_death_50[i] <- max(0, (train_m$Date[i]-death50))
  train_m$days_since_death_75[i] <- max(0, (train_m$Date[i]-death75))
  
}

#### 4.2 Days since case x - Test ####


test_m$days_since_case_1 <- 0
test_m$days_since_case_10 <- 0
test_m$days_since_case_50 <- 0
test_m$days_since_case_75 <- 0

test_m$days_since_death_1 <- 0
test_m$days_since_death_10 <- 0
test_m$days_since_death_50 <- 0
test_m$days_since_death_75<- 0


for (i in 1:nrow(test_m)){
  g <- test_m$country_province[i]
  
  case1 <- min(test_m$Date[test_m$ConfirmedCases>=1 & test_m$country_province==g])
  case10 <- min(test_m$Date[test_m$ConfirmedCases>=10 & test_m$country_province==g])
  case50 <- min(test_m$Date[test_m$ConfirmedCases>=50 & test_m$country_province==g])
  case75 <- min(test_m$Date[test_m$ConfirmedCases>=75 & test_m$country_province==g])
  death1 <- min(test_m$Date[test_m$Fatalities>=1 & test_m$country_province==g])
  death10 <- min(test_m$Date[test_m$Fatalities>=10 & test_m$country_province==g])
  death50 <- min(test_m$Date[test_m$Fatalities>=50 & test_m$country_province==g])
  death75 <- min(test_m$Date[test_m$Fatalities>=75 & test_m$country_province==g])
  
  test_m$days_since_case_1[i] <- max(0, (test_m$Date[i]-case1))
  test_m$days_since_case_10[i] <- max(0, (test_m$Date[i]-case10))
  test_m$days_since_case_50[i] <- max(0, (test_m$Date[i]-case50))
  test_m$days_since_case_75[i] <- max(0, (test_m$Date[i]-case75))
  
  test_m$days_since_death_1[i] <- max(0, (test_m$Date[i]-death1))
  test_m$days_since_death_10[i] <- max(0, (test_m$Date[i]-death10))
  test_m$days_since_death_50[i] <- max(0, (test_m$Date[i]-death50))
  test_m$days_since_death_75[i] <- max(0, (test_m$Date[i]-death75))
  
}

#### 4.3 Exponentials ####


train_m$days_since_case_1_2 <- train_m$days_since_case_1^2
train_m$days_since_case_10_2 <- train_m$days_since_case_10^2
train_m$days_since_case_50_2 <- train_m$days_since_case_50^2
train_m$days_since_case_75_2 <- train_m$days_since_case_75^2

train_m$days_since_death_1_2 <- train_m$days_since_death_1^2
train_m$days_since_death_10_2 <- train_m$days_since_death_10^2
train_m$days_since_death_50_2 <- train_m$days_since_death_50^2
train_m$days_since_death_75_2 <- train_m$days_since_death_75^2

test_m$days_since_case_1_2 <- test_m$days_since_case_1^2
test_m$days_since_case_10_2 <- test_m$days_since_case_10^2
test_m$days_since_case_50_2 <- test_m$days_since_case_50^2
test_m$days_since_case_75_2 <- test_m$days_since_case_75^2

test_m$days_since_death_1_2 <- test_m$days_since_death_1^2
test_m$days_since_death_10_2 <- test_m$days_since_death_10^2
test_m$days_since_death_50_2 <- test_m$days_since_death_50^2
test_m$days_since_death_75_2 <- test_m$days_since_death_75^2



###### 5.1 XG Boost - Round 2 - Cases #####


dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                     "ConfirmedCases","change_cc","female_leaders",
                                                                      "days_since_case_1","days_since_case_10","days_since_case_50","days_since_case_75",
                                                                      "days_since_death_1","days_since_death_10","days_since_death_50","days_since_death_75",
                                                                     "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                     "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))), 
                                 label = as.numeric(cases))

dat_test_xgboost <- xgb.DMatrix(data = as.matrix(test_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                   "ConfirmedCases","change_cc","female_leaders",
                                                                    "days_since_case_1","days_since_case_10","days_since_case_50","days_since_case_75",
                                                                    "days_since_death_1","days_since_death_10","days_since_death_50","days_since_death_75",
                                                                   "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                   "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))))

set.seed(100)
model <- xgboost(dat_train_xgboost, nrounds=25 ,
                 max_depth_values=1,
                 min_child_weight=1, 
                 colsample_bytree=1,
                 subsample=1, 
                 gamma=10^-3)
pred_train <- predict(model, newdata = dat_test_xgboost)
pred_df <- as.data.frame(pred_train)

rmsle(pred_df$pred_train, actual$ConfirmedCases)

pred_df[pred_df<0] <- 0

submission_file$ConfirmedCases <- pred_df$pred_train

###### 5.1 XG Boost - Round 2 - Fatalities #####

#for fatalities we found that the predictions for confirmed cases worked better than the predictions for fatalities
dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                     #"Fatalities","change_cf",
                                                                      "ConfirmedCases","change_cc","female_leaders",
                                                                     # "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                     #"days_since_death_1","days_since_death_10","days_since_death_50",
                                                                     "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                     "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))), 
                                 label = as.numeric(fatalities))

dat_test_xgboost <- xgb.DMatrix(data = as.matrix(test_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                    #"Fatalities","change_cf",
                                                                     "ConfirmedCases","change_cc","female_leaders",
                                                                    #"days_since_case_1","days_since_case_10","days_since_case_50",
                                                                    #"days_since_death_1","days_since_death_10","days_since_death_50",
                                                                   "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                   "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))))

set.seed(100)
model <- xgboost(dat_train_xgboost, nrounds=25 ,
                 max_depth_values=1,
                 min_child_weight=1, 
                 colsample_bytree=1,
                 subsample=1, 
                 gamma=10^-3)
pred_train <- predict(model, newdata = dat_test_xgboost)
pred_df <- as.data.frame(pred_train)

rmsle(pred_df$pred_train, actual$Fatalities)

pred_df[pred_df<0] <- 0

submission_file$Fatalities <- pred_df$pred_train

write.csv(submission_file,"/Users/lina/Documents/Masters/Term_3/advanced_r/group_assignment/covid19-global-forecasting-week-4/submission_xgboost3.csv",row.names=F)


########## 6.1 Grid Search - Cases ##########

library(data.table);
library(foreach);
library(doParallel);

params <- list(eta_values=c(10^-2, 10^0), 
               gamma_values=c(10^-3, 10^3),
               max_depth_values=c(1,10),
               min_child_weight_values=c(1),
               subsample_values=c(0.5, 1),
               colsample_bytree_values=c(0.1, 1),
               num_parallel_tree_values=c(10),
               nrounds_values=c(10,25), 
               lambda_values = c(0), 
               alpha_values = c(0));
params$nthread <- detectCores();

### GRID
grid_results_xgb <- data.table();
for (i in 1:length(params$eta_values)){
  for (j in 1:length(params$gamma_values)){
    for (k in 1:length(params$max_depth_values)){
      for (l in 1:length(params$min_child_weight_values)){
        for (m in 1:length(params$subsample_values)){
          for (n in 1:length(params$colsample_bytree_values)){
            for (o in 1:length(params$num_parallel_tree_values)){
              for (p in 1:length(params$nrounds_values)){
                for (q in 1:length(params$lambda_values)){
                  for (r in 1:length(params$alpha_values)){
                    eta <- params$eta_values[i]
                    gamma<-params$gamma_values[j]
                    max_depth<-params$max_depth_values[k]
                    min_child_weight<-params$min_child_weight_values[l]
                    subsample<-params$subsample_values[m]
                    colsample_bytree <- params$colsample_bytree_values[n];
                    num_parallel_tree <- params$num_parallel_tree_values[o];
                    nrounds <- params$nrounds_values[p];
                    lambda <- params$lambda_values[q];
                    alpha <- params$alpha_values[r];
                    
                    # Log
                    print(sprintf("Start of params=%s",c(eta,gamma,max_depth,min_child_weight,subsample,colsample_bytree,num_parallel_tree,nrounds, lambda, alpha)));
                    
                    # Train   
                    dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                                         "ConfirmedCases","change_cc","female_leaders",
                                                                                         #   "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                                         #  "days_since_death_1","days_since_death_10","days_since_death_50",
                                                                                         "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                                         "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))), 
                                                     label = as.numeric(cases));
                    set.seed(100);  
                    model <- xgboost(data = dat_train_xgboost, params=list(eta = eta, gamma = gamma,max_depth=max_depth,
                                                                           min_child_weight=min_child_weight,subsample=subsample,colsample_bytree=colsample_bytree,
                                                                           num_parallel_tree=num_parallel_tree, lambda = lambda, alpha = alpha),
                                     save_period=NULL,
                                     nthread = params$nthread, nrounds = nrounds, verbose = 0)
                    
                    # Predict
                    pred_train <- predict(model, newdata = as.matrix(test_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                                       "ConfirmedCases","change_cc","female_leaders",
                                                                                       #"days_since_case_1","days_since_case_10","days_since_case_50","days_since_case_75",
                                                                                       #"days_since_death_1","days_since_death_10","days_since_death_50","days_since_death_75",
                                                                                       "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                                       "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))));
                    pred_train<-as.data.frame(pred_train)
                    # Evaluation
                    pred_train[pred_train<0] <- 0
                    rmsle_train <- rmsle(pred_train$pred_train, actual$ConfirmedCases)

                    # Log
                    print(paste0(paste(sprintf("End of params= %s. ",
                                               c(eta,gamma,max_depth,min_child_weight,subsample,colsample_bytree,num_parallel_tree,nrounds, lambda, alpha)), sep = "", collapse = ""),
                                 sprintf("AUC train = %s", rmsle_train)));
                    
                    
                    # Results
                    ret <- data.table(eta = eta, gamma = gamma,max_depth=max_depth,
                                      min_child_weight=min_child_weight,subsample=subsample,colsample_bytree=colsample_bytree,
                                      num_parallel_tree=num_parallel_tree, nrounds = nrounds, 
                                      lambda = lambda, alpha = alpha, nthread = params$nthread,
                                      rmsle_train = rmsle_train);
                    grid_results_xgb <- rbind(grid_results_xgb, ret);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


grid_results_xgb <- grid_results_xgb[order(rmsle_train)];
best <- grid_results_xgb[1]

#### 6.1 Grid Search - Cases - Prediction #######

dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                     "ConfirmedCases","change_cc","female_leaders",
                                                                     #   "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                     #  "days_since_death_1","days_since_death_10","days_since_death_50",
                                                                     "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                     "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))), 
                                 label = as.numeric(cases));

set.seed(100);  
model <- xgboost(data = dat_train_xgboost, params=list(eta = best$eta, gamma = best$gamma,max_depth=best$max_depth,
                                                       min_child_weight=best$min_child_weight,subsample=best$subsample,colsample_bytree=best$colsample_bytree,
                                                       num_parallel_tree=best$num_parallel_tree, lambda = best$lambda, alpha = best$alpha),
                 save_period=NULL,
                 nthread = params$nthread, nrounds = best$nrounds, verbose = 0)


# Predict
pred_train <- predict(model, newdata = as.matrix(test_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                  "ConfirmedCases","change_cc","female_leaders",
                                                                  #"days_since_case_1","days_since_case_10","days_since_case_50","days_since_case_75",
                                                                  #"days_since_death_1","days_since_death_10","days_since_death_50","days_since_death_75",
                                                                  "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                  "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))))
pred_train<-as.data.frame(pred_train)
rmsle(pred_train$pred_train, actual$ConfirmedCases)

submission_file$ConfirmedCases <- pred_train$pred_train

########## 6.3 Grid Search - Fatalities ##########

params <- list(eta_values=c(10^-2, 10^0), 
               gamma_values=c(10^-3, 10^3),
               max_depth_values=c(1,10),
               min_child_weight_values=c(1),
               subsample_values=c(0.5, 1),
               colsample_bytree_values=c(0.1, 1),
               num_parallel_tree_values=c(10),
               nrounds_values=c(10,25), 
               lambda_values = c(0), 
               alpha_values = c(0));
params$nthread <- detectCores();

### GRID
grid_results_xgb <- data.table();
for (i in 1:length(params$eta_values)){
  for (j in 1:length(params$gamma_values)){
    for (k in 1:length(params$max_depth_values)){
      for (l in 1:length(params$min_child_weight_values)){
        for (m in 1:length(params$subsample_values)){
          for (n in 1:length(params$colsample_bytree_values)){
            for (o in 1:length(params$num_parallel_tree_values)){
              for (p in 1:length(params$nrounds_values)){
                for (q in 1:length(params$lambda_values)){
                  for (r in 1:length(params$alpha_values)){
                    eta <- params$eta_values[i]
                    gamma<-params$gamma_values[j]
                    max_depth<-params$max_depth_values[k]
                    min_child_weight<-params$min_child_weight_values[l]
                    subsample<-params$subsample_values[m]
                    colsample_bytree <- params$colsample_bytree_values[n];
                    num_parallel_tree <- params$num_parallel_tree_values[o];
                    nrounds <- params$nrounds_values[p];
                    lambda <- params$lambda_values[q];
                    alpha <- params$alpha_values[r];
                    
                    # Log
                    print(sprintf("Start of params=%s",c(eta,gamma,max_depth,min_child_weight,subsample,colsample_bytree,num_parallel_tree,nrounds, lambda, alpha)));
                    
                    # Train   
                    dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                                         #"Fatalities","change_cf",
                                                                                         "ConfirmedCases","change_cc","female_leaders",
                                                                                         # "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                                         #"days_since_death_1","days_since_death_10","days_since_death_50",
                                                                                         "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                                         "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))), 
                                                     label = as.numeric(fatalities));
                    set.seed(100);  
                    model <- xgboost(data = dat_train_xgboost, params=list(eta = eta, gamma = gamma,max_depth=max_depth,
                                                                           min_child_weight=min_child_weight,subsample=subsample,colsample_bytree=colsample_bytree,
                                                                           num_parallel_tree=num_parallel_tree, lambda = lambda, alpha = alpha),
                                     save_period=NULL,
                                     nthread = params$nthread, nrounds = nrounds, verbose = 0)
                    
                    # Predict
                    pred_train <- predict(model, newdata = as.matrix(test_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                                       #"Fatalities","change_cf",
                                                                                       "ConfirmedCases","change_cc","female_leaders",
                                                                                       # "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                                       #"days_since_death_1","days_since_death_10","days_since_death_50",
                                                                                       "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                                       "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))));
                    pred_train<-as.data.frame(pred_train)
                    # Evaluation
                    pred_train[pred_train<0] <- 0
                    rmsle_train <- rmsle(pred_train$pred_train, actual$Fatalities)

                    # Log
                    print(paste0(paste(sprintf("End of params= %s. ",
                                               c(eta,gamma,max_depth,min_child_weight,subsample,colsample_bytree,num_parallel_tree,nrounds, lambda, alpha)), sep = "", collapse = ""),
                                 sprintf("AUC train = %s", rmsle_train)));
                    
                    
                    # Results
                    ret <- data.table(eta = eta, gamma = gamma,max_depth=max_depth,
                                      min_child_weight=min_child_weight,subsample=subsample,colsample_bytree=colsample_bytree,
                                      num_parallel_tree=num_parallel_tree, nrounds = nrounds, 
                                      lambda = lambda, alpha = alpha, nthread = params$nthread,
                                      rmsle_train = rmsle_train);
                    grid_results_xgb <- rbind(grid_results_xgb, ret);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


grid_results_xgb <- grid_results_xgb[order(rmsle_train)];
best <- grid_results_xgb[1]

#### 6.4 Grid Search - Fatalities - Prediction #######

dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                     #"Fatalities","change_cf",
                                                                     "ConfirmedCases","change_cc","female_leaders",
                                                                     # "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                     #"days_since_death_1","days_since_death_10","days_since_death_50",
                                                                     "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                     "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))), 
                                 label = as.numeric(fatalities));

set.seed(100);  
model <- xgboost(data = dat_train_xgboost, params=list(eta = best$eta, gamma = best$gamma,max_depth=best$max_depth,
                                                       min_child_weight=best$min_child_weight,subsample=best$subsample,colsample_bytree=best$colsample_bytree,
                                                       num_parallel_tree=best$num_parallel_tree, lambda = best$lambda, alpha = best$alpha),
                 save_period=NULL,
                 nthread = params$nthread, nrounds = best$nrounds, verbose = 0)


# Predict
pred_train <- predict(model, newdata = as.matrix(test_m%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                   #"Fatalities","change_cf",
                                                                   "ConfirmedCases","change_cc","female_leaders",
                                                                   # "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                   #"days_since_death_1","days_since_death_10","days_since_death_50",
                                                                   "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                   "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2"))))
pred_train<-as.data.frame(pred_train)
pred_train[pred_train<0] <- 0
rmsle(pred_train$pred_train, actual$Fatalities)

submission_file$Fatalities <- pred_train$pred_train

write.csv(submission_file,"/Users/lina/Documents/Masters/Term_3/advanced_r/group_assignment/covid19-global-forecasting-week-4/submission_xgboost4.csv",row.names=F)

##### 7. Last data enrichnment - Adding oxford data ####


##In order to add Government response data, we grabbed the code from this notebook 
#https://www.kaggle.com/zumbov/covid-19-week-4-regression-on-daily-increases

file <- paste0("grt_", Sys.Date(), ".xlsx")
url_gr <- "https://www.bsg.ox.ac.uk/sites/default/files/OxCGRT_Download_latest_data.xlsx"
GET(url_gr, write_disk(file, overwrite = T))

gr <- suppressWarnings(readxl::read_excel(file)) %>%
  mutate(Date = ymd(Date)) %>% 
  select(1, 3, 4, 7, 10, 13, 16, 19, 22)

names(gr) <- c(
  "Country_Region", "Date", "gr_school", "gr_workplace", "gr_event", "gr_transport", 
  "gr_campaign", "gr_movement", "gr_travel"
)


train_2<-train_m%>%left_join(gr, by = c("Country_Region", "Date"))
test_2<-test_m%>%left_join(gr, by = c("Country_Region", "Date"))

#The two functions below to merge the data belong to the same notebook
front.missings.to.zero <- function(x) {
  
  row <- 1:length(x)
  y <- suppressWarnings(min(which(!is.na(x))))
  y <- ifelse(is.finite(y), y, length(x) + 1)
  ifelse(row < y, 0, x)
  
}

train_2 <- train_2 %>% 
  group_by(country_province) %>% 
  mutate_at(vars(starts_with("gr_")), ~front.missings.to.zero(.)) %>% 
  fill(starts_with("gr_"), .direction = "down") %>% 
  ungroup()

test_2 <- test_2 %>% 
  group_by(country_province) %>% 
  mutate_at(vars(starts_with("gr_")), ~front.missings.to.zero(.)) %>% 
  fill(starts_with("gr_"), .direction = "down") %>% 
  ungroup()


###### Grid Search  - Fatalities ####

params <- list(eta_values=c(1), 
               gamma_values=c(10^-3),
               max_depth_values=c(1,10),
               min_child_weight_values=c(1, 5),
               subsample_values=c( 1),
               colsample_bytree_values=c(1),
               num_parallel_tree_values=c(10),
               nrounds_values=c(10,25), 
               lambda_values = c(0), 
               alpha_values = c(0));
params$nthread <- detectCores();

grid_results_xgb <- data.table();
for (i in 1:length(params$eta_values)){
  for (j in 1:length(params$gamma_values)){
    for (k in 1:length(params$max_depth_values)){
      for (l in 1:length(params$min_child_weight_values)){
        for (m in 1:length(params$subsample_values)){
          for (n in 1:length(params$colsample_bytree_values)){
            for (o in 1:length(params$num_parallel_tree_values)){
              for (p in 1:length(params$nrounds_values)){
                for (q in 1:length(params$lambda_values)){
                  for (r in 1:length(params$alpha_values)){
                    eta <- params$eta_values[i]
                    gamma<-params$gamma_values[j]
                    max_depth<-params$max_depth_values[k]
                    min_child_weight<-params$min_child_weight_values[l]
                    subsample<-params$subsample_values[m]
                    colsample_bytree <- params$colsample_bytree_values[n];
                    num_parallel_tree <- params$num_parallel_tree_values[o];
                    nrounds <- params$nrounds_values[p];
                    lambda <- params$lambda_values[q];
                    alpha <- params$alpha_values[r];
                    
                    # Log
                    print(sprintf("Start of params=%s",c(eta,gamma,max_depth,min_child_weight,subsample,colsample_bytree,num_parallel_tree,nrounds, lambda, alpha)));
                    
                    # Train   
                    dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_2%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                                         #"Fatalities","change_cf",
                                                                                         "ConfirmedCases","change_cc","female_leaders",
                                                                                         # "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                                         #"days_since_death_1","days_since_death_10","days_since_death_50",
                                                                                         "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                                         "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2",
                                                                                         "gr_school","gr_workplace","gr_event","gr_transport","gr_campaign","gr_movement","gr_travel"))), 
                                                     label = as.numeric(fatalities));
                    set.seed(100);  
                    model <- xgboost(data = dat_train_xgboost, params=list(eta = eta, gamma = gamma,max_depth=max_depth,
                                                                           min_child_weight=min_child_weight,subsample=subsample,colsample_bytree=colsample_bytree,
                                                                           num_parallel_tree=num_parallel_tree, lambda = lambda, alpha = alpha),
                                     save_period=NULL,
                                     nthread = params$nthread, nrounds = nrounds, verbose = 0)
                    
                    # Predict
                    pred_train <- predict(model, newdata = as.matrix(test_2%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                                       #"Fatalities","change_cf",
                                                                                       "ConfirmedCases","change_cc","female_leaders",
                                                                                       # "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                                       #"days_since_death_1","days_since_death_10","days_since_death_50",
                                                                                       "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                                       "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2",
                                                                                       "gr_school","gr_workplace","gr_event","gr_transport","gr_campaign","gr_movement","gr_travel"))));
                    pred_train<-as.data.frame(pred_train)
                    # Evaluation
                    pred_train[pred_train<0] <- 0
                    rmsle_train <- rmsle(pred_train$pred_train, actual$Fatalities)

                    # Log
                    print(paste0(paste(sprintf("End of params= %s. ",
                                               c(eta,gamma,max_depth,min_child_weight,subsample,colsample_bytree,num_parallel_tree,nrounds, lambda, alpha)), sep = "", collapse = ""),
                                 sprintf("AUC train = %s", rmsle_train)));
                    
                    
                    # Results
                    ret <- data.table(eta = eta, gamma = gamma,max_depth=max_depth,
                                      min_child_weight=min_child_weight,subsample=subsample,colsample_bytree=colsample_bytree,
                                      num_parallel_tree=num_parallel_tree, nrounds = nrounds, 
                                      lambda = lambda, alpha = alpha, nthread = params$nthread,
                                      rmsle_train = rmsle_train);
                    grid_results_xgb <- rbind(grid_results_xgb, ret);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


grid_results_xgb <- grid_results_xgb[order(rmsle_train)];
best <- grid_results_xgb[1]

dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_2%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                     "Fatalities","change_cf","female_leaders",
                                                                     "days_since_case_1","days_since_case_10","days_since_case_50","days_since_case_75",
                                                                     "days_since_death_1","days_since_death_10","days_since_death_50","days_since_death_75",
                                                                     "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                     "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2",
                                                                     "gr_school","gr_workplace","gr_event","gr_transport","gr_campaign","gr_movement","gr_travel"))), 
                                 label = as.numeric(fatalities));

set.seed(100);  
model <- xgboost(data = dat_train_xgboost, params=list(eta = best$eta, gamma = best$gamma,max_depth=best$max_depth,
                                                       min_child_weight=best$min_child_weight,subsample=best$subsample,colsample_bytree=best$colsample_bytree,
                                                       num_parallel_tree=best$num_parallel_tree, lambda = best$lambda, alpha = best$alpha),
                 save_period=NULL,
                 nthread = params$nthread, nrounds = best$nrounds, verbose = 0)


# Predict
pred_train <- predict(model, newdata = as.matrix(test_2%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                   "Fatalities","change_cf","female_leaders",
                                                                   "days_since_case_1","days_since_case_10","days_since_case_50","days_since_case_75",
                                                                   "days_since_death_1","days_since_death_10","days_since_death_50","days_since_death_75",
                                                                   "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                   "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2",
                                                                   "gr_school","gr_workplace","gr_event","gr_transport","gr_campaign","gr_movement","gr_travel"))))
pred_train<-as.data.frame(pred_train)
pred_train[pred_train<0] <- 0
rmsle(pred_train$pred_train, actual$Fatalities)

submission_file$Fatalities <- pred_train$pred_train


###### Grid Search  - Cases ####

params <- list(eta_values=c(1), 
               gamma_values=c(10^-3),
               max_depth_values=c(1,10),
               min_child_weight_values=c(1, 5),
               subsample_values=c( 1),
               colsample_bytree_values=c(1),
               num_parallel_tree_values=c(10),
               nrounds_values=c(10,25), 
               lambda_values = c(0), 
               alpha_values = c(0));
params$nthread <- detectCores();

grid_results_xgb <- data.table();
for (i in 1:length(params$eta_values)){
  for (j in 1:length(params$gamma_values)){
    for (k in 1:length(params$max_depth_values)){
      for (l in 1:length(params$min_child_weight_values)){
        for (m in 1:length(params$subsample_values)){
          for (n in 1:length(params$colsample_bytree_values)){
            for (o in 1:length(params$num_parallel_tree_values)){
              for (p in 1:length(params$nrounds_values)){
                for (q in 1:length(params$lambda_values)){
                  for (r in 1:length(params$alpha_values)){
                    eta <- params$eta_values[i]
                    gamma<-params$gamma_values[j]
                    max_depth<-params$max_depth_values[k]
                    min_child_weight<-params$min_child_weight_values[l]
                    subsample<-params$subsample_values[m]
                    colsample_bytree <- params$colsample_bytree_values[n];
                    num_parallel_tree <- params$num_parallel_tree_values[o];
                    nrounds <- params$nrounds_values[p];
                    lambda <- params$lambda_values[q];
                    alpha <- params$alpha_values[r];
                    
                    # Log
                    print(sprintf("Start of params=%s",c(eta,gamma,max_depth,min_child_weight,subsample,colsample_bytree,num_parallel_tree,nrounds, lambda, alpha)));
                    
                    # Train   
                    dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_2%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                                         "ConfirmedCases","change_cc","female_leaders",
                                                                                         #   "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                                         #  "days_since_death_1","days_since_death_10","days_since_death_50",
                                                                                         "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                                         "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2",
                                                                                         "gr_school","gr_workplace","gr_event","gr_transport","gr_campaign","gr_movement","gr_travel"))), 
                                                     label = as.numeric(cases));
                    set.seed(100);  
                    model <- xgboost(data = dat_train_xgboost, params=list(eta = eta, gamma = gamma,max_depth=max_depth,
                                                                           min_child_weight=min_child_weight,subsample=subsample,colsample_bytree=colsample_bytree,
                                                                           num_parallel_tree=num_parallel_tree, lambda = lambda, alpha = alpha),
                                     save_period=NULL,
                                     nthread = params$nthread, nrounds = nrounds, verbose = 0)
                    
                    # Predict
                    pred_train <- predict(model, newdata = as.matrix(test_2%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                                       "ConfirmedCases","change_cc","female_leaders",
                                                                                       #   "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                                       #  "days_since_death_1","days_since_death_10","days_since_death_50",
                                                                                       "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                                       "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2",
                                                                                       "gr_school","gr_workplace","gr_event","gr_transport","gr_campaign","gr_movement","gr_travel"))));
                    #pred_val <- predict(model, newdata = as.matrix(val[, -"target", with = F]));
                    pred_train<-as.data.frame(pred_train)
                    # Evaluation
                    pred_train[pred_train<0] <- 0
                    rmsle_train <- rmsle(pred_train$pred_train, actual$ConfirmedCases)
                    # auc_val <- AUC(target = val$target, prediction =  pred_val, quiet = TRUE);
                    
                    # Log
                    print(paste0(paste(sprintf("End of params= %s. ",
                                               c(eta,gamma,max_depth,min_child_weight,subsample,colsample_bytree,num_parallel_tree,nrounds, lambda, alpha)), sep = "", collapse = ""),
                                 sprintf("AUC train = %s", rmsle_train)));
                    
                    
                    # Results
                    ret <- data.table(eta = eta, gamma = gamma,max_depth=max_depth,
                                      min_child_weight=min_child_weight,subsample=subsample,colsample_bytree=colsample_bytree,
                                      num_parallel_tree=num_parallel_tree, nrounds = nrounds, 
                                      lambda = lambda, alpha = alpha, nthread = params$nthread,
                                      rmsle_train = rmsle_train);
                    grid_results_xgb <- rbind(grid_results_xgb, ret);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


grid_results_xgb <- grid_results_xgb[order(rmsle_train)];
best <- grid_results_xgb[1]

dat_train_xgboost <- xgb.DMatrix(data = as.matrix(train_2%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                     "ConfirmedCases","change_cc","female_leaders",
                                                                     #   "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                     #  "days_since_death_1","days_since_death_10","days_since_death_50",
                                                                     "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                     "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2",
                                                                     "gr_school","gr_workplace","gr_event","gr_transport","gr_campaign","gr_movement","gr_travel"))), 
                                 label = as.numeric(cases));

set.seed(100);  
model <- xgboost(data = dat_train_xgboost, params=list(eta = best$eta, gamma = best$gamma,max_depth=best$max_depth,
                                                       min_child_weight=best$min_child_weight,subsample=best$subsample,colsample_bytree=best$colsample_bytree,
                                                       num_parallel_tree=best$num_parallel_tree, lambda = best$lambda, alpha = best$alpha),
                 save_period=NULL,
                 nthread = params$nthread, nrounds = best$nrounds, verbose = 0)


# Predict
pred_train <- predict(model, newdata = as.matrix(test_2%>%select(c("region_encoded","month","day","weekend","dow_encoded",
                                                                   "ConfirmedCases","change_cc","female_leaders",
                                                                   #   "days_since_case_1","days_since_case_10","days_since_case_50",
                                                                   #  "days_since_death_1","days_since_death_10","days_since_death_50",
                                                                   "days_since_case_1_2","days_since_case_10_2","days_since_case_50_2","days_since_case_75_2",
                                                                   "days_since_death_1_2","days_since_death_10_2","days_since_death_50_2","days_since_death_75_2",
                                                                   "gr_school","gr_workplace","gr_event","gr_transport","gr_campaign","gr_movement","gr_travel"))))
pred_train<-as.data.frame(pred_train)
pred_train[pred_train<0] <- 0
rmsle(pred_train$pred_train, actual$ConfirmedCases)

submission_file$ConfirmedCases <- pred_train$pred_train

write.csv(submission_file,"/Users/lina/Documents/Masters/Term_3/advanced_r/group_assignment/covid19-global-forecasting-week-4/submission_xgboost_oxford.csv",row.names=F)

