# ✅ Chapter 49 — SQL GROUP BY vs DISTINCT (Study Guide)

---

# 🎯 What is DISTINCT?

`DISTINCT` removes duplicate rows from a query result.

📌 Use it when you only care about **unique values** — no calculations.

### Example purposes:

- “Show me every unique store and customer pair”
- “List unique products sold”
- “Show unique job titles”

---

# 🎯 What is GROUP BY?

`GROUP BY` groups rows that share the same value, then performs calculations using aggregate functions like:

- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`

📌 Use it when you want **summary statistics per group**.

### Example purposes:

- “How many orders per store?”
- “First and last purchase date per user?”
- “Average order value per product?”

---

# 📊 Aggregate Functions

| Function | What it calculates |
|----------|-------------------|
| `COUNT()` | Number of rows |
| `SUM()`   | Total |
| `AVG()`   | Average |
| `MIN()`   | Earliest / smallest |
| `MAX()`   | Latest / largest |

---

# 🧠 Memory Trick

| Concept | Meaning |
|----------|----------|
| DISTINCT | “Just show me unique values.” |
| GROUP BY | “Group values and calculate about each group.” |

---

# 📋 Feature Comparison

| Feature | DISTINCT | GROUP BY |
|----------|----------|-----------|
| Removes duplicates | ✅ Yes | ✅ Yes |
| Allows aggregates (COUNT, AVG, etc.) | ❌ No | ✅ Yes |
| Shows grouped summaries | ❌ | ✅ |
| Usage | Simple uniqueness | Analytical results |

---

# 🧩 Example Queries

### DISTINCT Example

```sql
SELECT DISTINCT storeName, userId
FROM Orders;
```

👉 Answers:  
Which store-user combinations exist?

---

### GROUP BY Example

```sql
SELECT storeName,
       COUNT(*) AS TotalOrders,
       AVG(orderValue) AS AvgOrderValue
FROM Orders
GROUP BY storeName;
```

👉 Answers:  
How many orders and what’s the average per store?
