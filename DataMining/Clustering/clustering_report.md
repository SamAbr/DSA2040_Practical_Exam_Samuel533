# 🧩 Data Mining Task 2: Clustering Analysis

## 🌼 Dataset Used
The **Iris dataset** from `scikit-learn` (`from sklearn.datasets import load_iris`) was used for this clustering task. This real-world dataset contains 150 samples of iris flowers, each with four morphological features:
- Sepal length (cm)
- Sepal width (cm)
- Petal length (cm)
- Petal width (cm)

The target variable is the species: *setosa*, *versicolor*, or *virginica*. While clustering is unsupervised, the true labels were used **only for evaluation** (not during training), to assess how well K-Means discovered the natural groupings.

## 🔍 Clustering Implementation

### 1. **K-Means with k=3**
- K-Means clustering was applied using all four scaled features (Min-Max normalized in Task 1).
- The model was fitted with `k=3` to match the three known species.
- Predicted clusters were compared to true labels using the **Adjusted Rand Index (ARI)**.
- ✅ **ARI = 0.73** — indicating strong agreement between predicted clusters and actual species.

### 2. **Experimentation with k=2 and k=4**
- Models were also trained with `k=2` and `k=4`.
- ARI scores were lower than k=3, confirming that three clusters best fit the data structure.
- **Elbow curve** analysis (inertia vs. k) showed a clear bend at k=3, further justifying the optimal number of clusters.

## 🖼️ Visualizations

Three key visualizations were generated and saved as high-resolution images:

- **`elbow_curve.png`**:  
  Shows the within-cluster sum of squares (inertia) for k=1 to 10. The "elbow" at k=3 supports the choice of three clusters.
 <img width="2371" height="1474" alt="elbow_curve" src="https://github.com/user-attachments/assets/9e9842c5-6c20-441e-80fc-c49e8e66ed8e" />


- **`cluster_visualization.png`**:  
  Scatter plot of petal length vs. petal width, colored by predicted cluster. K-Means cleanly separates *setosa* but shows some overlap between *versicolor* and *virginica*, reflecting their biological similarity.
  <img width="2541" height="1775" alt="cluster_visualization" src="https://github.com/user-attachments/assets/72453072-fc4d-48dc-88b5-1fff3848ff15" />


- **`true_species_comparison.png`**:  
  Same plot with true species labels — used for qualitative comparison.
<img width="2542" height="1775" alt="true_species_comparison" src="https://github.com/user-attachments/assets/60957f68-9e17-4f29-af9f-957300a43690" />

## 💡 Analysis and Insights

K-Means performed well in identifying the natural groupings in the Iris dataset. The high ARI score confirms that the algorithm successfully recovered species-like clusters without using labels. Misclassifications occurred mainly between *versicolor* and *virginica*, which have overlapping feature distributions — a known challenge in this dataset.

In real-world applications like **customer segmentation**, **market basket analysis**, or **image grouping**, such clustering helps uncover hidden patterns in unlabeled data. Since we used the original Iris dataset (not synthetic), the results are realistic and biologically meaningful.


## ✅ Conclusion
K-Means clustering effectively identified the underlying structure of the Iris dataset. The combination of ARI evaluation, elbow analysis, and visualization confirms that k=3 is optimal. This task demonstrates the power of unsupervised learning in exploratory data analysis and pattern discovery.
