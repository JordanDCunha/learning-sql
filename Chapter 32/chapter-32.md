# Chapter 32 — Indexes

## 📌 What Is an Index?

A database index is like the index of a book:

It lists values (sorted)  
Each value points to a row  

It makes searching MUCH faster.

Indexes speed up:

- WHERE
- JOIN
- ORDER BY

---

## Tradeoffs

✅ Faster reads  
⚠ Slower writes (INSERT/UPDATE/DELETE must update index)  
⚠ Uses extra disk space  

---

# 🟦 Creating a Basic Index

```sql
CREATE INDEX ix_cars_employee_id
ON Cars (EmployeeID);
```

Speeds up:

```sql
SELECT * FROM Cars WHERE EmployeeID = 1;
```

---

# 🟩 Multi-Column Index

```sql
CREATE INDEX ix_cars_e_c_o_ids
ON Cars (EmployeeID, CarID, OwnerID);
```

## Important Rule

Only fully optimized if query starts with:

EmployeeID  

(Leading column rule)

---

# Example Using Index Efficiently

```sql
SELECT *
FROM Cars
WHERE EmployeeID = 1
ORDER BY CarID DESC;
```

---

# ⚠ Less Helpful Example

```sql
SELECT *
FROM Cars
WHERE OwnerID = 17
ORDER BY CarID DESC;
```

Index is less useful because query ignores first column.

---

# 🟦 Clustered Index

```sql
CREATE CLUSTERED INDEX ix_employees_name
ON Employees (Employee_Surname);
```

✔ Physically sorts table data  
✔ Great for range queries  
⚠ Only ONE per table  
⚠ Slows writes  

---

# 🟦 Non-Clustered Index

```sql
CREATE NONCLUSTERED INDEX ix_employees_name
ON Employees (Employee_Surname);
```

✔ Separate structure  
✔ Multiple allowed  
⚠ Extra lookup step  

---

# 🟦 Unique Index

```sql
CREATE UNIQUE INDEX uq_customers_email
ON Customers (Email);
```

✔ Prevents duplicate values  
✖ Insert/update fails if duplicate  

Adds data integrity constraint.

---

# 🟦 Sorted Index

```sql
CREATE INDEX ix_scoreboard_score
ON scoreboard (score DESC);
```

Makes this faster:

```sql
SELECT *
FROM scoreboard
ORDER BY score DESC;
```

---

# 🟦 Filtered / Partial Index

```sql
CREATE INDEX Started_Orders
ON orders(product_id)
WHERE order_state_id = 1;
```

✔ Only indexes specific rows  
✔ Smaller  
✔ Faster updates  

---

# 🔧 Rebuilding, Disabling, Dropping

Drop:

```sql
DROP INDEX ix_cars_employee_id;
```

Disable (SQL Server):

```sql
ALTER INDEX ix_cars_employee_id ON Cars DISABLE;
```

Rebuild:

```sql
ALTER INDEX ix_cars_employee_id ON Cars REBUILD;
```

---

# Performance Summary

| Operation | Improves | Hurts |
|-----------|----------|--------|
| Adding index | Read speed | Write speed + storage |
| Clustered index | Range queries | Only one per table |
| Unique index | Data integrity | Insert/update constraints |
| Multi-column index | Ordered conditions matching first column | Poor if first column ignored |

---

# 🧠 Mental Model

No index → Full table scan  
Index → Fast lookup  

More indexes → Faster reads  
Too many indexes → Slower writes  

Smart indexing = Balance.
