# Chapter 9 – CREATE DATABASE

---

# Concept Overview

The CREATE DATABASE command creates a new, empty database on a database server.

Once created, you can define:

- Tables
- Views
- Indexes
- Stored procedures
- Other database objects

---

# Standard SQL Syntax

CREATE DATABASE dbname;

Example:

CREATE DATABASE CompanyDB;

---

# Important Notes

- The database name must be unique on the server.
- You may need administrative permissions.
- After creation, you typically switch to it:

MySQL:
USE CompanyDB;

PostgreSQL:
\c CompanyDB

SQL Server:
USE CompanyDB;

---

# SQLite Special Case

SQLite does NOT support CREATE DATABASE.

Why?

Because in SQLite:

A database = a file.

Creating a database simply means creating a new .db file.

In DBeaver:
- Right click → Create New Connection → SQLite
- Choose a file name
- That file becomes your database

---

# Advanced SQLite Feature

SQLite allows attaching multiple database files:

ATTACH DATABASE 'file.db' AS alias;

You can then reference tables like:

alias.TableName

And detach with:

DETACH DATABASE alias;

---

# Mental Model

Server Databases (MySQL, PostgreSQL, SQL Server):
Database = container inside a server.

SQLite:
Database = file on disk.
