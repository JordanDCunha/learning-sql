# Chapter 14 – DELETE

---

# Introduction

The DELETE statement removes records from a table.

Syntax:

DELETE FROM TableName
[WHERE condition]
[LIMIT count];

If WHERE is omitted → all rows are deleted.

---

# 1. Delete Certain Rows

DELETE FROM Employees
WHERE FName = 'John';

Only rows matching the condition are removed.

Always use WHERE unless you truly want all rows removed.

---

# 2. Delete All Rows

DELETE FROM Employees;

Removes all records but keeps:

- Table structure
- Constraints
- Indexes

---

# TRUNCATE vs DELETE

SQL Server / MySQL support:

TRUNCATE TABLE Employees;

Differences:

TRUNCATE:
- Faster
- Resets identity values
- Minimal logging
- Cannot use WHERE

DELETE:
- Can filter with WHERE
- Logs row-by-row
- Triggers fire

Important:
SQLite does NOT support TRUNCATE.

To reset auto-increment in SQLite:

DELETE FROM Employees;
DELETE FROM sqlite_sequence WHERE name='Employees';

---

# DELETE Using EXISTS

DELETE FROM Employees
WHERE EXISTS (
    SELECT 1
    FROM Target
    WHERE Employees.ID = Target.ID
);

Deletes rows that match another table.

---

# DELETE Using NOT EXISTS

DELETE FROM Employees
WHERE NOT EXISTS (
    SELECT 1
    FROM Target
    WHERE Employees.ID = Target.ID
);

Deletes rows that do NOT have a match.

---

# DELETE with JOIN

Some databases allow:

DELETE e
FROM Employees e
JOIN Target t ON e.ID = t.ID;

SQLite does NOT support this syntax directly.

Instead use EXISTS or IN.

---

# Important Warning

DELETE is permanent.

Best practices:

- Always test with SELECT first
- Use transactions when possible:

BEGIN TRANSACTION;
DELETE ...
ROLLBACK;  -- if mistake
COMMIT;    -- if correct

---

# Mental Model

DELETE modifies data.
It does not modify structure.
It removes rows, not tables.
