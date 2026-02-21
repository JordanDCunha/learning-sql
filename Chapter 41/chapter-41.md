# Chapter 41: Order of Execution — Study Guide

## 📘 Purpose

Understanding the **logical order of execution** in SQL is critical.

SQL is written in one order — but executed in another.

---

# ⚡ Logical Order of Execution

FROM → ON → JOIN → WHERE → GROUP BY → CUBE/ROLLUP  
→ HAVING → SELECT → DISTINCT → ORDER BY → TOP/LIMIT

---

# 🧠 Why This Matters

- `WHERE` filters **rows**
- `HAVING` filters **groups**
- `JOIN` happens before `WHERE`
- `DISTINCT` happens after `SELECT`
- `ORDER BY` does NOT change which rows exist — only their order
- Aggregations (`GROUP BY`, `CUBE`, `ROLLUP`) occur before `SELECT`

---

# 📊 Step-by-Step Logical Processing

| Step | Clause | Description | Virtual Table |
|------|--------|-------------|---------------|
| 1 | FROM | Perform joins / Cartesian product | VT1 |
| 2 | ON | Apply join conditions | VT2 |
| 3 | OUTER JOIN | Add unmatched rows (LEFT/RIGHT/FULL) | VT3 |
| 4 | WHERE | Filter individual rows | VT4 |
| 5 | GROUP BY | Form groups | VT5 |
| 6 | CUBE / ROLLUP | Add supergroups | VT6 |
| 7 | HAVING | Filter groups | VT7 |
| 8 | SELECT | Compute expressions | VT8 |
| 9 | DISTINCT | Remove duplicates | VT9 |
| 10 | ORDER BY | Sort rows | VC10 |
| 11 | TOP / LIMIT | Return final rows | VT11 |

---

# ⚙️ Example Query

```sql
SELECT DepartmentId, COUNT(*) AS EmpCount
FROM Employees
WHERE Salary > 500
GROUP BY DepartmentId
HAVING COUNT(*) > 3
ORDER BY EmpCount DESC;
```

---

# 🔎 How This Query Actually Executes

### Step 1 — FROM  
Load `Employees`

### Step 2 — WHERE  
Filter rows where `Salary > 500`

### Step 3 — GROUP BY  
Group remaining rows by `DepartmentId`

### Step 4 — HAVING  
Keep only groups where `COUNT(*) > 3`

### Step 5 — SELECT  
Compute `DepartmentId` and `COUNT(*)`

### Step 6 — ORDER BY  
Sort by `EmpCount DESC`

---

# ⚠️ Common Mistakes

## ❌ Using alias in WHERE

```sql
SELECT Salary * 12 AS AnnualSalary
FROM Employees
WHERE AnnualSalary > 50000;  -- ❌ Invalid
```

Reason: `WHERE` runs before `SELECT`.

---

## ✅ Correct Version

```sql
SELECT Salary * 12 AS AnnualSalary
FROM Employees
WHERE Salary * 12 > 50000;
```

---

# ⚙️ WHERE vs HAVING

```sql
-- WHERE filters rows
SELECT *
FROM Employees
WHERE Salary > 500;

-- HAVING filters groups
SELECT DepartmentId, COUNT(*)
FROM Employees
GROUP BY DepartmentId
HAVING COUNT(*) > 5;
```

---

# ⚡ Key Points Summary

| Concept | Summary |
|----------|----------|
| Written Order | SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY |
| Execution Order | FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY |
| WHERE | Filters rows |
| HAVING | Filters groups |
| JOIN | Happens before WHERE |
| DISTINCT | Happens after SELECT |
| ORDER BY | Happens near the end |
| TOP/LIMIT | Final step |

---

# 🧠 Final Reminder

Always remember:

- SQL execution order explains most syntax errors.
- If something “doesn’t exist yet,” it’s likely due to execution order.
- Think in terms of virtual tables (VT1 → VT11).
- Understand logic before memorizing syntax.
