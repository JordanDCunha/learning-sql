# Chapter 15 – DROP vs DELETE Database

---

# Purpose

DROP DATABASE permanently deletes an entire database:

- All tables
- All data
- All views
- All indexes
- All schema

This is irreversible unless you have a backup.

---

# SQL Server Syntax

DROP DATABASE [IF EXISTS] database_name;

You can also drop database snapshots.

---

# MySQL Syntax

DROP DATABASE [IF EXISTS] db_name;

or

DROP SCHEMA [IF EXISTS] db_name;

---

# Important Difference

DROP DATABASE  
→ Removes entire database (structure + data)

DELETE FROM table_name  
→ Removes data only

DROP TABLE  
→ Removes one table (structure + data)

---

# IF EXISTS

Prevents errors if the database does not exist.

Example:

DROP DATABASE IF EXISTS Employees;

---

# Backups (SQL Server Example)

BACKUP DATABASE Employees
TO DISK = 'backup_path';

Always back up before dropping production databases.

---

# SQLite Special Case

SQLite does NOT support DROP DATABASE.

Why?

Because:

Database = file on disk.

To "drop" a SQLite database:

1. Close connection
2. Delete the .db file manually

SQLite alternative:

DROP TABLE removes tables.
DETACH DATABASE removes an attached database file from connection.

But neither deletes the file automatically.

---

# Critical Warning

DROP DATABASE is irreversible.

Unlike DELETE:

There is no WHERE.
There is no undo.
There is no partial removal.

It removes everything.

---

# Rookie Mistake

Running:

DROP DATABASE ProductionDB;

In the wrong environment.

Always:

- Double-check connection
- Use test databases
- Back up first
- Use IF EXISTS

---

# Mental Model

DELETE → remove rows  
DROP TABLE → remove one structure  
DROP DATABASE → remove entire system  

Think of DROP DATABASE as formatting a hard drive.
