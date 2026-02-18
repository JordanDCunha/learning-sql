# Chapter 25: SQL Aggregate Functions

Aggregate functions perform calculations on multiple rows and return a single result.

They are commonly used with `GROUP BY`.

---

# 📌 SUM()

```sql
SELECT SUM(salary) AS TotalSalary
FROM employees;
