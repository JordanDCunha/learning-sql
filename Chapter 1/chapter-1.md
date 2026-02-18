# Chapter 1 – SQL Fundamentals

## What is SQL?

SQL (Structured Query Language) is used to manage relational databases.

---

## Creating a Table

The `CREATE TABLE` command defines a new table structure.

```sql
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    grade TEXT
);
```

The `PRIMARY KEY` ensures each row is unique.

---

## Inserting Data

```sql
INSERT INTO students (name, age, grade)
VALUES
    ('Alice', 20, 'A'),
    ('Bob', 22, 'B'),
    ('Charlie', 21, 'C');
```
