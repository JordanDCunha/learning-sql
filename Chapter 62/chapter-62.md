# ✅ Chapter 62: VIEWS

## 📘 Definition

A **view** is a virtual table based on the result of an SQL query.

It does **not store data itself** — instead, it displays data stored in other tables.

Views are used to:

- Simplify complex queries  
- Restrict access to specific data  
- Present data in a consistent, reusable format  

---

## 📘 Basic Syntax

```sql
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

The `CREATE VIEW` statement defines a reusable query.

💡 Once created, you can query a view just like a normal table.

---

# 🧩 Examples

---

## 1️⃣ Simple View  
**Example Table: Employees**

```sql
CREATE VIEW new_employees_details AS
SELECT E.Id, FName, Salary, Hire_Date
FROM Employees E
WHERE Hire_Date > '2015-01-01';
```

### Explanation

- Filters rows (employees hired after Jan 1, 2015)  
- Selects only specific columns  
- Creates a reusable query  

---

### Selecting From the View

```sql
SELECT * FROM new_employees_details;
```

### Result Example

| Id | FName     | Salary | Hire_Date  |
|----|-----------|--------|------------|
| 4  | Johnathon | 500    | 2016-07-24 |

💡 A view can be used just like a table in `SELECT` statements.

---

## 2️⃣ Complex View (JOIN + Aggregation)

```sql
CREATE VIEW dept_income AS
SELECT 
    d.Name AS DepartmentName,
    SUM(e.Salary) AS TotalSalary
FROM Employees e
JOIN Departments d 
    ON e.DepartmentId = d.Id
GROUP BY d.Name;
```

### Explanation

- Uses `JOIN`
- Uses aggregation (`SUM`)
- Uses `GROUP BY`
- Simplifies analytical queries

---

### Querying the Complex View

```sql
SELECT * FROM dept_income;
```

### Result Example

| DepartmentName | TotalSalary |
|----------------|------------|
| HR             | 1900       |
| Sales          | 600        |

💡 Complex views prevent rewriting long joins repeatedly.

---

# 3️⃣ Modifying a View

### SQL Server

```sql
ALTER VIEW new_employees_details AS
SELECT Id, FName, Salary
FROM Employees
WHERE Hire_Date > '2018-01-01';
```

---

### PostgreSQL / MySQL / Oracle

```sql
CREATE OR REPLACE VIEW new_employees_details AS
SELECT Id, FName, Salary, Hire_Date
FROM Employees
WHERE Hire_Date > '2015-01-01';
```

### Explanation

- `ALTER VIEW` modifies an existing view (SQL Server).
- `CREATE OR REPLACE VIEW` replaces it if it already exists.

---

# 4️⃣ Updating Through a View

You can update data through a view **only if it is a simple view**.

```sql
UPDATE new_employees_details
SET Salary = Salary + 100
WHERE Id = 4;
```

### Conditions for Updatable Views

- Must reference **one table**
- Cannot contain `GROUP BY`
- Cannot contain `DISTINCT`
- Cannot contain aggregate functions (`SUM`, `AVG`, etc.)

🚫 Complex views are usually not updatable.

---

# 5️⃣ Dropping a View

```sql
DROP VIEW new_employees_details;
```

Deletes the view definition (does NOT delete underlying table data).

---

# 🔐 Using Views for Security

You can hide sensitive columns:

```sql
CREATE VIEW employee_public_info AS
SELECT Id, FName, Hire_Date
FROM Employees;
```

Instead of giving users access to the full table, grant them access to the view.

💡 This prevents exposure of confidential columns like `Salary`.

---

# ⚙️ Key Takeaways

✅ Views are virtual tables (they store query definitions, not data).  
✅ They simplify complex SQL.  
✅ They improve security by hiding sensitive columns.  
✅ Simple views can sometimes be updated.  
🚫 Complex views (JOIN + GROUP BY) are typically read-only.  
