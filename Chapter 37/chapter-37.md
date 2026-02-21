# Chapter 37: Materialized Views — Study Guide

## 📘 Purpose

A **Materialized View** is a database object that stores the result of a query physically (unlike a normal view, which is virtual).

It improves performance for complex or time-consuming queries, as results can be queried directly without re-executing the base query each time.

However, since data is stored, it can become outdated — so it must be refreshed to remain current.

---

# 🧩 Key Characteristics

| Concept | Description |
|----------|------------|
| Definition | A view whose result set is stored on disk |
| Performance Benefit | Faster access to precomputed results |
| Data Freshness | Must be refreshed periodically |
| Use Case | Expensive queries where real-time accuracy is not required |
| Storage | Physically stored like a table |

---

# 🧠 When to Use

✅ Use Materialized Views when:

- Query results take a long time to compute  
- Real-time updates aren’t necessary  
- You need summary tables, aggregations, or pre-joined data for reporting  

🚫 Avoid when:

- You need real-time, always up-to-date results  
- Your underlying data changes very frequently  

---

# ⚙️ General Syntax (PostgreSQL / Oracle)

```sql
CREATE MATERIALIZED VIEW view_name AS
SELECT ...
FROM ...
WHERE ...;

-- Refresh manually
REFRESH MATERIALIZED VIEW view_name;
```

---

# 🧩 PostgreSQL Example

```sql
-- Create a base table
CREATE TABLE mytable (
    number INT
);

-- Insert data
INSERT INTO mytable VALUES (1);

-- Create materialized view
CREATE MATERIALIZED VIEW myview AS
SELECT * FROM mytable;

-- Query materialized view
SELECT * FROM myview;
```

### Output

```
 number
--------
 1
(1 row)
```

---

# 🔄 Insert More Data into Base Table

```sql
INSERT INTO mytable VALUES (2);
```

Now the base table contains:

```
1
2
```

But the materialized view still shows:

```
1
```

Because materialized views do NOT update automatically.

---

# 🔁 Refresh the Materialized View

```sql
REFRESH MATERIALIZED VIEW myview;
```

Query again:

```sql
SELECT * FROM myview;
```

### Output

```
 number
--------
 1
 2
(2 rows)
```

✅ After refreshing, the materialized view reflects the latest data.

---

# 🏢 Database Support Overview

| Database | Support |
|-----------|----------|
| PostgreSQL | ✅ Native `CREATE MATERIALIZED VIEW` |
| Oracle | ✅ Native support |
| SQL Server | ❌ Uses **Indexed Views** instead |
| MySQL | ❌ No native support (use manual table + triggers) |
| SQLite | ❌ No native support |

---

# 🔹 SQL Server Equivalent: Indexed View

```sql
CREATE VIEW dbo.MyIndexedView
WITH SCHEMABINDING
AS
SELECT number, COUNT_BIG(*) AS RowCount
FROM dbo.MyTable
GROUP BY number;

-- Create clustered index to materialize it
CREATE UNIQUE CLUSTERED INDEX IX_MyIndexedView
ON dbo.MyIndexedView(number);
```

Note:
- Requires `SCHEMABINDING`
- Has several restrictions
- Automatically stays updated

---

# 🔹 MySQL / SQLite Workaround

Since MySQL and SQLite do not support materialized views:

1️⃣ Create a regular table  
2️⃣ Insert results of a query  
3️⃣ Refresh manually or via trigger/event  

```sql
CREATE TABLE myview AS
SELECT * FROM mytable;

-- Refresh manually
TRUNCATE TABLE myview;

INSERT INTO myview
SELECT * FROM mytable;
```

---

# 🧠 Key Takeaways

- Materialized Views store query results physically.
- They improve performance for heavy queries.
- They require manual or scheduled refresh.
- Best used for reporting, analytics, and aggregations.
- Not ideal for highly volatile, real-time systems.
