# Chapter 30 — Identifiers

## 🔹 What Are Identifiers?

Identifiers are names you give to database objects:

- Tables
- Columns
- Views
- Indexes
- Constraints

Examples:

Customers  
order_id  
EmployeeSalary  

---

## Unquoted Identifiers

Allowed characters:

- Letters (A–Z)
- Digits (0–9)
- Underscore (_)

Rules:

- Must start with a letter
- Case behavior depends on SQL system

---

### ✔ Valid

Customer  
employee_id  
order2025  
my_table  

---

### ❌ Invalid

2employees   → Cannot start with a number  
total$revenue → Illegal symbol in many systems  

---

# When to Use Quoted Identifiers

```sql
CREATE TABLE "Weird-Name!" (
   "Column With Spaces" INT
);
```

## ✅ What It Does

Allows:

- Spaces
- Special characters
- Reserved keywords

BUT:

Case becomes strict.

You must reference it exactly:

```sql
SELECT "Column With Spaces"
FROM "Weird-Name!";
```

---

# Case Rules in Major SQL Systems

| SQL System | Case Stored | Case Compared | Notes |
|------------|------------|--------------|-------|
| SQL Server | Preserved | Depends on collation | Can be case-sensitive |
| MySQL | Preserved | Depends on OS/settings | Linux often case-sensitive |
| Oracle | Converted to UPPER | Case-insensitive | Unless quoted |
| PostgreSQL | Converted to lowercase | Case-insensitive | Unless quoted |
| SQLite | Preserved | Case-insensitive (ASCII) | Very flexible |

---

# ⭐ Best Practice Naming Conventions

### Recommended Styles

snake_case  → employee_first_name  
PascalCase  → EmployeeFirstName  
camelCase   → employeeFirstName  

---

### Avoid

- Spaces in names
- Special characters (#, $, %, !)
- Inconsistent casing like:
  DifferentcaseEverywhere

---

# Core Rules

Start with a letter  
Do not start with number or special symbol  

Avoid quotes unless necessary  
Quoted identifiers are harder to type & maintain  

Case sensitivity varies by system  
Be consistent with your naming style  

---

# 🧠 Mental Model

Identifiers are the labels of your database.

Clean names → Clean schema  
Messy names → Maintenance headaches  

Professional SQL developers follow consistent naming conventions.
