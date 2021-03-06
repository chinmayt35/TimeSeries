library(forecast)

#Reading datset
cru_Data<-read.csv("Met Data.csv")

#Defining time series of the dataset
cru_ts <- ts(cru_Data$TempAnom,start=1850, frequency=12)

#cru_temp_ts<-ts(cru_temp$TempAnom,start=1850, frequency=12)

###
#Decomposing Time Series datset
###

#Decompose using STL (Season and trend using Loess)
decomp <- stl(cru_ts, t.window=12, s.window="periodic") 
plot(decomp)

#checking for autocorrelation and determing an estimate for p and q
Acf(cru_ts,main="")
Pacf(cru_ts, main="")
Acf(diff(log(cru_ts,12)),main="")
Pacf(diff(log(cru_ts,12)),main="") 

###
#Tbats
###

#Train on full dataset and forecast
cru_tbats <- tbats(cru_ts,season=TRUE)
cru_tbats
cru_tbats_pred <- forecast(cru_tbats, h=1000, level=c(0.8, 0.90))
plot(cru_tbats_pred)
Acf(residuals(cru_tbats))


#split train and test and check for accuracy
train<-window(cru_ts, start=c(1850,01), end=c(2004,12))
test<-window(cru_ts, start=c(2005,01))

#TBATS accuracy
cru_tbats_acc<- tbats(train,season=TRUE)
cru_tbats_pred_acc <- forecast(cru_tbats_acc, h=302, level=c(0.8, 0.90))
accuracy(cru_tbats_pred_acc,test)

#plot decomposition
plot(cru_tbats)



###
#ARIMA
###

#Train on full dataset and forecast
arima_cru <- auto.arima(cru_ts, seasonal = TRUE,stepwise = FALSE,approximation = FALSE)
arima_cru
Acf(residuals(arima_cru))
Pacf(residuals(arima_cru))
forecasted_temp<-data.frame(forecast(arima_cru,h=1000),level=c(0.8, 0.90))
plot(forecast(arima_cru,h=1000),level=c(0.8, 0.90))


#Arima Accuracy
arima_cru_acc <- auto.arima(train, seasonal = TRUE,stepwise = FALSE,approximation = FALSE )
arima_cru_acc_pred <- forecast(arima_cru_acc, h=278, level=c(0.8, 0.90))
accuracy(arima_cru_acc_pred,test)

write.csv(forecasted_temp,"arimaforecast.csv")
