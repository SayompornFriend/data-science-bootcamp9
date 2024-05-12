##load library
library(tidyverse)
library(caret)
library(MLmetrics)
library(readr)

##read csv
churn <- read_csv("churn.csv")
view(churn)


##check data missing valur
glimpse(churn)
mean(complete.cases(churn)) ## =1 : no missing value

data <- churn %>%
          select(churn,numbervmailmessages,totaldayminutes,totaldaycharge,
                 totaleveminutes,numbercustomerservicecalls)


## 1.split model5
set.seed(42)
n <- nrow(data)
train_id <- sample(1:n,0.8*n)
train_df <- data[train_id, ]
test_df <- data[-train_id, ]

##preprocessing
data_tranform <- preProcess(train_df,
                            method = c("center","scale"))

train_df_z <- predict(data_tranform,train_df)
test_df_z <- predict(data_tranform,test_df)


## 2.train model
ctrl <- trainControl( method = "cv",
                      number = 5,
                      summaryFunction = prSummary,
                      classProbs = TRUE)


glm_model <- train( churn ~ .,
                    data = train_df_z,
                    method = "glm",
                    metric = "AUC",
                    trControl = ctrl)

k_grid <- data.frame(k = c(seq(3,11, by=2)) )

set.seed(42)
knn_model <- train( churn ~.,
                    data = train_df_z,
                    method = "knn",
                    metric = "Precision",
                    trControl = ctrl,
                    tuneGrid = k_grid)


## 3.score
pred_churn_glm <- predict(glm_model, newdata = test_df_z )
pred_churn_knn <- predict(knn_model, newdata = test_df_z )




## 4.evaluate

# Convert to factor with levels "Yes" and "No"
test_df_convert <- factor(test_df_z$churn, levels = c("Yes", "No"))
# Check the factor levels
levels(test_df_convert)

## confusion matrix
con_glm <-confusionMatrix(pred_churn_glm, 
                test_df_convert, 
                positive="Yes",
                mode="prec_recall")

con_knn <-confusionMatrix(pred_churn_knn, 
                test_df_convert, 
                positive="Yes",
                mode="prec_recall")
---------------------------------------------------------
##result
> glm_model
Generalized Linear Model 

4000 samples
   5 predictor
   2 classes: 'No', 'Yes' 

No pre-processing
Resampling: Cross-Validated (5 fold) 
Summary of sample sizes: 3200, 3199, 3200, 3200, 3201 
Resampling results:

  AUC        Precision  Recall     F        
  0.9332778  0.8688818  0.9906926  0.9257935

> con_glm
Confusion Matrix and Statistics

          Reference
Prediction Yes  No
       Yes   9   9
       No  136 846
                                          
               Accuracy : 0.855           
                 95% CI : (0.8316, 0.8763)
    No Information Rate : 0.855           
    P-Value [Acc > NIR] : 0.5221          
                                          
                  Kappa : 0.081           
                                          
 Mcnemar's Test P-Value : <2e-16          
                                          
              Precision : 0.50000         
                 Recall : 0.06207         
                     F1 : 0.11043         
             Prevalence : 0.14500         
         Detection Rate : 0.00900         
   Detection Prevalence : 0.01800         
      Balanced Accuracy : 0.52577         
                                          
       'Positive' Class : Yes       

> knn_model
k-Nearest Neighbors 

4000 samples
   5 predictor
   2 classes: 'No', 'Yes' 

No pre-processing
Resampling: Cross-Validated (5 fold) 
Summary of sample sizes: 3200, 3200, 3200, 3200, 3200 
Resampling results across tuning parameters:

  k   AUC        Precision  Recall     F        
   3  0.1718191  0.9257161  0.9744038  0.9494253
   5  0.2625138  0.9260036  0.9822569  0.9532945
   7  0.3400829  0.9245871  0.9837120  0.9532274
   9  0.4089153  0.9234790  0.9860385  0.9537308
  11  0.4710868  0.9217625  0.9866194  0.9530850

Precision was used to select the optimal model using the largest value.
The final value used for the model was k = 5.

> con_knn
Confusion Matrix and Statistics

          Reference
Prediction Yes  No
       Yes  76  13
       No   69 842
                                          
               Accuracy : 0.918           
                 95% CI : (0.8992, 0.9343)
    No Information Rate : 0.855           
    P-Value [Acc > NIR] : 8.602e-10       
                                          
                  Kappa : 0.6061          
                                          
 Mcnemar's Test P-Value : 1.250e-09       
                                          
              Precision : 0.8539          
                 Recall : 0.5241          
                     F1 : 0.6496          
             Prevalence : 0.1450          
         Detection Rate : 0.0760          
   Detection Prevalence : 0.0890          
      Balanced Accuracy : 0.7545          
                                          
       'Positive' Class : Yes   




