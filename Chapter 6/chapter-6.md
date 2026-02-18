# Chapter 6 – Joins & SQL Best Practices

Database Used: SQLite

---

# 1. Always Use Explicit Joins

Good:

```sql
SELECT *
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.ID;
```

Avoid implicit joins:

```sql
SELECT *
FROM Employees, Departments
WHERE Employees.DepartmentID = Departments.ID;
```

Why?

- Easier to read
- Reduces logical mistakes
- Required for OUTER JOINs

---

# 2. Naming Conventions

## CamelCase

```sql
SELECT FirstName, LastName
FROM Employees;
```

## snake_case

```sql
SELECT first_name, last_name
FROM employees;
```

### Guidelines

- Names should clearly describe content
- Columns → usually singular (employee_id)
- Tables → often plural (employees)
- Avoid tbl_, col_ prefixes
- Use prefixes only to avoid keyword conflicts

---

# 3. Avoid SELECT *

Bad:

```sql
SELECT * FROM employees;
```

Better:

```sql
SELECT ID, FName, LName
FROM Employees;
```

Why avoid `SELECT *`?

- Returns unnecessary columns
- Breaks when schema changes
- Increases I/O
- Reduces clarity

---

# 4. Formatting & Indentation

Bad:

```sql
SELECT d.Name, COUNT(*) AS Employees FROM Departments AS d JOIN Employees AS e ON d.ID = e.DepartmentID WHERE d.Name != 'HR' HAVING COUNT(*) > 10 ORDER BY COUNT(*) DESC;
```

Good:

```sql
SELECT d.Name,
       COUNT(*) AS Employees
FROM Departments AS d
JOIN Employees AS e
    ON d.ID = e.DepartmentID
WHERE d.Name != 'HR'
GROUP BY d.Name
HAVING COUNT(*) > 10
ORDER BY Employees DESC;
```

---

# 5. Align Conditions

```sql
SELECT Model,
       EmployeeID
FROM Cars
WHERE CustomerID = 42
  AND Status     = 'READY';
```

Improves readability.

---

# 6. USING Clause

```sql
SELECT RecipeID,
       Recipes.Name,
       COUNT(*) AS NumberOfIngredients
FROM Recipes
LEFT JOIN Ingredients USING (RecipeID);
```

Benefits:

- Removes duplicate join columns
- Cleaner syntax
- More readable

---

# Key Takeaways

- Use explicit JOIN ... ON
- Avoid SELECT *
- Format your queries cleanly
- Use meaningful names
- Align conditions for readability
