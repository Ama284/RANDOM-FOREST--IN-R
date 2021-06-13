library(caTools)
library(randomForest)

# 1. After splitting the data frame into train and test sets, build a random model on top of
# the train set for the city_temperature data frame.
# a. For this model, take AvgTemperature, Day, Month, and Year as the
# independent variable and Region as the dependent variable.
read.csv("E:/DATA ANALYST/Data Science/city_temperature.csv")->city_temperature
View(city_temperature)

sample.split(city_temperature$Region,SplitRatio = 0.7)->split_tag1
subset(city_temperature,split_tag1==T)->train
subset(city_temperature,split_tag1==F)->test
nrow(train)
nrow(test)

randomForest(Region~ AvgTemperature+Day+Month+Year, data = train,ntree=100,mtry=3)->mod_forest1
importance(mod_forest1)
varImpPlot(mod_forest1)

# 2. After splitting the data frame into train and test sets, build a random model on top of
# the train set for the Customer_Churn data frame.
# a. For this model, take tenure, Streaming TV, Monthly Charges, and Total Charges
# as the independent variable and Churn as dependent variable.
read.csv("E:/DATA ANALYST/Data Science/customer_churn.csv")->customer_churn
View(customer_churn)

sample.split(customer_churn$Churn, SplitRatio = 0.7)->split_tag2
subset(customer_churn,split_tag2==T)->train
subset(customer_churn,split_tag2==F)->test
nrow(train)
nrow(test)

randomForest(Churn~tenure+StreamingTV+MonthlyCharges+TotalCharges, data = train,ntree=100, mtry=3)->mod_forest2
importance(mod_forest2)
varImpPlot(mod_forest2)


# 3. After splitting the data frame into train and test sets, build a random model on top of
# the train set for the Pharmacovigilance_audit_Data data frame.
# a. For this model, take Gender, Age, and Patient_Id as independent variable and
# DrugId as dependent variable.
read.csv("E:/DATA ANALYST/Data Science/Pharmacovigilance_audit_Data.csv")->Pharmacovigilance_audit_Data
View(Pharmacovigilance_audit_Data)

sample.split(Pharmacovigilance_audit_Data$DrugID,SplitRatio = 0.7)->split_tag3
subset(Pharmacovigilance_audit_Data,split_tag3==T)->train
subset(Pharmacovigilance_audit_Data,split_tag3==F)->test
nrow(train)
nrow(test)

randomForest(DrugID~ Gender+Age+PatientID,data = train,ntree=100,mtry=3)->mod_forest3
importance(mod_forest3)
varImpPlot(mod_forest3)
