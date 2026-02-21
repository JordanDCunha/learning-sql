# ✅ CHAPTER 45 — SELECT (Simplified Breakdown)

---

## 📌 What SELECT Does

`SELECT` decides which data (columns + rows) you want from the database.

You almost always pair it with:

- `FROM` — which table(s) the data comes from  
- Optional filters + sorting like `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`

---

## ✅ SELECT Syntax (Full Form)

```sql
SELECT [DISTINCT] column1, column2, ...
FROM table
[WHERE condition]
[GROUP BY column(s)]
[HAVING condition]
[ORDER BY column ASC|DESC];
```

---

## ✅ Selecting Columns

```sql
SELECT Name, SerialNumber
FROM ArmyInfo;
```

✨ Only returns those two columns.

---

## ✅ Select EVERYTHING

```sql
SELECT *
FROM ArmyInfo;
```

⚠️ Avoid `*` in real apps — it hurts performance and can break if tables change.

✅ Use `*` only for:
- Quick debugging
- Exploring data
- `COUNT(*)` — since it doesn’t return column data

---

## ✅ Selecting with Multiple Tables

```sql
SELECT Employees.*, Departments.Name
FROM Employees
JOIN Departments ON Departments.Id = Employees.DeptId;
```

Meaning:
- Return ALL columns from `Employees`
- PLUS only the `Name` column from `Departments`

---

## ✅ Filter Rows (WHERE)

```sql
SELECT * 
FROM Cars 
WHERE status = 'READY';
```

Operators you can use:

- Comparisons: `=, <, >, <>, <=`
- Logic: `AND, OR, NOT`
- Pattern: `LIKE`
- Range: `BETWEEN`
- Lists: `IN`
- NULL: `IS NULL, IS NOT NULL`

Example:

```sql
SELECT Name
FROM Customers
WHERE PhoneNumber IS NULL;
```

---

## ✅ Selecting From Multiple Tables + Aliases

```sql
SELECT c.Email, o.Id AS OrderId
FROM Customers c
LEFT JOIN Orders o ON o.CustomerId = c.Id;
```

📌 Notes:
- After aliasing `Customers` as `c`, you must refer to it as `c`
- `AS OrderId` renames the output column

---

## ✅ Column Aliases (Renaming Columns)

```sql
SELECT 
 FName AS "First Name",
 LName AS "Last Name"
FROM Employees;
```

You can also skip `AS`:

```sql
SELECT FName "First Name"
FROM Employees;
```

---

## ✅ Sorting Results (ORDER BY)

```sql
SELECT * 
FROM Employees 
ORDER BY LName;
```

Descending:

```sql
ORDER BY LName DESC;
```

Sort by multiple columns:

```sql
ORDER BY LName ASC, FName ASC;
```

Sort by column index:

```sql
ORDER BY 3;
```

---

## ✅ Selecting the Top Rows (LIMIT)

```sql
SELECT Id, ProductName
FROM Product
ORDER BY UnitPrice DESC
LIMIT 10;
```

---

## ✅ CASE (Conditional Logic Inside SELECT)

```sql
SELECT
CASE 
    WHEN Salary < 50000 THEN 'Low'
    WHEN Salary < 100000 THEN 'Medium'
    ELSE 'High'
END AS SalaryRange
FROM Employees;
```

---

## 📊 Common Aggregate Functions

| Function | What it does |
|----------|-------------|
| `AVG()`  | Average |
| `MIN()`  | Minimum |
| `MAX()`  | Maximum |
| `SUM()`  | Sum |
| `COUNT()`| Count rows |
