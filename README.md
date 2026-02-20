# Healthcare Staff Welfare and Performance Analysis
# Project Overview

**Project Tittle**: Healthcare Staff Welfare and Performance Analysis

This project investigates whether **staff income/welfare factors influence perfomance** across the 36 states in Nigeria.
Does higher salary or experience significantly improve staff performance?

## Dataset Overview
- 50,000 rows (Synthetic data generated in excel)
- 36 States
- **Key Variables**
  - Staff_ID
  - Age
  - Salary
  - Experience
  - Training
  - State
  - Performance_Score

**Data quality issues intentionally introduced**
- Missing Values
- Duplicates
- Outliers

## Methodology
### 1. Data Cleaning (Python - Pandas)
**Handling Missing Values**
- Missing Performance_Score value were replaced using **mean imputation**

**Removing Duplicates**
- Duplicate Staff_ID entries removed

**Handling Outlier**
- Salary capped using **Interquatile Range (IQR)** method
- Values outside bounds replaced with threshold values

Cleaned data was stored in SQL for structured querying.

### 2. Statistical Analysis
**Independent T-Test (Training Vs Performance_Score)**

t = 0.08

p = 0.94

**Result:** No Statistically significant difference in performance between trained and untrained staff.

### 3. Regression Model
A linear regression model was built to know whether **Salary** significantly predicts Performance Score, controlling for Age and Years of Experience.

**Train Test Split**

The dataset was split
- 80% Training Data
- 20% Testing Data
- Random State = 42 (For reproducibility)

```Python
from sklearn.model_selection import train_test_split

X_train, X_test, Y_train, Y_test = train_test_split(
    X, Y, test_size=0.2, random_state=42
)
```
**Feature Scaling**

Standardization of the trainig and test datasets was applied to prevent data leakage and consistent model performance.
```Python
from sklearn.preprocessing import StandardScaler

scaler = StandardScaler()

X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)
```
**Model Traning**

The linear Regression model was trained using the training dataset.
```Python
from sklearn.linear_model import LinearRegression

model = LinearRegression()
model.fit(X_train_scaled, Y_train)
```
**Model Evaluation**

This evaluates the model by generating predictions on the test dataset using the trained model and evaluating the performance by computing the Mean Squared Error.
```Python
from sklearn.metrics import mean_squared_error

Y_pred = model.predict(X_test_scaled)
mse = mean_squared_error(Y_test, Y_pred)
print("Mean_sqaured_error:", mse)
```

**Model Coefficient**

| Feature    | Coefficient | Interpretation                  |
| ---------- | ----------- | ------------------------------- |
| Salary     | 1.27e−09    | Very weak positive relationship |
| Age        | −2.71e−05   | No meaningful effect            |
| Experience | 1.30e−04    | Slight positive association     |

**Interpretation**

- Salary shows a positive but negligible coefficient.

- Age has no statistically meaningful influence.

- Experience has a very small positive association.

### 4. State-Level Insights

**Top 5 Highest Paid State**
- Ogun

- Anambra

- Benue

- Plateau

- Bauchi

**Top 5 Performing State**
- Sokoto

- Kogi

- Ekiti

- Katsina

- Delta

