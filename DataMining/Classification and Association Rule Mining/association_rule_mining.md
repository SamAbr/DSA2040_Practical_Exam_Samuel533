# 🛒 Association Rule Mining — Findings & Methodology

## 📌 Objective
The goal of this task was to **generate synthetic transactional data** and apply **Association Rule Mining** to uncover frequent item co-occurrences that can inform retail decision-making.

---

## ⚙️ Methodology

### 1. **Data Generation**
- Created **30 synthetic transactions**.
- Each transaction contained **3–8 items**, randomly selected from a pool of 20 grocery items (e.g., milk, bread, cheese, potatoes, chicken, rice, etc.).
- Added **predefined patterns** (e.g., milk-bread-butter, rice-chicken) to simulate realistic co-occurrence trends.
- Used Python’s `random` module for random sampling.

### 2. **Data Preparation**
- Transformed transactions into **one-hot encoded format** using `pandas` for compatibility with the Apriori algorithm.
- Each column represents an item; rows indicate whether the item was purchased (`1`) or not (`0`).

### 3. **Association Rule Mining**
- Applied the **Apriori algorithm** (`mlxtend.frequent_patterns.apriori`) with:
  - `min_support = 0.2` → Itemsets must appear in at least 20% of transactions.
- Generated **association rules** using:
  - `metric = "confidence"`
  - `min_threshold = 0.5` → Rules must be correct at least 50% of the time.
- Sorted rules by **lift** to identify the strongest associations.

---

## 📊 Results

**Top 5 Rules (sorted by Lift):**

| Antecedents | Consequents | Support | Confidence | Lift  |
|-------------|-------------|---------|------------|-------|
| potatoes    | cheese      | 0.20    | 0.75       | 2.8125|
| cheese      | potatoes    | 0.20    | 0.75       | 2.8125|
| chicken     | rice        | 0.20    | 0.6667     | 2.0000|
| rice        | chicken     | 0.20    | 0.6000     | 2.0000|
| bread       | milk        | 0.20    | 0.6000     | 1.8000|

---

## 💡 Key Insight
**Rule Example:**  
Customers who buy **potatoes** often also buy **cheese**.

- **Support:** 20% of transactions contain both items.
- **Confidence:** When potatoes are purchased, cheese is also bought 75% of the time.
- **Lift:** 2.81 — The likelihood of buying cheese increases by **181%** when potatoes are purchased, compared to buying cheese randomly.

**Business Implication:**  
- Place potatoes and cheese closer together in-store.
- Consider bundling them in promotions to increase cross-selling.

---

## 🖥️ Implementation Notes
- The task was implemented in Python with detailed **logging** at each step:
  - Data generation
  - One-hot encoding
  - Apriori execution
  - Rule extraction & sorting
  - Insight analysis
- This ensures **transparency** and **reproducibility** of results.

---

## ✅ Conclusion
Association Rule Mining successfully identified strong product relationships in our simulated dataset.  
The discovered rules — particularly the potatoes-cheese connection — can directly inform **store layout optimization** and **targeted promotions**, ultimately enhancing sales opportunities.
