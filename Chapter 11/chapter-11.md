# Chapter 11 – CREATE TABLE

---

# Concept Overview

The CREATE TABLE statement creates a new table in a database.

A table consists of:

- Column names
- Data types
- Optional constraints

---

# Basic Syntax

CREATE TABLE tableName (
    ColumnName1 datatype1,
    ColumnName2 datatype2
);

---

# Column Components

ColumnName → name of the column  
datatype → type of data stored  
constraints → rules applied to the column  

Common constraints:

PRIMARY KEY → unique identifier  
NOT NULL → prevents empty values  
FOREIGN KEY → creates relationship  
AUTOINCREMENT → auto-increasing ID  

---

# Auto-Increment in SQLite

SQL Server:
IDENTITY(1,1)

SQLite:
INTEGER PRIMARY KEY AUTOINCREMENT

Important:
In SQLite, only a column declared as:

INTEGER PRIMARY KEY

can auto-increment.

---

# Duplicate Table

CREATE TABLE ClonedEmployees AS
SELECT * FROM Employees;

This copies data and structure
(but NOT constraints like PRIMARY KEY or FOREIGN KEY).

---

# Modified Table

CREATE TABLE ModifiedEmployees AS
SELECT
    Id,
    FName || ' ' || LName AS FullName
FROM Employees;

SQLite uses:
|| for string concatenation.

---

# Foreign Key Example

FOREIGN KEY (CityID)
REFERENCES Cities(CityID)

This enforces relational integrity.

Important in SQLite:
You must enable foreign keys:

PRAGMA foreign_keys = ON;

---

# Mental Model

CREATE TABLE defines:

- Structure
- Data rules
- Relationships

Tables are the structural foundation of relational databases.
