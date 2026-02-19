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

'''from sklearn.model_selection import train_test_split

X_train, X_test, Y_train, Y_test = train_test_split(
    X, Y, test_size=0.2, random_state=42
)
'''
