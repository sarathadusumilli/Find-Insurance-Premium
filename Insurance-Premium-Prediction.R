# Install and import necessary packages
# Code:
rm(list=ls())
library(rio)
library(moments)

# Loading the Data
#Code:
  #Data Loading
setwd("C:/QMB/Project")
insurancedata = import("insurance.csv")
colnames(insurancedata)=tolower(make.names(colnames(insurancedata)))

#Data Exploration and cleaning:
#Code:
  #Converting smoker variable to factor variable.
  insurancedata$smoker = as.factor(insurancedata$smoker)
str(insurancedata)

#As we have around 1338 observations taking sample of 100 as per the instructions given in project document

#Code:
  set.seed(414)
insurancesubsetdata_n = subset(insurancedata,(smoker=='no'))
insurancesubsetdata_s = subset(insurancedata,(smoker=='yes'))
randomsample_n=insurancesubsetdata_n[sample(1:nrow(insurancesubsetdata_n),50),]
randomsample_s=insurancesubsetdata_s[sample(1:nrow(insurancesubsetdata_s),50),]

#Combined Data 
#Combined Data with equal split ratio on smoker variable
#Code:
combinedinsurancedata1 = rbind(randomsample_n,randomsample_s)
str(combinedinsurancedata1)

#Since the dataset is having 7 variables, we are considering only 4 variables for this project i.e. Y = expenses, X1=age, X2=bmi and X3=smoker

#Code:
combinedinsurancedata = combinedinsurancedata1[c("age","bmi","smoker","expenses")]
str(combinedinsurancedata)
nrow(combinedinsurancedata)
combinedinsurancedata

# 5	Modeling and Analysis:
#In this Dataset, our target variable is “expenses”.
#As per our problem statement we are trying to find insurance premium expenses based different variables.  
# Regression analysis
# Below are the three simple regression models of the form (expenses, age), (expenses, bmi) and (expenses, smoker).
# Model 1:
#Code:
model1 = lm(expenses~age, data=combinedinsurancedata) #(y, X1)
summary(model1) 


#Analysis:
#  From model 1, considering expenses as dependent variable and age as independent variable, we got the P value as greater than 0.05 which indicates that age doesn’t have any significant effect on the insurance premium.
#The Residual standard error is 15000 on 98 degrees of freedom
#Similarly, the R square value is 0.01902
#We need to perform regression on the remaining models and conclude accordingly.

#Model 2:
#Code:
model2 = lm(expenses~bmi, data=combinedinsurancedata) #(y, X2)
summary(model2) 

#Analysis:
#From model 2, considering expenses as dependent variable and bmi as independent variable, we got the P value less than 0.05 which indicates that bmi has a significant effect on the insurance premium.
#The Residual standard error is 14620 on 98 degrees of freedom
#Similarly, the R square value is 0.06777
#Which is better fit than model1, but we need to perform regression on the remaining models and conclude accordingly.


#Model 3:
#Code:
model3 = lm(expenses~smoker, data=combinedinsurancedata) #(y, X3)
summary(model3) 

#Analysis:
#  From model 3, considering expenses as dependent variable and smoker as independent variable, we got the P value less than 0.05 which indicates that smoker variable has a significant effect on the insurance premium.
#The Residual standard error is 8630 on 98 degrees of freedom
#Similarly, the R square value is 0.6751
#Which is better fit than model1 and model2, but we need to perform regression on the remaining models and conclude accordingly.

#Three multiple regression models using two independent variables of the form (expenses, age, bmi), (expenses,age,smoker), and (expenses, bmi, smoker).
#Model 4:
#Code:
model4 = lm(expenses~age+bmi, data=combinedinsurancedata) #(y, X1, X2)
summary(model4) 

#Analysis:
#  From model 4, considering expenses as dependent variable and age, bmi as independent variables, we got the P value as less than 0.05 for bmi and greater than 0.05 for age, which indicates that bmi variable has a significant effect on the insurance premium than age. And age doesn’t show any significant effect on the insurance premium.
#The Residual standard error is 14500 on 97 degrees of freedom
#Similarly, the R square value is 0.09255
#Which is not a good fit when compared to model3, but still slightly better fit than model1 and model2.


#Model 5:
#Code:
model5 = lm(expenses~age+smoker, data=combinedinsurancedata) #(y, X1, X3)
summary(model5) 

#Analysis:
#  From model 5, considering expenses as dependent variable and age, smoker as independent variables, we got the P value less than 0.05 for age and smoker variables, which indicates that age and smoker variable has a significant effect on the insurance premium.
#The Residual standard error is 8169 on 97 degrees of freedom
#Similarly, the R square value is 0.7119
#Which is a better fit than all the above models, but we need to perform regression on the remaining models and conclude accordingly.

#Model 6:
#  Code:
model6 = lm(expenses~bmi+smoker, data=combinedinsurancedata) #(y, X2, X3)
summary(model6) 

#Analysis:
#  From model 6, considering expenses as dependent variable and bmi, smoker as independent variables, we got the P value less than 0.05 for bmi and smoker variables, which indicates that bmi and smoker variable has a significant effect on the insurance premium.
#The Residual standard error is 7528 on 97 degrees of freedom
#Similarly, the R square value is 0.7553
#Which is by far the better fit than all the above models, but we need to perform regression on the remaining models and conclude accordingly.


#Model 7
#Code:
model7 = lm(expenses~age+bmi+smoker, data=combinedinsurancedata) #(y, X1, X2, X3)
summary(model7)


