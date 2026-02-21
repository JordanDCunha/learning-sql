# ✅ Chapter 48 — SQL CURSOR (Study Guide Format)

---

## 🎯 What is a Cursor?

A **cursor** is a SQL object that allows you to process query results **one row at a time**.

Think of it like a loop in programming that walks through a result set row-by-row.

---

## 🧩 Variables Used with Cursors

```sql
DECLARE @columnName NVARCHAR(255);
```

You must declare variables to store each fetched row.

Each `FETCH NEXT` assigns values into these variables.

---

## ⚙️ Status Checking

```sql
WHILE @@FETCH_STATUS = 0
```

Cursor loops use `@@FETCH_STATUS`.

Meaning:

- `0`  → Fetch successful  
- `-1` → No more rows  
- `-2` → Fetch failed  

---

# 🛠 Basic Cursor Example (SQL Server)

```sql
DECLARE @Name NVARCHAR(100);

DECLARE employee_cursor CURSOR FOR
SELECT Name FROM Employees;

OPEN employee_cursor;

FETCH NEXT FROM employee_cursor INTO @Name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @Name;

    FETCH NEXT FROM employee_cursor INTO @Name;
END;

CLOSE employee_cursor;
DEALLOCATE employee_cursor;
```

---

# 🧠 Dynamic SQL + Nested Cursors (Concept)

This chapter’s advanced example demonstrates:

### 1️⃣ Outer Cursor
Loops through each database on the server.

### 2️⃣ Dynamic SQL
Builds a query dynamically to switch database context.

### 3️⃣ Inner Cursor
Loops through all tables and columns inside each database.

---

## 🔍 Main Learning Point

A cursor only works within the **current database context**.

If you need to loop across multiple databases, you must use **dynamic SQL** to change context.

---

# 📊 Cursor Support by Database

| Database | Cursor Support |
|-----------|---------------|
| SQL Server | ✅ Fully supported (most common use) |
| Oracle | ✅ Supported (different syntax) |
| MySQL | ✅ Supported but rarely used |
| PostgreSQL | ✅ Supported mostly inside functions |
| SQLite | 🚫 No traditional cursor — handled programmatically |

---

# ⚠️ Important Note

Cursors are powerful but often slow.

In most cases, try to use:

- `JOIN`
- `GROUP BY`
- Window functions
- Set-based operations

Instead of row-by-row processing.
