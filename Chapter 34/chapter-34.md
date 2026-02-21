# Chapter 34 — INSERT

## 📌 What Does INSERT Do?

Adds new rows into a table.

Can insert:

✅ Single row  
✅ Multiple rows  
✅ Data copied from another table  

---

# 🧩 Basic Syntax

```sql
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
```

## Requirements

| Requirement | Why |
|-------------|-----|
| Column order must match | Prevents wrong data placement |
| Data types must be compatible | Avoid conversion errors |
| NOT NULL columns must have values | Required by schema |
| Identity columns may be omitted | Auto-generated |

---

# ✅ Insert With All Columns

```sql
INSERT INTO Customers
VALUES ('Zack', 'Smith', 'zack@example.com', '7049989942', 'EMAIL');
```

Key Notes:

- Inserts full row
- Must match table structure exactly
- Primary key may auto-generate

---

# ✅ Insert Into Specific Columns

```sql
INSERT INTO Customers (FName, LName, Email, PreferredContact)
VALUES ('Zack', 'Smith', 'zack@example.com', 'EMAIL');
```

Key Notes:

- Safer and clearer
- Omits nullable/default columns
- All NOT NULL columns must still be provided

---

# 📦 Multiple Row Insert

```sql
INSERT INTO tbl_name (field1, field2, field3)
VALUES (1,2,3),
       (4,5,6),
       (7,8,9);
```

Advantages:

✅ Faster performance  
✅ One command  
✅ Fewer transactions  

---

# ✅ Insert Data From Another Table

```sql
INSERT INTO Customers (FName, LName, PhoneNumber)
SELECT FName, LName, PhoneNumber
FROM Employees;
```

Great for:

- Data migration
- Copying related records
- ETL processes

---

# ⚠ Insert All Columns (Matching Schema Only)

```sql
INSERT INTO Table1
SELECT * FROM Table2;
```

Valid only if:

- Same column count
- Same order
- Compatible data types

Otherwise → Error.

---

# 🚀 Bulk Insert Methods (By RDBMS)

| RDBMS | Bulk Method |
|--------|-------------|
| MySQL | LOAD DATA INFILE |
| SQL Server | BULK INSERT |
| PostgreSQL | COPY |
| Oracle | SQL*Loader |

Used for:

- Large datasets
- CSV imports
- Data warehousing

---

# 🧠 Mental Model

INSERT = Add rows

Column list omitted → Must match full structure  
Column list included → Safer and clearer  

Multi-row INSERT → Faster  
Bulk tools → Fastest  

Clean inserts prevent data integrity problems.
