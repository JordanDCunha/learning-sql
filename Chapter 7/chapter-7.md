# Chapter 7 – SQL Comments

Database Used: SQLite

---

# 1. Single-Line Comments

Single-line comments begin with `--`  
They continue until the end of the line.

Example:

```sql
SELECT *
FROM Employees -- this is a comment
WHERE FName = 'John';
```

Everything after `--` on that line is ignored by SQL.

---

# 2. Multi-Line Comments

Multi-line comments are wrapped inside:

```sql
/* comment */
```

Example:

```sql
/* This query
returns all employees */
SELECT *
FROM Employees;
```

Everything inside `/* ... */` is ignored by the database engine.

---

# Why Comments Matter

- Explain complex logic
- Temporarily disable code
- Improve maintainability
- Help future developers (including yourself)

---

# Best Practice

Use comments to explain:

- Why something is done (not what it does)
- Complex business logic
- Workarounds or constraints

Avoid obvious comments like:

```sql
-- Select all employees
SELECT * FROM Employees;
```

Instead explain intent:

```sql
-- Filtering to active employees for payroll processing
SELECT *
FROM Employees
WHERE IsActive = 1;
```
