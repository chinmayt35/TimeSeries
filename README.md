# TimeSeries
## Overview
* Many believe that climate change is one of the biggest threats to the humanity, and that massive changes must be made in how we live to revert it and/or reduce its impact. At the same time, there are also many skeptics, who either do not believe in the threat per se, or that it is caused by human activity, or do not see a need (or possibility) to do much about it. This issue and the debate are, of course, multi‐faceted, but in this assignment we will look at the statistical evidence for global warming – a largely scientific, factbased view on the situation.
* Forecast the global average temperatures through year 2100. There are concerns about global temperatures raising by 2 degrees Celsius, and possibly even by 4 degrees by then.

## Goal
Using time-series models to take a deeper look and prediction into the change of global temperature till the year 2100.

## Model Selection
*	Model selection is determined by using Accuracy Function under the “Forecast” package in R
*	Metrics used to determine which model will be more accurate is based on evaluating the difference of RMSE instead of MAPE in each model
*	ETS (Exponential Smoothing) method was not used in the case since it is a simple model that helps with weighting recent times higher than older periods only for stationary time series. In this case, the mean value of time-series is not constant over time, therefore, more robust models such as Auto Arima and TABATS are applied instead. 

## Decomposition
In order to capture the variety of patterns within the time series data, it is often helpful to split time series data into components: a trend-cycle component, a seasonal component, and a remainder component (containing anything else in the time series).

## Evaluation Metric
* RMSE: The forecast errors are on the same scale as the data. This accuracy measure is scale-dependent – since our data uses the same scale in both the models this metrics can be used to evaluate the accuracy of the models.
* Reason for not using MAPE: A problem with percentage errors is that they assume the unit of measurement has a meaningful zero. In our data a percentage error makes no sense when measuring the accuracy of temperature forecasts on either the Fahrenheit or Celsius scales, because temperature has an arbitrary zero point.

* TBATS RMSE on Test set: 0.217
* Auto-ARIMA RMSE on Test set: 0.188

## Conclusion
* The results yield that AUTO-ARIMA model best fits the dataset and it has a better accuracy level for predicting the global temperatures.
* The December 2100 forecasted anomaly numbers as well as the forecasted graph provides evidence that the global temperatures have risen by almost 2 degrees Celsius (1.88 degrees Celsius) from the baseline. 
