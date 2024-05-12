##load library
library(tidyverse)
library(caret)

## 1.split data
## Create function to split data
train_test_split <- function(data,size){
  set.seed(42)
  n <- nrow(data)
  train_id <- sample(1:n ,size*n)
  train_df <- data[train_id, ]
  test_df <- data[-train_id, ]
  return(list(train_df,test_df))
}
## Prepare data to model train 80%, test 20%
prep_data <- train_test_split(churn,0.8)

## 2.train model
glm_model <- train(churn ~ internationalplan + voicemailplan + totaldayminutes + totaldaycalls,
               data = prep_data[[1]],
               method = "glm")

## 3.score
pred_churn <- predict(glm_model, newdata= prep_data[[2]])

## 4.evaluate Test accuracy
acc <- mean(pred_churn == prep_data[[2]]$churn)

---------------------------------------
##Result
> glm_model
Generalized Linear Model 

4000 samples
   4 predictor
   2 classes: 'No', 'Yes' 

No pre-processing
Resampling: Bootstrapped (25 reps) 
Summary of sample sizes: 4000, 4000, 4000, 4000, 4000, 4000, ... 
Resampling results:

  Accuracy   Kappa    
  0.8603043  0.1230981

> acc
[1] 0.855
