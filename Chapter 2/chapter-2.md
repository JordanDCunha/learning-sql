# Chapter 2 – ALTER TABLE & Constraints

Database Used in Examples: SQL Server syntax

---

## Introduction

The `ALTER TABLE` command is used to modify the structure of an existing table.

You can:

- Add columns
- Drop columns
- Modify columns
- Add constraints
- Drop constraints

---

## Basic Syntax

```sql
ALTER TABLE table_name
ADD column_name datatype;
```

---

## Adding Columns

```sql
ALTER TABLE Employees
ADD StartingDate DATE NOT NULL DEFAULT GETDATE(),
    DateOfBirth DATE NULL;
```

### Explanation

- `StartingDate`  
  - Cannot be NULL  
  - Defaults to current date  

- `DateOfBirth`  
  - Allows NULL values  

---

## Dropping a Column

```sql
ALTER TABLE Employees
DROP COLUMN Salary;
```

### Explanation

- Permanently removes the column and its data.
- Any related constraints must be removed first.

---

## Adding a Constraint

```sql
ALTER TABLE Employees
ADD CONSTRAINT DefaultSalary
DEFAULT (100) FOR Salary;
```

---

## Dropping a Constraint

```sql
ALTER TABLE Employees
DROP CONSTRAINT DefaultSalary;
```

---

## Altering a Column

```sql
ALTER TABLE Employees
ALTER COLUMN StartingDate DATETIME NOT NULL DEFAULT (GETDATE());
```

---

## Adding a Primary Key

```sql
ALTER TABLE Employees
ADD CONSTRAINT pk_EmployeeID PRIMARY KEY (ID);
```

---

## Composite Primary Key

```sql
ALTER TABLE Employees
ADD CONSTRAINT pk_EmployeeID PRIMARY KEY (ID, FName);
```

---

## Finding Constraint Names

```sql
SELECT
    tc.constraint_name
FROM 
    information_schema.table_constraints AS tc
WHERE 
    tc.table_name = 'students'
    AND tc.constraint_type = 'PRIMARY KEY';
```

---

# SQL Constraints Overview

| Constraint | Purpose |
|------------|----------|
| PRIMARY KEY | Uniquely identifies each row |
| FOREIGN KEY | Ensures value exists in another table |
| UNIQUE | Ensures all values are unique |
| NOT NULL | Prevents NULL values |
| CHECK | Restricts allowed values |
| DEFAULT | Provides default value |
