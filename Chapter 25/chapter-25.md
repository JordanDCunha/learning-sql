# Chapter 25 – SQL Aggregate Functions

Database Used: SQLite

---

# SUM()

Adds numeric values together.

## Basic SUM

```sql
SELECT SUM(salary) AS TotalSalary
FROM employees;
```

Returns one number representing the total salary.

---

## Grouped SUM

```sql
SELECT DepartmentId,
       SUM(salary) AS TotalSalary
FROM employees
GROUP BY DepartmentId;
```

Shows total salary per department.

---

## Conditional SUM (Using CASE)

```sql
SELECT customer,
       SUM(CASE WHEN payment_type='credit' THEN amount ELSE 0 END) AS credit,
       SUM(CASE WHEN payment_type='debit' THEN amount ELSE 0 END) AS debit
FROM payments
GROUP BY customer;
```

`CASE` works like an IF statement in SQL.

---

# AVG()

Returns the average of a numeric column.

```sql
SELECT AVG(age) AS AverageAge
FROM employees;
```

Useful for:
- Scores  
- Prices  
- Population  
- Revenue  

---

# COUNT()

## Count All Rows

```sql
SELECT COUNT(*) AS TotalRows
FROM employees;
```

Includes NULL rows.

---

## Count Non-NULL Values

```sql
SELECT COUNT(ManagerId) AS ManagerCount
FROM employees;
```

Skips NULL values.

---

## DISTINCT Count

```sql
SELECT COUNT(DISTINCT DepartmentId) AS UniqueDepartments
FROM employees;
```

Counts unique values only.

---

# MAX() / MIN()

```sql
SELECT MAX(age) AS OldestEmployee FROM employees;
SELECT MIN(age) AS YoungestEmployee FROM employees;
```

Used for:
- Highest salary  
- Earliest date  
- Maximum price  
- Minimum score  

---

# GROUP BY Rule

When using aggregate functions:

Every column in SELECT must either:

- Be inside an aggregate function  
- Or appear in GROUP BY  

Example:

```sql
SELECT DepartmentId, SUM(salary)
FROM employees
GROUP BY DepartmentId;
```

---

# List Concatenation (SQLite)

```sql
SELECT DepartmentId,
       GROUP_CONCAT(Name, ', ') AS EmployeeNames
FROM employees
GROUP BY DepartmentId;
```

Merges multiple row values into one string per group.

---

# Mental Model

Aggregate = summarize  

SUM → total  
AVG → average  
COUNT → how many  
MAX → biggest  
MIN → smallest  

GROUP BY → split into categories first
