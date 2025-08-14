## 📊 Model Comparison: Accuracy & Performance Metrics

We evaluated both models on the test set using key classification metrics:  

| Model          | Accuracy  | Precision | Recall   | F1-Score |
|----------------|-----------|-----------|----------|----------|
| Decision Tree  | 0.966667  | 0.969697  | 0.966667 | 0.966583 |
| KNN (k=5)      | 0.966667  | 0.969697  | 0.966667 | 0.966583 |

Both models achieve **identical performance across all metrics**, reflecting the clean separability of the Iris dataset. This makes secondary evaluation criteria like **confidence, robustness, and stability** essential for choosing between them.

---

## 🔎 Prediction Confidence: Who Believes in Their Answer?

Even though both models achieved **perfect predictions**, their **certainty levels** told a different story:  

- **Decision Tree**: Average confidence = **0.981**  
- **KNN (k=5)**: Average confidence = **0.953**  

The Decision Tree’s high confidence stems from its rigid, rule-based splits — once a sample reaches a leaf node, the model is almost certain of its class.  

KNN, in contrast, bases its confidence on neighbor agreement. If nearby points belong to mixed classes, it shows **moderate certainty** — a more cautious approach that naturally reflects boundary uncertainty.  

💡 **Takeaway**: Decision Trees can be **overconfident**, while KNN tends to provide **more realistic probability estimates**. In domains like **risk assessment**, KNN’s probabilities may be more trustworthy, even when raw accuracy matches.

---

## 🌪️ Robustness to Noise: Can They Handle Messy Data?

To mimic real-world imperfections (e.g., sensor drift, typos), we added small Gaussian noise to the test set and compared performance:  

| Model          | Accuracy (Clean) | Accuracy (Noisy) |
|----------------|------------------|------------------|
| Decision Tree  | 1.000            | 0.933            |
| KNN (k=5)      | 1.000            | 0.933            |

Both models experienced the same drop to **93.3% accuracy**, suggesting:  
- The Iris dataset is inherently robust to mild disturbances.  
- Under light noise, neither model shows a clear resilience advantage.  

While Decision Trees are often more sensitive to minor input changes (due to hard splits), the noise level here wasn’t enough to expose that weakness.  

💡 **Takeaway**: For **slightly noisy data**, both models generalize well — but in higher-noise conditions, additional stress-testing is essential.

---

## 🔄 Cross-Validation: Consistency Across Splits

To assess stability, we ran **5-fold cross-validation** and compared average accuracy and variance:  

| Model          | CV Accuracy | Std Dev |
|----------------|-------------|---------|
| Decision Tree  | **0.973**   | **0.025** |
| KNN (k=5)      | 0.960       | 0.033     |

**Key observations:**  
- **Decision Tree** not only scores higher on average but also shows **lower variability**, meaning it’s more consistent across different train/test splits.  
- KNN’s higher variance likely comes from sensitivity to small neighbor changes, especially near the *versicolor–virginica* boundary.  

💡 **Takeaway**: In scenarios where **predictive stability is crucial** — like automated classification systems — the Decision Tree is the safer bet.

### Decision Boundaries

<img width="4171" height="1774" alt="decision_boundaries" src="https://github.com/user-attachments/assets/cb9c92c2-a752-49d9-b7ad-e4608e54dbb2" />


---

## 📌 Conclusion

Both models perform exceptionally well on the Iris dataset, but their strengths differ:  

- **Decision Tree** excels in **confidence, stability, and interpretability**, making it ideal when consistent, explainable decisions are required.  
- **KNN** offers **more cautious probability estimates**, which may be preferable in high-risk decision-making where uncertainty must be accurately reflected.  

In this case, the Decision Tree edges ahead as the **better all-round choice**, especially for deployment in consistent, low-noise environments. However, if probability calibration matters more than raw accuracy, KNN remains a valuable alternative.

