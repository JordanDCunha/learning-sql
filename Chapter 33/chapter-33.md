# Chapter 33 — Information Schema

## 📌 What is the Information Schema?

The Information Schema is:

A set of read-only system views.

It contains metadata about the database structure.

Metadata = data about the data.

Examples of metadata:

- Tables
- Columns
- Data types
- Constraints
- Permissions

You can query these views like normal tables.

---

## 📌 Why is Information Schema Useful?

Because you often don’t know:

- The names of all tables
- Which tables contain certain fields
- How tables relate to each other

Example:

You want to join two tables  
But you don’t know if they share a column  

→ Search metadata for a column like "Institution"

Perfect for exploring unknown schemas.

---

# ⭐ Main Example Query (T-SQL / Standard SQL)

```sql
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE '%Institution%';
```

## ✅ What This Does

Searches all columns in the database.

Finds ones whose name contains "Institution".

Returns:

- Column name
- Table name
- Schema name
- Data type
- Max length
- Nullable or not

💡 Perfect for database exploration.

---

# 🔍 Common Useful Queries

## ✅ 1️⃣ List All Tables

```sql
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES;
```

---

## ✅ 2️⃣ List All Columns in a Specific Table

```sql
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Students';
```

---

## ✅ 3️⃣ Find Foreign Key Relationships

```sql
SELECT *
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS;
```

---

# Important Information Schema Views

| View | What It Tells You |
|------|-------------------|
| INFORMATION_SCHEMA.TABLES | All tables + table types |
| INFORMATION_SCHEMA.COLUMNS | All columns + data types |
| INFORMATION_SCHEMA.CONSTRAINTS | All constraints |
| INFORMATION_SCHEMA.KEY_COLUMN_USAGE | Which columns are part of keys |
| INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS | Foreign key details |

---

# Database Differences

| Database | Support |
|----------|----------|
| SQL Server | ✅ Full support |
| PostgreSQL | ✅ Full support |
| MySQL | ✅ Full support (as virtual DB) |
| Oracle | ❌ Uses ALL_* views instead |
| SQLite | ❌ Uses sqlite_master |

---

# Core Concepts

| Concept | Meaning |
|----------|----------|
| Information Schema | The database’s blueprint |
| Metadata | Data describing database objects |
| Why query it? | To explore relationships and find needed fields quickly |

---

# 🧠 Mental Model

Normal tables = Data  
Information Schema = Blueprint of the data  

If you don’t know the structure…  
Query the blueprint.
