# Machine Learning Models for Airline Passenger Satisfaction

This project explores the application of various machine learning models to predict airline passenger satisfaction. The models used include:
- Naive Bayes
- K-Nearest Neighbors (KNN)
- Decision Tree
- Linear Regression
- Support Vector Machine (SVM)

---

## Data Overview

The dataset used in this project, `airline_passenger_satisfaction.csv`, consists of the following key features:

- **Flight Distance**: Distance of the flight in miles.
- **Service Ratings**: Ratings of services such as seat comfort, food, and in-flight entertainment.
- **Leg Room Service**: Rating of leg room service on the flight.
- **Satisfaction**: The target variable indicating whether the passenger was "Satisfied" or "Dissatisfied". This was converted to a binary format (1 for "Satisfied", 0 for "Dissatisfied") for model compatibility.
  -[airline_passengers_satisfication Data](https://github.com/12narendra45/Data_Training_Models/blob/main/airline_passenger_satisfaction.csv)
  
## Project Overview

The dataset (`airline_passenger_satisfaction.csv`) contains information on passenger satisfaction along with several features such as flight distance, service ratings, and more.

The project includes:
1. Data preprocessing and cleaning.
2. Implementation of machine learning models.
3. Accuracy comparison among the models.
4. Visualizations of model results.

---


### Data Preprocessing:
- The dataset was cleaned by removing irrelevant columns and replacing missing values (if any) with `0`.
- Features and labels were extracted and split into training and testing sets (75% for training, 25% for testing).
- The target variable `Satisfaction` was encoded into a binary format.

---


## Process of Execution

1. **Dataset Preparation**:
   - Load the dataset `airline_passenger_satisfaction.csv`.
   - Remove irrelevant columns and handle missing values by replacing them with `0`.

2. **Data Splitting**:
   - Split the dataset into training (75%) and testing (25%) sets.

3. **Model Training**:
   - Train multiple machine learning models:
     - **Naive Bayes** using the `e1071` package.
     - **KNN** using the `class` package with `k=8`.
     - **Decision Tree** using `rpart` and visualize it with `rpart.plot`.
     - **Linear Regression** using `lm` to compute R-squared.
     - **SVM** using `kernlab` with a linear kernel (`vanilladot`).

4. **Model Evaluation**:
   - Test each model on the test dataset and calculate accuracy.
   - Compare accuracies of all models using a bar plot.

5. **Visualizations**:
   - Save visualizations such as the Decision Tree and Accuracy Comparison using `ggsave()`.

---

## Models and Results

### 1. Naive Bayes
- **Description**: A probabilistic model based on Bayes' theorem.
- **Accuracy**: `79%`

### 2. K-Nearest Neighbors (KNN)
- **Description**: Instance-based learning algorithm.
- **Accuracy**: `XX%`

### 3. Decision Tree
- **Description**: A rule-based model for classification.
- **Accuracy**: `XX%`
- 

### 4. Linear Regression
- **Description**: Regression model for continuous data.
- **R-Squared Value**: `XX%`
- 

### 5. Support Vector Machine (SVM)
- **Description**: Large-margin classifier.
- **Accuracy**: `XX%`

### Accuracy Comparison
The bar plot below compares the accuracies of all models.


---

## Conclusion

- **Best Performing Model**: Based on the accuracy comparison, the best-performing model is `XYZ Model` with an accuracy of `XX%`.
- **Insights**:
  - Feature engineering and preprocessing significantly affect model performance.
  - Decision Tree and Naive Bayes provide interpretable results, whereas SVM excels in handling high-dimensional data.
  - KNN is sensitive to the choice of `k` and can perform poorly with imbalanced datasets.

This analysis highlights the importance of trying multiple models to find the best fit for a specific dataset.

---

## Prerequisites

To run this project, ensure you have:
- **R (version 4.0 or higher)** installed.
- R packages:
  - `e1071`
  - `class`
  - `rpart`
  - `rpart.plot`
  - `kernlab`
  - `ggplot2`

You can install the required packages by running the `packages.R` script:
```r

