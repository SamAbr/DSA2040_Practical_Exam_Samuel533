# 📦 Data Science Practical Exam — Summary Report

## 📌 Overview
This repository contains solutions for the **DSA2040 Practical Exam**, organized into two main categories:

1. **Data Warehousing**
   - Data Warehouse Design
   - ETL Process Implementation
   - OLAP Queries and Analysis
2. **Data Mining**
   - Data Preprocessing and Exploration
   - Clustering
   - Classification and Association Rule Mining

---

## 1️⃣ Data Warehousing

### 📂 Data Warehouse Design
- **Schema**: **Star Schema** with:
  - Fact Table: `fact_sales`
  - Dimensions: `dim_customer`, `dim_product`, `dim_store`, `dim_time`
- Optimized for **fast aggregations** and **flexible filtering**.
- Constraints implemented for **data integrity**.

<img width="821" height="721" alt="schema_diagram" src="https://github.com/user-attachments/assets/16cb39e7-c200-41d8-b349-cf1128faeeb8" />


---

### ⚙️ ETL Process Implementation
- **Extract**: UCI Online Retail dataset.
- **Transform**:
  - Calculated `TotalSales = Quantity × UnitPrice`
  - Removed invalid records (negative quantity/price)
  - Filtered **last year** of available data (relative to dataset max date)
  - Created **Customer** and **Time** dimension tables
- **Load**: SQLite DB with fact and dimension tables.

---

### 📊 OLAP Queries and Analysis
**Key Insights:**
- **Top-Selling Country**: UK (>£7M revenue)
- **Seasonality**: Q4 peaks due to holiday shopping
- **Regional Trends**: UK dominates all quarters; smaller markets show steady but lower sales

 <img width="3572" height="1767" alt="monthly_sales_trend" src="https://github.com/user-attachments/assets/c1339750-28c3-4c1f-8989-bc3f98544ba7" />
 <img width="4172" height="2066" alt="sales_by_quarter" src="https://github.com/user-attachments/assets/fde1444d-ca79-4b15-8e02-73815b2834eb" />
<img width="3572" height="1766" alt="top_countries_bar" src="https://github.com/user-attachments/assets/7b20fbd4-c76f-4115-9fdc-fd5f6ace131a" />



---

## 2️⃣ Data Mining

### 🔍 Data Preprocessing and Exploration
- **Dataset**: Iris (scikit-learn)
- **Preprocessing**:
  - Min-Max scaling for features
  - One-hot encoding for species
- **Exploration**:
  - Pairplots show clear separability of *Setosa*
  - Strong correlation between petal length & width

<img width="3335" height="3065" alt="iris_pairplot" src="https://github.com/user-attachments/assets/65146af6-a572-4e40-a1c4-3210029cdd41" />
<img width="1931" height="1769" alt="iris_correlation_heatmap" src="https://github.com/user-attachments/assets/557fa1a1-5d73-407d-914d-1d8c3816dd63" />
<img width="2967" height="1766" alt="iris_boxplots" src="https://github.com/user-attachments/assets/3284ea0f-ff77-49f3-b062-7daa66ff6984" />

---

### 🌼 Clustering
- **Method**: K-Means (k=3 optimal)
- **Metric**: Adjusted Rand Index = **0.73**
- **Findings**:
  - *Setosa* perfectly separated
  - Overlap between *Versicolor* and *Virginica*
  - Elbow method confirmed k=3

<img width="2371" height="1474" alt="elbow_curve" src="https://github.com/user-attachments/assets/e7af7761-4ad8-4c21-b4fb-ef5c1df06698" />
<img width="2541" height="1775" alt="cluster_visualization" src="https://github.com/user-attachments/assets/5d3e08ab-3629-4e6b-9e5e-ef9cf0b060bd" />

---

### 🤖 Classification and Association Rule Mining

#### Classification
- Models: **Decision Tree** & **KNN (k=5)**
- Accuracy: **96.67%** for both
- **Decision Tree**:
  - Higher confidence & stability in cross-validation
- **KNN**:
  - More cautious probability estimates — better for uncertainty handling

<img width="4171" height="1774" alt="decision_boundaries" src="https://github.com/user-attachments/assets/a19526eb-1828-4b8b-8a87-59ec0d552d78" />

#### Association Rule Mining
- **Data**: 30 synthetic grocery transactions
- **Algorithm**: Apriori (`min_support=0.2`, `min_confidence=0.5`)
- **Strongest Rule**: Potatoes → Cheese
  - Support: 20%
  - Confidence: 75%
  - Lift: 2.81
- **Recommendation**: Bundle/promote together

---

## ✅ Conclusion
This project demonstrates:
- **End-to-end Data Warehousing**: Design → ETL → OLAP
- **Data Mining Applications**: Preprocessing, Clustering, Classification, Association Rules
- **Actionable Insights** for business decision-making in sales optimization, inventory planning, and marketing.

---

## ▶️ How to Run the Code

### 1. **Clone the Repository**
```bash
git clone https://github.com/YourUsername/YourRepoName.git
cd YourRepoName
```

### 2. **Set Up the Environment**

It’s recommended to use a virtual environment:

python -m venv venv
source venv/bin/activate   For Linux/Mac
venv\Scripts\activate      For Windows

### 3. **Install Dependencies**

pip install -r requirements.txt

### 4. **Run Individual Tasks**

Data Warehousing Scripts

 - data_warehouse_design.sql → Open in any SQL tool and execute.

 - etl_pipeline.py → Runs extraction, transformation, and loading.

 - olap_queries.sql → Execute in database to get analysis results.

Data Mining Scripts

 - preprocessing_exploration.py → Prepares and visualizes dataset.

 - clustering.py → Runs K-Means clustering on the Iris dataset.

 - classification_and_association.py → Runs classification models and association rule mining.

### 5. **Outputs**

 - Data Warehousing → Database tables and OLAP query results in .csv or .png files.

 - Data Mining → Model metrics, plots (decision boundaries, elbow curves, etc.), and association rule tables.

 - Logs → Detailed process logs stored in logs/ folder for reproducibility.

---

Detailed reports of each task are found inside their respective directories.
