# ✅ Chapter 40: ORDER BY — Study Guide

## 📘 Purpose

The `ORDER BY` clause is used to sort query results by one or more columns, either ascending (`ASC`) or descending (`DESC`).

- Default sort order: `ASC` (ascending)
- Can sort by:
  - Column name
  - Alias
  - Column number in the SELECT list

---

## ⚙️ Basic Sorting

### 🏷️ Example: Top 5 Users by Reputation (SQL Server)

```sql
-- Without ORDER BY (default sort by first column, Id)
SELECT TOP 5 DisplayName, Reputation
FROM Users;

-- With ORDER BY descending
SELECT TOP 5 DisplayName, Reputation
FROM Users
ORDER BY Reputation DESC;
