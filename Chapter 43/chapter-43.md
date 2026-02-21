# Chapter 43: Relational Algebra — Study Guide

## 📘 Introduction

**Relational Algebra** is the theoretical foundation of SQL.  
It describes how relational data is manipulated and retrieved.

- Operates on entire tables (relations)
- Always produces a new table (closure property)
- Works conceptually with:
  - Relations (tables)
  - Tuples (rows)
  - Attributes (columns)

For simplicity, we’ll use: tables, records, and fields.

---

# ⚙️ Key Principles

- Operators work on whole tables, not individual records.
- Every operation returns a new table.
- Expressions can be nested.
- Results can be renamed and reused.

---

# 1️⃣ SELECT (σ) — Filtering Rows

Used to return rows that satisfy a condition.

### Syntax

```
select <table> where <condition>
```

### Example

```
select People where DepartmentID = 2
```

### Equivalent Relational Algebra Notation

```
σ DepartmentID = 2 (People)
```

### Multiple Conditions

```
select People where StartYear > 2005 and DepartmentID = 2
```

---

# 2️⃣ PROJECT (π) — Selecting Columns

Used to extract specific fields from a table.

- Removes duplicates automatically.

### Syntax

```
project <table> over <field list>
```

### Example

```
project People over StartYear
```

### Equivalent Notation

```
π StartYear (People)
```

Example Result:

| StartYear |
|-----------|
| 2005 |
| 2006 |
| 2004 |
| 2008 |

---

# 3️⃣ GIVING — Naming Results

Used to assign a name (alias) to a result.

### Syntax

```
<expression> giving <alias>
```

### Example

```
select People where DepartmentID = 2 giving A
project A over PersonName giving B
```

---

# 4️⃣ NATURAL JOIN (⨝) — Combining Tables

Combines two tables based on a shared field.

### Syntax

```
join <table1> and <table2> where <field1> = <field2>
```

### Example

```
join People and Departments where DepartmentID = ID
```

Equivalent relational algebra notation:

```
People ⨝ Departments
```

---

# 5️⃣ Combining Operators Example

### Goal:

Find names of people who:
- Started in 2005
- Belong to the Production department

---

### Step-by-Step Version

```
join People and Departments where DepartmentID = ID giving A
select A where StartYear = 2005 and Dept = 'Production' giving B
project B over PersonName giving C
```

---

### Combined Nested Expression

```
project (
  select (
    join People and Departments where DepartmentID = ID
  ) where StartYear = 2005 and Dept = 'Production'
) over PersonName giving C
```

---

# ⚡ Closure Property

Every operation:

- Takes a table
- Produces a new table
- Can be nested infinitely

This is why relational algebra expressions are composable.

---

# ⚡ Key Points Summary

| Operator | Symbol | Purpose |
|----------|--------|----------|
| SELECT | σ | Filters rows |
| PROJECT | π | Selects columns |
| JOIN | ⨝ | Combines tables |
| GIVING | — | Names result |
| Closure | — | Output is always a table |

---

# 🧠 Final Reminder

- Relational algebra describes the *logic* behind SQL.
- SQL is a practical implementation of these theoretical operators.
- Understanding relational algebra makes complex SQL queries easier to reason about.
