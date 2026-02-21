# Chapter 39: NULL — Study Guide

## 📘 Purpose

In SQL, **NULL** represents “nothing” — the absence of any value.

⚠️ Important distinctions:

- NULL ≠ empty string (`''`)
- NULL ≠ number `0`
- Do NOT write `'NULL'` in quotes — that becomes text, not NULL.

---

# 🧩 Key Characteristics

| Concept | Description |
|----------|------------|
| Meaning | Absence of a value |
| Comparison | Cannot use `=` or `<>` with NULL |
| Default Behavior | Columns are nullable unless specified `NOT NULL` |
| Use Case | Represent missing or optional data |

---

# ⚙️ Filtering for NULL

```sql
-- Select rows where ManagerId is NULL
SELECT * 
FROM Employees
WHERE ManagerId IS NULL;

-- Select rows where ManagerId is NOT NULL
SELECT * 
FROM Employees
WHERE ManagerId IS NOT NULL;
```

### 💡 Explanation

| Clause | Description |
|----------|------------|
| `IS NULL` | Filters rows where column has no value |
| `IS NOT NULL` | Filters rows where column contains a value |
| `= NULL` or `<> NULL` | ❌ Always returns UNKNOWN |

---

# 🧠 Why `= NULL` Does NOT Work

```sql
-- ❌ Incorrect
SELECT * FROM Employees
WHERE ManagerId = NULL;
```

Reason:

- NULL represents unknown.
- Any comparison with NULL results in UNKNOWN.
- SQL uses three-valued logic: TRUE, FALSE, UNKNOWN.

---

# ⚙️ Nullable vs Non-Nullable Columns

```sql
CREATE TABLE MyTable (
    MyCol1 INT NOT NULL,  -- cannot store NULL
    MyCol2 INT NULL       -- can store NULL
);

-- Works
INSERT INTO MyTable (MyCol1, MyCol2)
VALUES (1, NULL);

-- ❌ Fails
INSERT INTO MyTable (MyCol1, MyCol2)
VALUES (NULL, 2);
```

### 💡 Explanation

- `NOT NULL` ensures column must always have a value.
- `NULL` allows optional or missing data.
- Default: Columns are nullable unless explicitly set `NOT NULL`.

---

# ⚙️ Updating Fields to NULL

```sql
UPDATE Employees
SET ManagerId = NULL
WHERE Id = 4;
```

💡 Updating to NULL works like updating any other value — if the column allows NULL.

---

# ⚙️ Inserting Rows with NULL Fields

```sql
INSERT INTO Employees
(Id, FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate)
VALUES
(5, 'Jane', 'Doe', NULL, NULL, 2, 800, '2016-07-22');
```

### 💡 Explanation

- Optional fields (e.g., PhoneNumber, ManagerId) can be NULL.
- Useful when information is unknown or not applicable.

---

# ⚡ NULL in Expressions

```sql
SELECT Salary + NULL FROM Employees;
```

Result: NULL

Any arithmetic or string operation involving NULL returns NULL.

---

# ⚙️ Handling NULL with Functions

### Use `COALESCE()` (All Major DBs)

```sql
SELECT COALESCE(ManagerId, 0)
FROM Employees;
```

Returns first non-NULL value.

---

### SQL Server Only: `ISNULL()`

```sql
SELECT ISNULL(ManagerId, 0)
FROM Employees;
```

---

### MySQL Only: `IFNULL()`

```sql
SELECT IFNULL(ManagerId, 0)
FROM Employees;
```

---

# ⚡ Key Points Summary

| Concept | Summary |
|----------|----------|
| NULL | Absence of value |
| Not equal to | 0, empty string, or 'NULL' |
| Comparison | Must use `IS NULL` or `IS NOT NULL` |
| Column Constraint | `NOT NULL` prevents NULL values |
| Expressions | Operations with NULL return NULL |
| Use Case | Missing or optional data |

---

# 🧠 Final Reminder

Always remember:

- NULL means unknown.
- Unknown cannot be compared using `=`.
- Use proper NULL-handling functions when needed.
- Design schemas carefully to avoid unnecessary NULLs.
