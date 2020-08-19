install.packages("metric")
rm(list = ls())
library(dplyr)
library (shiny)
library(ggplot2)
library(scales)
library(tidyr)
library(forecast)
library(metric)
library(reshape2)

train <- read.csv("/Users/Jonas/Documents/MBD/03. Term 3/Electives/Advanced R/00. GA/Archive/train.csv")
test <- read.csv("/Users/Jonas/Documents/MBD/03. Term 3/Electives/Advanced R/00. GA/Archive/test.csv")
submission_file<-read.csv("/Users/Jonas/Documents/MBD/03. Term 3/Electives/Advanced R/00. GA/Archive/submission.csv")


##### 1. Quick Data Exploration-Manipulation ######

head(train)
lapply(train, class)

#date to class date
train$Date<-as.Date(as.POSIXct(train$Date, format='%Y-%m-%d'))
test$Date<-as.Date(as.POSIXct(test$Date, format='%Y-%m-%d'))

min(train$Date)
max(train$Date)

min(test$Date)
max(test$Date)

sum(is.na(train$Province_State))
sum(is.na(train$Fatalities))
sum(is.na(train$ConfirmedCases))

summary(train$ConfirmedCases)
summary(train$Fatalities)

#### 2.2 Time Series Model ####

#### 2.2.1 Fatalities - Data Preparation ####

#paste country_region and state
train$country_province <- paste(train$Country_Region,train$Province_State)
test$country_province <- paste(test$Country_Region,test$Province_State)

#filter for fatalities
train_fatalities <- train %>%
  select(Date, country_province, Fatalities)

#pivot test data
test_pivot<- test %>%
  select(Date, country_province)

#pivot tables so each column is a country-province

fatalities_pivot <- train_fatalities %>%
  pivot_wider(names_from = country_province, values_from = Fatalities)

fatalities_pivot_test <- test_pivot %>%
  pivot_wider(names_from = country_province)


####### 2.2.2 Loop TS auto arima for all of the countries- Fatalities ######

names(fatalities_pivot) <- gsub("\\s+", "", names(fatalities_pivot))
names(fatalities_pivot) <- gsub("\\(", "", names(fatalities_pivot))
names(fatalities_pivot) <- gsub("\\)", "", names(fatalities_pivot))
names(fatalities_pivot) <- gsub("\\'", "", names(fatalities_pivot))
names(fatalities_pivot) <- gsub("\\*", "", names(fatalities_pivot))
names(fatalities_pivot) <- gsub("\\,", "", names(fatalities_pivot))
names(fatalities_pivot) <- gsub("\\-", "", names(fatalities_pivot))


mylist = list()

for(i in names(fatalities_pivot)){
  
  data<-fatalities_pivot %>%
    select_(i)
  ts_data<-ts(data,frequency=365, start = c(2020,01,22))
  model<-auto.arima(ts_data, seasonal = FALSE,stepwise=FALSE, approximation=FALSE)
  pred <- forecast(model, h = 43)
  pred_mean = as.data.frame(pred$mean)
  listtmp = pred_mean$x
  mylist<- rbind(mylist,list(listtmp))
  
  
}

fatalities <- as.data.frame(do.call(cbind, mylist))

colnames(fatalities)<-names(fatalities_pivot_filtered)

fatalities_submission<-melt(fatalities)

#### 2.2.3 Confirmed Cases - Data Preparation ####

#filter for confirmed cases
train_cases <- train %>%
  select(Date, country_province, ConfirmedCases)

#pivot confirmed cases
cases_pivot <- train_cases %>%
  pivot_wider(names_from = country_province, values_from = ConfirmedCases)

#filter
cases_pivot_filtered = cases_pivot %>%
  filter(Date < "2020-04-01") %>% #to avoid data leakage!
  select(-Date)

#clean names
names(cases_pivot_filtered) <- gsub("\\s+", "", names(cases_pivot_filtered))
names(cases_pivot_filtered) <- gsub("\\(", "", names(cases_pivot_filtered))
names(cases_pivot_filtered) <- gsub("\\)", "", names(cases_pivot_filtered))
names(cases_pivot_filtered) <- gsub("\\'", "", names(cases_pivot_filtered))
names(cases_pivot_filtered) <- gsub("\\*", "", names(cases_pivot_filtered))
names(cases_pivot_filtered) <- gsub("\\,", "", names(cases_pivot_filtered))
names(cases_pivot_filtered) <- gsub("\\-", "", names(cases_pivot_filtered))

#### 2.2.4 Loop TS auto arima for all of the countries- Confirmed Cases  ####

mylist = list()

for(i in names(cases_pivot_filtered)){
  
  data<-cases_pivot_filtered %>%
    select_(i)
  ts_data<-ts(data,frequency=365, start = c(2020,01,22))
  model<-auto.arima(ts_data, seasonal = FALSE,stepwise=FALSE, approximation=FALSE)
  pred <- forecast(model, h = 43)
  pred_mean = as.data.frame(pred$mean)
  listtmp = pred_mean$x
  mylist<- rbind(mylist,list(listtmp))
  
  
}

cases <- as.data.frame(do.call(cbind, mylist))

colnames(cases)<-names(cases_pivot_filtered)

cases_submission<-melt(cases)


#### 3 Submission File ####

submission_file$ConfirmedCases <- cases_submission$value
submission_file$Fatalities <- fatalities_submission$value

write.csv(submission_file,"/Users/lina/Documents/Masters/Term_3/advanced_r/group_assignment/covid19-global-forecasting-week-4/submission_ts.csv",row.names=F)

### PUBLIC SCORE ON KAGGLE : 0.48976

#### 4. RMSLE ####

submission_file$ConfirmedCases <- cases_submission$value
submission_file$Fatalities <- fatalities_submission$value

real_confirmed = train %>% filter(Date >= "2020-04-01" & Date <= "2020-05-13") %>% select(ConfirmedCases)
real_fatalities = train %>% filter(Date >= "2020-04-01" & Date <= "2020-05-13") %>% select(Fatalities)

submission_file[submission_file<0] <- 0

rmsle(submission_file$ConfirmedCases, real_confirmed$ConfirmedCases)
rmsle(submission_file$Fatalities, real_fatalities$Fatalities)


