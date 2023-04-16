# Find-Insurance-Premium
A company will charge us money in exchange for the coverage provided by an insurance policy. The term "insurance premium" describes this expense. We may pay the insurance premium monthly or semi-annually, depending on the specific insurance coverage. It's possible that we will have to pay the entire sum up front in some circumstances before your coverage begins. 
Here we are trying to find insurance premium expenses by validating different models.

# Dataset
There are 1338 rows of observations in this dataset, and 7 features (columns). Here Age, BMI, children, and expenses are the four continuous features and we have three nominal features are sex, smoker, and region.
(The dataset is taken from Kaggle - https://www.kaggle.com/datasets/noordeen/insurance-premium-prediction?resource=download)

# Approach
The project aims to predict the premium of an individual's health insurance by performing various machine learning tasks such as data preprocessing, data visualization, feature engineering, model building, and model testing.

First, the data is preprocessed to explore and identify any null or missing values, and outliers using pandas and numpy. Then, data visualization techniques are applied using matplotlib and seaborn to gain insights from the dataset.

Next, feature engineering techniques are employed to clean the data and select the most relevant variables for model building. The data is split into training and testing sets and used to train different machine learning algorithms such as linear regression, support vector regressor, random forest regressor, and gradient boosting regressor.

The model's performance is tested on the test data, and the model with the best r2_score and lowest mean absolute error (MAE) is selected. The best model is then saved for future predictions.

Hyperparameter tuning is performed using RandomizedSearchCV and GridSearchCV to get the best parameters.
