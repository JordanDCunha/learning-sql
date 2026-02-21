# Chapter 38: MERGE — Study Guide

## 📘 Purpose

The **MERGE** statement (also called **UPSERT**) lets you:

- Insert a new row if it doesn’t exist  
- Update an existing row if it does  
- Optionally delete rows  

It is an **atomic operation** — meaning the insert/update/delete happens in one single transaction, keeping data consistent and avoiding race conditions.

Especially useful when:

- Synchronizing two tables  
- Avoiding duplicate data  
- Performing bulk data reconciliation  

---

# ⚙️ General Syntax (SQL Server / Oracle)

```sql
MERGE INTO targetTable AS t
USING sourceTable AS s
ON t.PrimaryKey = s.PrimaryKey

WHEN MATCHED THEN
    UPDATE SET
        t.col1 = s.col1,
        t.col2 = s.col2

WHEN NOT MATCHED BY TARGET THEN
    INSERT (PrimaryKey, col1, col2)
    VALUES (s.PrimaryKey, s.col1, s.col2)

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
```

---

# 🧠 Clause Breakdown

| Clause | Description |
|--------|------------|
| `MERGE INTO target USING source` | Combines target table with source data |
| `ON t.PK = s.PK` | Defines how rows are matched |
| `WHEN MATCHED` | Executes when row exists in both tables |
| `WHEN NOT MATCHED BY TARGET` | Inserts rows missing in target |
| `WHEN NOT MATCHED BY SOURCE` | Deletes rows missing in source |

---

# 🧠 Example 1: Synchronize Target with Source

```sql
MERGE INTO targetTable t
USING sourceTable s
ON t.PKID = s.PKID

WHEN MATCHED AND NOT EXISTS (
    SELECT s.ColumnA, s.ColumnB, s.ColumnC
    INTERSECT
    SELECT t.ColumnA, t.ColumnB, t.ColumnC
)
THEN UPDATE SET
    t.ColumnA = s.ColumnA,
    t.ColumnB = s.ColumnB,
    t.ColumnC = s.ColumnC

WHEN NOT MATCHED BY TARGET
THEN INSERT (PKID, ColumnA, ColumnB, ColumnC)
VALUES (s.PKID, s.ColumnA, s.ColumnB, s.ColumnC)

WHEN NOT MATCHED BY SOURCE
THEN DELETE;
```

✅ Purpose:

- Updates only if data changed (using `INTERSECT`)
- Inserts missing rows
- Deletes obsolete rows
- Fully synchronizes two tables in one statement

---

# 🧮 Example 2: MySQL UPSERT (ON DUPLICATE KEY UPDATE)

```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(8),
    count INT,
    UNIQUE KEY name (name)
);

INSERT INTO users (name, count)
VALUES ('Joe', 1)
ON DUPLICATE KEY UPDATE count = count + 1;
```

### Step Explanation

| Step | Description |
|------|------------|
| `UNIQUE KEY name (name)` | Ensures each username appears once |
| `INSERT INTO users` | Attempts to insert new row |
| `ON DUPLICATE KEY UPDATE` | If exists, update instead |

✅ Keeps a running count of users with same name.

---

# 🧮 Example 3: PostgreSQL UPSERT (ON CONFLICT)

```sql
CREATE TABLE users (
    id SERIAL,
    name VARCHAR(8) UNIQUE,
    count INT
);

INSERT INTO users (name, count)
VALUES ('Joe', 1)
ON CONFLICT (name)
DO UPDATE SET count = users.count + 1;
```

✅ PostgreSQL equivalent of MySQL’s `ON DUPLICATE KEY UPDATE`.

---

# 🏢 DBMS Comparison

| DBMS | MERGE Equivalent | Example Keyword |
|------|------------------|----------------|
| SQL Server | MERGE | `MERGE INTO ... USING ...` |
| Oracle | MERGE | `MERGE INTO ... USING ...` |
| MySQL | UPSERT | `ON DUPLICATE KEY UPDATE` |
| PostgreSQL | UPSERT | `ON CONFLICT ... DO UPDATE` |

---

# 🧠 Key Takeaways

- MERGE combines INSERT, UPDATE, and DELETE.
- Ideal for table synchronization.
- Atomic operation improves data integrity.
- MySQL & PostgreSQL use UPSERT alternatives.
- Requires a unique key or primary key for matching.
