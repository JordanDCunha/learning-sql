# ✅ Chapter 53 — Subqueries — Explained Simply

## 🧠 Concept Overview

A **subquery** (or *inner query*) is a query inside another query.

It helps you use the results of one query as input for another — kind of like a query nesting inside a parent query.

Subqueries are enclosed in parentheses `()` and can appear in:

- The `WHERE` clause (to filter results)
- The `FROM` clause (as a temporary table)
- The `SELECT` clause (as a calculated field)

---

## ⚙️ Key Rules

- Always enclosed in parentheses `()`.
- The number of columns returned must match what’s expected by the outer query.
- Subqueries in the `FROM` clause must be given a table alias (temporary name).
- Subqueries can be:
  - **Independent**
  - **Correlated** (dependent on the outer query)

---

# 💡 Types of Subqueries & Examples

---

## 1️⃣ Subquery in WHERE Clause

```sql
SELECT *
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);
```

**Explanation:**

- ✅ The inner query gets the highest salary.
- ✅ The outer query finds whoever matches that salary.

---

## 2️⃣ Subquery in FROM Clause

```sql
SELECT Managers.Id, Employees.Salary
FROM (
    SELECT Id
    FROM Employees
    WHERE ManagerId IS NULL
) AS Managers
JOIN Employees ON Managers.Id = Employees.Id;
```

**Explanation:**

You can treat a subquery as a temporary table.

🧩 The inner query creates a list of managers (`ManagerId IS NULL`).
The outer query then joins that list with the Employees table.

---

## 3️⃣ Subquery in SELECT Clause

```sql
SELECT
    Id,
    FName,
    LName,
    (SELECT COUNT(*) 
     FROM Cars 
     WHERE Cars.CustomerId = Customers.Id) AS NumberOfCars
FROM Customers;
```

**Explanation:**

🧮 For each customer, it counts how many cars they own.
This adds a calculated column using another table.

---

## 4️⃣ Subquery in FROM Clause with Filtering

```sql
SELECT *
FROM (
    SELECT city, temp_hi - temp_lo AS temp_var 
    FROM weather
) AS w
WHERE temp_var > 20;
```

**Explanation:**

Create a virtual table first, then filter.

💬 This gets all cities where the temperature difference is more than 20.

---

## 5️⃣ Subquery in WHERE Clause (Comparing with Aggregate)

```sql
SELECT name, pop2000
FROM cities
WHERE pop2000 < (SELECT AVG(pop2000) FROM cities);
```

**Explanation:**

🧠 Compares each city’s population to the average population.
✅ Returns only cities below average.

---

## 6️⃣ Subquery in SELECT Clause (Joining without JOIN)

```sql
SELECT 
    w.*, 
    (SELECT c.state 
     FROM cities AS c 
     WHERE c.name = w.city) AS state
FROM weather AS w;
```

📍 For each row in `weather`, it looks up the corresponding state in `cities`.

---

## 7️⃣ Filtering Results Using Another Table

```sql
SELECT *
FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Supervisors);
```

Find all employees not listed in the Supervisors table.

### Equivalent LEFT JOIN version

```sql
SELECT *
FROM Employees AS e
LEFT JOIN Supervisors AS s 
    ON s.EmployeeID = e.EmployeeID
WHERE s.EmployeeID IS NULL;
```

🚫 The NULL check filters out employees who don’t have supervisor records.

---

## 8️⃣ Correlated Subqueries

```sql
SELECT EmployeeId
FROM Employee AS eOuter
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee AS eInner
    WHERE eInner.DepartmentId = eOuter.DepartmentId
);
```

**Explanation:**

A correlated subquery references the outer query’s current row.

📊 For each department, this finds employees who earn above their department’s average.

---

# 🔍 When to Use Each

| Type | Use Case |
|------|----------|
| WHERE Subquery | Filter based on results of another query |
| FROM Subquery | Create a temporary derived table |
| SELECT Subquery | Add a calculated or lookup value |
| Correlated Subquery | Compare each row to group-level or related data |

---

# 🧱 Summary

Subqueries are powerful for filtering, comparison, and inline calculations.

- Always enclose them in `()`.
- Use aliases in `FROM` subqueries.
- Prefer `JOIN`s when subqueries get too complex — they’re often faster and clearer.
- Correlated subqueries run once per row, so be mindful of performance.

---