#Analysis:
#  From model 7, considering expenses as dependent variable and age, bmi, smoker as independent variables, we got the P value less than 0.05 for all age, bmi and smoker variables, which indicates that all the independent variables has a significant effect on the insurance premium.
#The Residual standard error is 6823 on 96 degrees of freedom
#Similarly, the R square value is 0.801
#Which better fit than Model6 and by far the better fit than all the above models, but we need to perform regression on the remaining models and conclude accordingly.


#Model 8
#Code:
model8 = lm(expenses~age+bmi+I(age*bmi), data=combinedinsurancedata) #(y, X1, X2, X1X2)
summary(model8)

#Analysis:
#  From model 8, considering expenses as dependent variable and age, bmi, age*bmi as independent variables, we got the P values greater than 0.05 for age, bmi and age*bmi variables, which indicates that the above variables doesn’t have any significant effect on the insurance premium.
#The Residual standard error is 14570 on 96 degrees of freedom
#Similarly, the R square value is 0.09309
#Which is not a better fit when compared to above models, but still slightly better fit than model1 and model2.


# Model 9
#Code:
model9 = lm(expenses~age+I(age^2), data=combinedinsurancedata) #(y, X1, X12)
summary(model9)

#Analysis:
#  From model 9, considering expenses as dependent variable and age, age^2 as independent variables, we got the P values greater than 0.05 for age and age^2variables, which indicates that the above variables doesn’t have any significant effect on the insurance premium.
#The Residual standard error is 15000 on 97 degrees of freedom
#Similarly, the R square value is 0.02899
#Which is the least fit model when compared to all the above models.


#Model 10
#Code:
model10 = lm(expenses~bmi+I(bmi^2), data=combinedinsurancedata) #(y, X2, X22)
summary(model10)

#Analysis:
#  From model 10, considering expenses as dependent variable and bmi, bmi^2 as independent variables, we got the P less than 0.05 for bmi variable and greater than 0.05 for bmi^2 variables, which indicates that the bmi^2 has no significant effect on the insurance premium.
#The Residual standard error is 14690 on 97 degrees of freedom
#Similarly, the R square value is 0.0688
#Which is not a good fit when compared to other models, but slightly better fit than model1.
#By comparing all the above 10 models we can clearly say that model 7 is best fit.

#Assessment of whether our model violates any of the common regression assumptions for linearity, independence of errors, normality of errors, and equality of error variances (L.I.N.E.).
#Linearity
#Code:
plot(combinedinsurancedata$expenses, model7$fitted.values, pch=19,main="Actual insurance data vs Fitted")
abline(0,1,col="red",lwd=3)

#Analysis:
#  LINEARITY:
#  From the above linearity graph, when we plotted graph on Actual vs Fitted values, most of the datapoints are on or near to the line following a linear pattern than taking a curved path with very minimal outliers. Therefore, the data satisfies the linearity assumption.

#Normality :
#Code:
qqnorm(model7$residuals,pch=19,main="Normality Plot")
qqline(model7$residuals,lwd=3,col="red")

#Analysis:
#  NORMALITY:
#  Using QQ Plot:
#  By observing the above QQ plot, we can see that we have a good number of data points coinciding with the projected qq-line, despite of the fact that there are few outliers. The accompanying figure makes it very evident that the Normality assumption is true.

#Equality of Variances
#Code:
plot(combinedinsurancedata$expenses,rstandard(model7),
       pch=19,main="Warehouse Residual Plot")
abline(0,0,col="red",lwd=3)

#Analysis:
#  By observing the above graph we can say that there is no particular pattern is observed in the equality of variance graph. We also don’t see any pattern of Heteroscedasticity. Hence we can confirm that the information complies with the requirements for equality of variances.

# For best model that is model 7
#Code:
summary(model7)  

#Interpretation:
#  We can say that the intercept's beta coefficient, which is -24113.09 and has a p value of 1.01e-07, less than 0.05, is important for determining the expenses of the dependent variables. If all the remaining beta coefficients are zero, the expenses are decreased by $2413,113. However, it is rare in the real world to have both age and BMI at 0.
#With a p value less than 0.05, age has a significant beta coefficient of 233.23. Every additional year of age results in a $280 increase in premiums, all other independent variables being held constant.
#The beta coefficient of the bmi has a p value of 2.72e-09, which is less than 0.05 and significant, and a value of 718.64. If bmi increases by one unit, the expenses rises by 718 dollars while all other independent variables stay unchanged.

# Confidence Interval of Model 7:
#Code:
confint(model7)

#Interpretation:
#  95% confidence interval:
#  we are 95% confident that age ranges from 134 to 331
#we are 95% confident that bmi ranges from 501 to 936
#we are 95% confident that smokeryes ranges from 22582 to 28014
#we are 95% confident that The intercept ranges from -32423 to -15802
#From the above observation the range for all the variables including intercept seems to be wider. The accuracy is dependent on the width of the confidence interval, in ideal case confidence interval being narrow indicates a better model.


#The two types of prediction confidence intervals
#Code: For “predict” as interval
insurance_predict = data.frame(age=20,bmi=28.2,smoker='yes')
predict(model7,insurance_predict,interval = 'predict')

#Analysis:
#  When we predicted expenses using “predict” as interval for a person who is 20 years old having bmi 28.2 and smoker, the expense according to the forecast above is $26115.44. The intervals seem to be wider(12319.21 to 39911.68) than would be expected. Since we have considered only 100 samples the range is wider, this might get better if we consider more number of samples.
#Code: For “'confidence'” as interval
insurance_predict = data.frame(age=20,bmi=28.2,smoker='yes')
predict(model7,insurance_predict,interval = 'confidence')

#Analysis:
#  When we predicted expenses using “confidence” as interval for a person who is 20 years old having bmi 28.2 and smoker, the expense according to the forecast above is $26115.44 which is same as above but the intervals seems to be tighter now(23488.78 to 28742.11) which is a good sign.


