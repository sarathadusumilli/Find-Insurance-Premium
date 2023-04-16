# Find-Insurance-Premium
The goal of predicting insurance premium expenses by analyzing various features that can affect an individual's medical expenses. These features include age, physical and family health conditions, and location. By examining the relationship between these features and an individual's current medical expenses, we can create multiple linear regression models that predict future medical expenses for individuals. These models will help the medical insurance industry in determining premium costs, which are the fees charged by insurance companies for the coverage provided by an insurance policy.

To achieve this goal, we need to clean and preprocess the data before building the machine learning models. We will use R extensively for data cleaning and modeling. The cleaning process involves identifying and handling missing values, outliers, and other data quality issues. We will then use various data visualization techniques to gain insights into the data and select the most relevant features for building the models.

After cleaning and preprocessing the data, we will build multiple linear regression models using the selected features. These models will be trained and validated on the available data to ensure their accuracy and reliability. We will then select the best performing model based on its predictive power and other metrics such as R-squared, mean squared error, and mean absolute error.

Finally, we will use the selected model to predict future medical expenses and insurance premium costs for individuals. These predictions will help insurance companies in setting premium costs based on an individual's risk profile and expected medical expenses. Overall, this project aims to provide insights into the factors that influence insurance premium costs and enable insurance companies to make informed decisions.

![image](https://user-images.githubusercontent.com/67257904/232337753-df769a8b-0523-4265-abd8-ba52d09a773e.png)

# Dataset
There are 1338 rows of observations in this dataset, and 7 features (columns). Here Age, BMI, children, and expenses are the four continuous features and we have three nominal features are sex, smoker, and region.
(The dataset is taken from Kaggle - https://www.kaggle.com/datasets/noordeen/insurance-premium-prediction?resource=download)

# Dataset Description:

Independent Variables:

•	Age : The Age of the policy holder 

•	Sex: The Gender of the policy holder

•	BMI : Body mass index (BMI) is a measure of body fat based on height and weight of policy holder.

•	Children : Number of Children of the policy holder

•	Smoker: Says whether the policy holder is a smoker or non-smoker

•	Region : The Region where the policy holder belongs to.

Dependent Variable:

•	Expenses :  The Premium charged to the policy holder





