# Chapter 42: Primary Keys — Study Guide

## 📘 Introduction

A **primary key** is a column (or combination of columns) that uniquely identifies each row in a table.

- Only **one primary key** is allowed per table.
- A primary key **cannot contain NULL values**.
- Can be:
  - Single-column key
  - Composite key (multiple columns)
- Many databases support **auto-incrementing** primary keys.

---

# 🧩 Key Characteristics

| Rule | Description |
|------|------------|
| Unique | Each value must be different |
| NOT NULL | Cannot contain NULL |
| One per table | Only one primary key constraint |
| Composite allowed | Multiple columns can form a single PK |

---

# ⚙️ Creating a Single-Column Primary Key

```sql
CREATE TABLE Employees (
    Id INT NOT NULL,
    PRIMARY KEY (Id),
    FName VARCHAR(50),
    LName VARCHAR(50)
);
```

---

# ⚙️ Inline Primary Key (Alternative Syntax)

```sql
CREATE TABLE Employees (
    Id INT NOT NULL PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50)
);
```

---

# ⚙️ Composite Primary Key

```sql
CREATE TABLE EmployeeProjects (
    e1_id INT,
    e2_id INT,
    PRIMARY KEY (e1_id, e2_id)
);
```

### 💡 Explanation

- Neither `e1_id` nor `e2_id` alone is unique.
- Together they uniquely identify each row.
- Common in junction (many-to-many) tables.

---

# ⚙️ Auto-Increment Primary Keys

Different databases use different syntax:

### MySQL

```sql
CREATE TABLE Employees (
    Id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id)
);
```

### PostgreSQL

```sql
CREATE TABLE Employees (
    Id SERIAL PRIMARY KEY
);
```

### SQL Server

```sql
CREATE TABLE Employees (
    Id INT NOT NULL IDENTITY,
    PRIMARY KEY (Id)
);
```

### SQLite

```sql
CREATE TABLE Employees (
    Id INTEGER PRIMARY KEY
);
```

---

# ⚠️ Primary Key vs Unique Constraint

| Primary Key | Unique |
|-------------|--------|
| Only one per table | Multiple allowed |
| Cannot be NULL | Can allow NULL (DB-dependent) |
| Automatically indexed | Usually indexed |

---

# ⚙️ Adding Primary Key After Table Creation

```sql
ALTER TABLE Employees
ADD PRIMARY KEY (Id);
```

---

# ⚡ Key Points Summary

| Concept | Summary |
|----------|----------|
| Primary Key | Uniquely identifies each row |
| NULL | Not allowed |
| One per table | Yes |
| Composite | Multiple columns allowed |
| Auto-increment | Supported in most DBs |
| Indexed | Automatically indexed |

---

# 🧠 Final Reminder

Always:

- Use primary keys to enforce data integrity.
- Prefer surrogate keys (auto-increment) for simplicity.
- Use composite keys for relationship/junction tables.
- Never allow a primary key to be nullable.

Primary keys are the foundation of relational database design.
