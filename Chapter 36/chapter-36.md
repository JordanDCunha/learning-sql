# Chapter 36: LIKE Operator — Study Guide

## 📘 Purpose

The `LIKE` operator is used in the `WHERE` clause to search for patterns in text columns using wildcard characters.

It allows partial matches rather than exact matches, which makes it especially useful for searching names, emails, addresses, etc.

---

## 🧩 Basic Syntax

```sql
-- Match any sequence of characters
SELECT * 
FROM table_name
WHERE column_name LIKE '%value%';

-- Match pattern with a single-character wildcard
SELECT * 
FROM table_name
WHERE column_name LIKE 'V_n%';

-- Match pattern with character list or range (SQL Server only)
SELECT * 
FROM table_name
WHERE column_name LIKE 'V[abc]n%';
```

---

# 🧠 Wildcard Characters Overview

| Wildcard | Description | Example | Matches |
|----------|------------|---------|----------|
| `%` | Zero or more characters | `'Jo%'` | John, Jo, Jordan |
| `_` | Exactly one character | `'J_n'` | Jan, Jon (not John) |
| `[charlist]` | One character from list (SQL Server) | `'H[oa]t'` | Hot, Hat |
| `[a-p]` | One character in range (SQL Server) | `'[a-p]%'` | Words starting A–P |
| `[^charlist]` | Not in list (SQL Server) | `'[^a-p]%'` | Words NOT starting A–P |

---

# 📋 1️⃣ Match Open-Ended Patterns (% Wildcard)

### Example Table: Employees

| Id | FName  | LName   | PhoneNumber | ManagerId | DepartmentId | Salary | Hire_date  |
|----|--------|---------|------------|-----------|--------------|--------|------------|
| 1  | John   | Johnson | 2468101214 | 1 | 1 | 400 | 2005-03-23 |
| 2  | Sophie | Amudsen | 2479100211 | 1 | 1 | 400 | 2010-01-11 |
| 3  | Ronny  | Smith   | 2462544026 | 2 | 1 | 600 | 2015-08-06 |
| 4  | Jon    | Sanchez | 2454124602 | 1 | 1 | 400 | 2005-03-23 |
| 5  | Hilde  | Knag    | 2468021911 | 2 | 1 | 800 | 2000-01-01 |

---

### Match any value containing 'on'

```sql
SELECT * 
FROM Employees
WHERE FName LIKE '%on%';
```

✅ Matches: Ronny, Jon

---

### Match any value starting with '246'

```sql
SELECT * 
FROM Employees
WHERE PhoneNumber LIKE '246%';
```

✅ Matches:
- 2468101214  
- 2462544026  
- 2468021911  

---

### Match any value ending with '11'

```sql
SELECT * 
FROM Employees
WHERE PhoneNumber LIKE '%11';
```

✅ Matches:
- 2479100211  
- 2468021911  

---

# 📋 2️⃣ Match by Single Character (_ Wildcard)

The underscore `_` matches exactly one character.

---

### 3rd character is 'n'

```sql
SELECT * 
FROM Employees
WHERE FName LIKE '__n%';
```

✅ Matches: Ronny, Jon  

---

### Exactly 3 letters: starts with j, ends with n

```sql
SELECT * 
FROM Employees
WHERE FName LIKE 'j_n';
```

✅ Matches: Jan, Jon, Jen  
🚫 Does NOT match: John, Jason, Jordan  

---

# 📋 3️⃣ Match by Range or Set ([ ] Wildcard — SQL Server Only)

| Pattern | Description | Example Match |
|----------|------------|--------------|
| `[a-g]` | Any letter from a–g | gary |
| `[abc]` | Any of a, b, or c | carol |
| `[^a-g]` | Not between a–g | mary |

---

### Examples (SQL Server)

```sql
-- Match FNames starting with letters A–F
SELECT * FROM Employees 
WHERE FName LIKE '[A-F]%';

-- Match "gary" but not "mary"
SELECT * FROM Employees 
WHERE FName LIKE '[a-g]ary';

-- Match "mary" but not "gary"
SELECT * FROM Employees 
WHERE FName LIKE '[^a-g]ary';
```

⚠️ PostgreSQL/MySQL/SQLite do NOT support `[ ]` patterns in `LIKE`.
Use `REGEXP` instead.

---

# 📋 4️⃣ LIKE ANY / LIKE ALL (PostgreSQL)

| Keyword | Meaning |
|----------|---------|
| `LIKE ANY` | Match at least one pattern |
| `LIKE ALL` | Must match all patterns |
| `NOT LIKE ALL` | Exclude all patterns |

---

### Examples (PostgreSQL)

```sql
-- Must contain all three patterns
SELECT *
FROM customer_table
WHERE full_address LIKE ALL (ARRAY['%united kingdom%', '%london%', '%eastern road%']);

-- Exclude products that match any pattern
SELECT *
FROM customer_table
WHERE product_type NOT LIKE ALL (ARRAY['%electronics%', '%books%', '%video%']);
```

---

# 📋 5️⃣ ESCAPE Clause

Used when searching for literal `%` or `_` characters.

```sql
SELECT *
FROM Products
WHERE ProductCode LIKE '%\%%' ESCAPE '\';
```

Explanation:

- `\%` treats `%` as a literal character.
- `ESCAPE '\'` tells SQL that `\` is the escape character.

---

# 📋 6️⃣ Wildcard Summary Table

| Wildcard | Meaning | Example | Matches |
|----------|---------|----------|----------|
| `%` | Zero or more characters | `'Jo%'` | Jo, John, Jordan |
| `_` | Exactly one character | `'J_n'` | Jon, Jan |
| `[charlist]` | One from list (SQL Server) | `'[adl]%'` | Adam, David |
| `[a-c]` | Range (SQL Server) | `'[a-c]%'` | Alice, Ben |
| `[^apl]` | Exclude chars (SQL Server) | `'[^apl]%'` | Not starting a/p/l |

---

# 🚀 Quick Example Reference

```sql
-- City starts with "Lo"
SELECT * FROM Customers WHERE City LIKE 'Lo%';

-- City contains "es"
SELECT * FROM Customers WHERE City LIKE '%es%';

-- City starts with any char followed by "erlin"
SELECT * FROM Customers WHERE City LIKE '_erlin';

-- SQL Server only
SELECT * FROM Customers WHERE City LIKE '[adl]%';

-- SQL Server only
SELECT * FROM Customers WHERE City LIKE '[^apl]%';
```

---

# 🧠 Key Notes by Database

| Feature | SQL Server | PostgreSQL | MySQL | SQLite |
|----------|------------|------------|--------|--------|
| `%` and `_` | ✅ | ✅ | ✅ | ✅ |
| `[abc]` range syntax | ✅ | ❌ | ❌ | ❌ |
| `LIKE ANY` | ❌ | ✅ | ❌ | ❌ |
| Case-sensitive by default | ❌ | ✅ | ❌ | ❌ |
| `ILIKE` (case-insensitive) | ❌ | ✅ | ❌ | ❌ |
