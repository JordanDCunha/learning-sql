# ✅ Chapter 63: WINDOW FUNCTIONS

## 📘 Definition

Window functions (also known as analytic functions) perform calculations across a set of rows that are related to the current row — without collapsing them into a single result.

They use the `OVER()` clause, which defines the “window” (the group of rows) the function operates over.

You can use them to:

- Count or sum over rows
- Find rankings, running totals, or previous values
- Compare rows within the same partition

---

## 📘 Basic Syntax

```sql
SELECT column1,
       window_function() OVER (
           PARTITION BY column
           ORDER BY column
       ) AS alias
FROM table_name;
```

- `PARTITION BY` → groups rows
- `ORDER BY` → defines calculation order
- `OVER()` → defines the window

---

# 🧩 Examples

---

## 1️⃣ Adding Total Row Count to Every Row

```sql
SELECT your_columns,
       COUNT(*) OVER() AS Ttl_Rows
FROM your_data_set;
```

### Explanation

- Counts total rows selected.
- Adds the total to every row.
- Avoids running two separate queries.

### Result Example

| id | name    | Ttl_Rows |
|----|---------|----------|
| 1  | example | 5        |
| 2  | foo     | 5        |
| 3  | bar     | 5        |
| 4  | baz     | 5        |
| 5  | quux    | 5        |

---

## 2️⃣ Flag Rows Sharing a Common Property

```sql
SELECT id, name, tag,
       COUNT(*) OVER (PARTITION BY tag) > 1 AS flag
FROM items;
```

### Explanation

- `PARTITION BY tag` groups rows by tag.
- Counts how many rows share the same tag.
- Flags rows where count > 1.

---

### Equivalent Without Window Functions

```sql
SELECT id, name, tag,
       (SELECT COUNT(tag)
        FROM items B
        WHERE tag = A.tag) > 1 AS flag
FROM items A;
```

---

## 3️⃣ Running Total

```sql
SELECT date, amount,
       SUM(amount) OVER (ORDER BY date ASC) AS running
FROM operations
ORDER BY date ASC;
```

### Explanation

- Orders rows by date.
- Computes cumulative sum.
- Very common in financial reports.

### Result Example

| date       | amount | running |
|------------|--------|---------|
| 2016-03-10 | -250   | -250    |
| 2016-03-11 | -50    | -300    |
| 2016-03-12 | 200    | -100    |
| 2016-03-14 | 100    | 0       |
| 2016-03-15 | 100    | 100     |

---

## 4️⃣ Top N Most Recent Rows per Group

```sql
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY User_ID
               ORDER BY Completion_Date DESC
           ) AS Row_Num
    FROM Data
)
SELECT *
FROM CTE
WHERE Row_Num <= 1;
```

### Explanation

- `ROW_NUMBER()` assigns ranking within each user.
- Used for "Top N per group" queries.
- Very common interview question.

---

## 5️⃣ Detect Out-of-Sequence Records Using LAG()

```sql
SELECT *
FROM (
    SELECT t.*,
           LAG(status) OVER (
               PARTITION BY id
               ORDER BY status_time
           ) AS prev_status
    FROM test t
) t1
WHERE status = 'THREE'
  AND prev_status != 'TWO';
```

### Explanation

- `LAG()` looks at previous row’s value.
- Detects skipped transitions (e.g., ONE → THREE).

---

### Equivalent Without LAG()

```sql
SELECT A.id, A.status, B.status AS prev_status,
       A.status_time, B.status_time AS prev_status_time
FROM Data A, Data B
WHERE A.id = B.id
  AND B.status_time = (
      SELECT MAX(status_time)
      FROM Data
      WHERE status_time < A.status_time
        AND id = A.id
  )
  AND A.status = 'THREE'
  AND NOT B.status = 'TWO';
```

---

# ⚙️ Key Window Functions

| Function | Description |
|----------|------------|
| `ROW_NUMBER()` | Assigns sequential numbers |
| `RANK()` / `DENSE_RANK()` | Ranking with or without gaps |
| `LAG()` / `LEAD()` | Access previous or next row |
| `SUM()` / `AVG()` / `COUNT()` OVER() | Aggregate across window |

---

# ⚙️ Key Takeaways

✅ Window functions do NOT collapse rows like GROUP BY.  
✅ `OVER()` defines the window.  
✅ `PARTITION BY` groups data logically.  
✅ Extremely powerful for analytics and reporting.  
🚀 Essential for advanced SQL and interviews.
