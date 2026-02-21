# Chapter 44: ROW_NUMBER — Study Guide

## 📘 What is ROW_NUMBER?

`ROW_NUMBER()` is a **window function** that assigns a unique sequential number to each row in a result set, based on a specified ordering.

- Evaluated after `FROM`, `WHERE`, and grouping
- Applied before final `ORDER BY` of the result output
- Each row gets a unique number (no ties)

---

# 🔹 Syntax

```
ROW_NUMBER()
OVER (
    [PARTITION BY value_expression [, ...]]
    ORDER BY sort_expression [ASC|DESC]
)
```

### Important Rules

- ✅ `ORDER BY` is required  
- 🔄 `PARTITION BY` is optional  
- Without partition → numbering continues globally  
- With partition → numbering restarts per group  

---

# 1️⃣ Row Numbers Without Partitions

```sql
SELECT
    ROW_NUMBER() OVER (ORDER BY Fname ASC) AS RowNumber,
    Fname,
    LName
FROM Employees;
```

### 💡 What Happens?

- Entire result set is sorted by `Fname`
- Rows are numbered starting at 1
- Numbering continues through all rows

---

# 2️⃣ Row Numbers With Partitions

```sql
SELECT
    ROW_NUMBER() OVER (
        PARTITION BY DepartmentId
        ORDER BY Fname ASC
    ) AS RowNumber,
    DepartmentId,
    Fname,
    LName
FROM Employees;
```

### 💡 What Happens?

- Rows grouped by `DepartmentId`
- Each department restarts numbering at 1
- Useful for ranking inside categories

✔️ Common for “Top N per group” problems

---

# 3️⃣ Practical Use Case: Removing Duplicates

Keep the newest record per Project.

```sql
WITH cte AS (
    SELECT ProjectID,
           ROW_NUMBER() OVER (
               PARTITION BY ProjectID
               ORDER BY InsertDate DESC
           ) AS rn
    FROM ProjectNotes
)
DELETE FROM cte
WHERE rn > 1;
```

### 💡 Logic

1. Partition rows by `ProjectID`
2. Order newest first (`InsertDate DESC`)
3. Newest record gets `rn = 1`
4. Delete everything where `rn > 1`

✔️ Removes duplicates while keeping latest record

---

# ⚡ Common Use Cases

| Use Case | Description |
|----------|------------|
| Pagination | Assign row numbers and filter range |
| Remove duplicates | Keep latest per group |
| Top-N per group | Rank rows inside partitions |
| Deduplication | Clean messy datasets |

---

# ⚠️ ROW_NUMBER vs RANK

| Function | Behavior |
|----------|----------|
| ROW_NUMBER() | Always unique numbers |
| RANK() | Skips numbers on ties |
| DENSE_RANK() | No gaps on ties |

---

# ⚡ Key Points Summary

| Concept | Summary |
|----------|----------|
| Window Function | Yes |
| ORDER BY | Required |
| PARTITION BY | Optional |
| Unique numbering | Always |
| Resets per group | When partitioned |
| Common Use | Analytics & deduplication |

---

# 🧠 Final Reminder

- `ROW_NUMBER()` does NOT remove duplicates by itself.
- It only assigns sequence numbers.
- You must filter (`WHERE rn > 1`) to act on duplicates.
- Very powerful in data cleaning and analytics queries.
