# ✅ Chapter 60: UNION / UNION ALL

## Introduction

The UNION and UNION ALL keywords in SQL are used to combine the results of two or more SELECT statements into a single result set.

To use UNION or UNION ALL:

- Each SELECT statement must return the same number of columns.
- Columns must have compatible data types.
- Columns must appear in the same order in both queries.
- Column lengths can differ, but types must match (e.g., both VARCHAR or both INT).

---

## Syntax

```sql
SELECT column_1 [, column_2, ...]
FROM table_1
[WHERE condition]

UNION | UNION ALL

SELECT column_1 [, column_2, ...]
FROM table_2
[WHERE condition];
```

---

## Remarks

Both UNION and UNION ALL merge results from multiple queries.

The difference lies in how they handle duplicates:

| Command     | Removes Duplicates | Faster Performance | Recommended When |
|------------|--------------------|--------------------|------------------|
| UNION      | ✅ Yes             | ❌ No              | You need unique rows |
| UNION ALL  | ❌ No              | ✅ Yes             | Duplicates don’t matter or won’t exist |

### 🚀 Performance Tip

Use **UNION ALL** whenever possible, as it avoids sorting and deduplication.

---

## 🧩 Basic UNION ALL Example

Create two department tables:

```sql
CREATE TABLE HR_EMPLOYEES (
    PersonID INT,
    LastName VARCHAR(30),
    FirstName VARCHAR(30),
    Position VARCHAR(30)
);

CREATE TABLE FINANCE_EMPLOYEES (
    PersonID INT,
    LastName VARCHAR(30),
    FirstName VARCHAR(30),
    Position VARCHAR(30)
);
```

Now retrieve all employees who are managers in either department:

```sql
SELECT FirstName, LastName
FROM HR_EMPLOYEES
WHERE Position = 'manager'

UNION ALL

SELECT FirstName, LastName
FROM FINANCE_EMPLOYEES
WHERE Position = 'manager';
```

### ✅ Explanation

- Combines managers from both tables.
- Keeps duplicates (e.g., if the same person exists in both).

---

## 🏷️ Using Column Aliases

```sql
SELECT
    FirstName AS 'First Name',
    LastName AS 'Last Name'
FROM HR_EMPLOYEES
WHERE Position = 'manager'

UNION ALL

SELECT
    FirstName, LastName
FROM FINANCE_EMPLOYEES
WHERE Position = 'manager';
```

You can define column aliases in the **first SELECT**.  
The resulting column names will match those aliases.

---

## 📊 Concept Summary

| Type       | Behavior                                      | Use Case |
|------------|----------------------------------------------|----------|
| UNION      | Combines results and removes duplicates      | Use when duplicates must be eliminated |
| UNION ALL  | Combines results without removing duplicates | Use when performance is key or duplicates are acceptable |

---

## ⚡ Performance Guidance

### When to Use UNION

```sql
SELECT C1, C2, C3 FROM Table1 WHERE C1 = @Param1
UNION
SELECT C1, C2, C3 FROM Table1 WHERE C2 = @Param2;
```

Use when you need **unique results** across multiple queries.

💡 This approach can optimize query plans using simple indexes, improving read efficiency.

---

### When to Use UNION ALL

```sql
SELECT C1 FROM Table1
UNION ALL
SELECT C1 FROM Table2;
```

Use when duplicates are acceptable or when datasets are guaranteed to be unique.

💡 Common in reporting queries and partitioned table views.

---

## ⚙️ Key Takeaways

✅ Use **UNION ALL** for speed unless you need to remove duplicates.  
⚠️ Both queries must return identical column counts and compatible data types.  
💾 Excellent for merging tables, building reports, and combining partitioned datasets.
