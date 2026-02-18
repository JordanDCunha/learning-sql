# Chapter 16 – DROP TABLE

---

# Purpose of DROP TABLE

The DROP TABLE command completely deletes a table from the database.

It removes:

- Table structure
- All data
- Indexes
- Triggers
- Permissions

This is a Data Definition Language (DDL) command.

---

# Basic Syntax

DROP TABLE MyTable;

Deletes the table permanently.

---

# Safe Syntax (Recommended)

DROP TABLE IF EXISTS MyTable;

Prevents runtime errors if the table does not exist.

Supported by:

MySQL  
PostgreSQL  
SQLite  
Modern SQL Server  

---

# Important Warning

Once executed:

- Data is gone
- Structure is gone
- Cannot be undone without backup

DROP TABLE is irreversible.

---

# DROP vs DELETE vs TRUNCATE

DELETE
Removes rows only.
Keeps table structure.

TRUNCATE
Removes all rows.
Resets identity.
Keeps structure.
(Not supported in SQLite.)

DROP
Removes structure AND data.

---

# Foreign Key Dependencies

You cannot drop a table if:

- Other tables reference it
- Foreign key constraints exist

You must:

- Drop dependent tables first
OR
- Remove constraints

Example:

If Courses references Students,
you must drop Courses first.

---

# Best Practices

- Always use IF EXISTS
- Double-check database connection
- Use in development/testing carefully
- Never casually run in production

---

# Mental Model

DELETE → erase contents  
TRUNCATE → empty container  
DROP TABLE → destroy container  
DROP DATABASE → destroy entire warehouse
