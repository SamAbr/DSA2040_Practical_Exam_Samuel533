# 📊 Data Mining Task 1: Data Preprocessing and Exploration

## 🌼 Dataset Used
The **Iris dataset** from `scikit-learn` (`from sklearn.datasets import load_iris`) was used for this task. This is a well-known real-world dataset containing 150 samples of iris flowers, with 4 numeric features and 1 categorical target (species):

- **Features**:  
  - Sepal length (cm)  
  - Sepal width (cm)  
  - Petal length (cm)  
  - Petal width (cm)  

- **Target (Class)**:  
  - Species: *setosa*, *versicolor*, *virginica* (50 samples each)

This dataset is ideal for preprocessing and exploration tasks due to its clean structure, known clustering behavior, and balanced classes.

## 🔧 Preprocessing Steps

### 1. **Missing Value Check**
- The dataset was inspected for missing values using `df.isnull().sum()`.
- ✅ **No missing values** were found — consistent with the Iris dataset's reputation as a clean, built-in dataset.
- No imputation was required.

### 2. **Feature Normalization (Min-Max Scaling)**
- All four numeric features were scaled to the range [0, 1] using `MinMaxScaler`.
- This ensures equal feature contribution in downstream modeling (e.g., clustering, classification).
- ✅ Scaling completed successfully.

### 3. **Label Encoding**
- The species labels were **one-hot encoded** into three binary columns:  
  `species_setosa`, `species_versicolor`, `species_virginica`
- This prepares the data for models that require numeric input, including neural networks and some scikit-learn estimators.

## 🔍 Exploratory Data Analysis

### 1. **Summary Statistics**
- `pandas.describe()` was used to compute mean, standard deviation, min, max, and quartiles.
- Revealed clear differences in petal dimensions across species — key for separation.

### 2. **Visualizations**
Three key visualizations were generated and saved as high-resolution images:

- **`iris_pairplot.png`**:  
  Shows pairwise relationships between features, colored by species. Clearly reveals that *setosa* is linearly separable, while *versicolor* and *virginica* overlap slightly.

<img width="3335" height="3065" alt="iris_pairplot" src="https://github.com/user-attachments/assets/a5364cb7-d2aa-4ffa-af77-037ac0b342a3" />

- **`iris_correlation_heatmap.png`**:  
  Highlights strong positive correlation between petal length and petal width (≈0.96), indicating redundant information.

<img width="1931" height="1769" alt="iris_correlation_heatmap" src="https://github.com/user-attachments/assets/997a8eb8-d248-48a5-991f-3c109491b674" />

- **`iris_boxplots.png`**:  
  Displays distribution and potential outliers per feature. Only minor outliers in sepal width; otherwise, data is clean.

<img width="2967" height="1766" alt="iris_boxplots" src="https://github.com/user-attachments/assets/d5314fd7-81b3-41c3-a568-4e213a09711b" />

## 🔀 Train/Test Split Function

A reusable function `split_data()` was implemented to:
- Split the data 80/20 (train/test)
- Stratify by species to maintain class balance
- Return `X_train`, `X_test`, `y_train`, `y_test`

This ensures reproducible and fair evaluation in downstream modeling tasks.

## ✅ Conclusion
The Iris dataset required minimal preprocessing due to its high quality. However, scaling and encoding were applied to prepare the data for machine learning. The visualizations confirm strong cluster structure and guide future modeling choices. This preprocessing pipeline is robust, well-documented, and ready for use in classification and clustering tasks.
