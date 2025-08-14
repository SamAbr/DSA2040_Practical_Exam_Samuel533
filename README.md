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

![schema_diagram.png](attachment:42101868-94eb-40ba-9617-4f52361e87bd.png)

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

 ![top_countries_bar.png](attachment:f508f44a-1638-42c1-90fb-b13add980317.png) 
 ![monthly_sales_trend.png](attachment:5f2b2612-4661-45c7-8d32-28575670a333.png)
 ![sales_by_quarter.png](attachment:f245f4b5-b577-4866-9b26-6bfac139ff57.png)

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

![iris_pairplot.png](attachment:5ad254ab-9105-431a-b5b2-0873324f01cd.png)
![iris_correlation_heatmap.png](attachment:beb6400f-5f1a-43bc-9c3f-dc4e76c041a4.png)  
![iris_boxplots.png](attachment:bf52ae6b-03ce-47d6-a6f6-41635aa6eb45.png)

---

### 🌼 Clustering
- **Method**: K-Means (k=3 optimal)
- **Metric**: Adjusted Rand Index = **0.73**
- **Findings**:
  - *Setosa* perfectly separated
  - Overlap between *Versicolor* and *Virginica*
  - Elbow method confirmed k=3

![elbow_curve.png](attachment:035b0d6b-543c-43ba-990d-5ee5f6a3a205.png)  
![cluster_visualization.png](attachment:cae63cee-7004-4be4-b3e7-4c5bc79b530b.png)

---

### 🤖 Classification and Association Rule Mining

#### Classification
- Models: **Decision Tree** & **KNN (k=5)**
- Accuracy: **96.67%** for both
- **Decision Tree**:
  - Higher confidence & stability in cross-validation
- **KNN**:
  - More cautious probability estimates — better for uncertainty handling

📌 ![decision_boundaries.png](attachment:ed236624-4956-4ec0-b5e0-fcf0f1aab5f1.png)

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