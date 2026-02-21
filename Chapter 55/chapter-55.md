# ✅ Chapter 55 — Table Design

## 📚 Remarks

Reference:  
**The Open University (1999)**  
*Relational Database Systems: Block 2 Relational Theory*  
Milton Keynes, The Open University.

---

## 🧠 Why Table Design Matters

A true relational database must go beyond simply storing data in tables and writing queries.

Poor table design can:

- ❌ Slow down queries
- ❌ Cause data inconsistency
- ❌ Create duplication problems
- ❌ Break relational integrity
- ❌ Make the database difficult or impossible to maintain

Academically, a properly designed table is called a **relation** to distinguish it from loosely structured tables.

Good table design follows strict relational principles.

---

# 📏 The Five Rules of a Relational Table

### 1️⃣ Each Value is Atomic
Every field must contain a **single, indivisible value**.

✔ Correct:  
```
Name = 'Fred'
```

❌ Incorrect:  
```
Name = 'Fred, John'
```

No lists or multiple values inside one field.

---

### 2️⃣ Each Column Has a Single Data Type

All values in a column must share the same data type.

Examples:

- `Id` → Integer  
- `Name` → Text  
- `DOB` → Date  

You should never mix types in one column.

---

### 3️⃣ Each Column Name Must Be Unique

Every field heading (column name) must be distinct.

✔ Valid:

```
Id | Name | DOB | Manager
```

❌ Invalid:

```
Id | Name | Name | DOB
```

---

### 4️⃣ Each Row Must Have a Unique Identifier

Every table must have at least one **Primary Key** that uniquely identifies each row.

Without this, duplicate rows become indistinguishable.

Usually implemented as:

```sql
PRIMARY KEY (Id)
```

---

### 5️⃣ Order Has No Meaning

- The order of rows does **not** matter.
- The order of columns does **not** change meaning.

Relational databases treat tables as **unordered sets**.

If order is required, use:

```sql
ORDER BY column_name;
```

---

# 🧩 Example: A Properly Designed Table

| Id | Name | DOB        | Manager |
|----|------|------------|---------|
| 1  | Fred | 11/02/1971 | 3       |
| 2  | Fred | 11/02/1971 | 3       |
| 3  | Sue  | 08/07/1975 | 2       |

---

## 🔍 Rule Validation

✔ **Rule 1:** Each field contains a single atomic value.  
✔ **Rule 2:** Each column has a consistent data type.  
✔ **Rule 3:** All column headings are unique.  
✔ **Rule 4:** `Id` ensures each row is unique.  
✔ **Rule 5:** Changing row order does not change meaning.

---

# 🏗️ Basic SQL Example

```sql
CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    Manager INT NULL
);
```

This table:

- Enforces uniqueness via `PRIMARY KEY`
- Uses consistent data types
- Stores atomic values
- Follows relational principles

---

# 🧱 Summary

| Rule | Meaning |
|------|---------|
| Atomic Values | No multiple values in one field |
| Single Data Type | One data type per column |
| Unique Column Names | No duplicate headings |
| Primary Key Required | Each row must be identifiable |
| No Order Significance | Tables are unordered sets |

---

Good table design is the foundation of:

- Data integrity  
- Query performance  
- Scalability  
- Maintainability  
- Normalization  

A relational database is only as strong as its table structure.

---
