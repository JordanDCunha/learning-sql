# Chapter 13 – Data Types

---

# Concept Overview

SQL provides data types to define what kind of data a column can store.

Examples:

- Numbers
- Currency
- Text
- Binary data

Each database system implements these slightly differently.

---

# DECIMAL and NUMERIC

Syntax:

DECIMAL(precision, scale)
NUMERIC(precision, scale)

precision → total digits  
scale → digits after decimal  

Example:

CAST(123 AS DECIMAL(5,2))
-- 123.00

CAST(12345.12 AS NUMERIC(10,5))
-- 12345.12000

These types:

- Store exact values
- Avoid floating-point rounding errors
- Ideal for financial data

In SQL Server:
DECIMAL and NUMERIC are identical.

---

# Integers

Used for whole numbers.

SQL Server types:

bigint  → 8 bytes  
int     → 4 bytes  
smallint → 2 bytes  
tinyint → 1 byte  

SQLite:

SQLite mainly uses:
INTEGER

Storage size depends on the value stored.

---

# FLOAT and REAL

Used for approximate numeric values.

Example:

CAST(3.1415926535 AS REAL)

Floating types:

- Faster
- Not exact
- May introduce rounding errors

Avoid for financial data.

---

# MONEY and SMALLMONEY

SQL Server specific types for currency.

SQLite does NOT have MONEY types.

In SQLite:
Use DECIMAL or NUMERIC instead.

---

# BINARY and VARBINARY

Used to store binary data.

SQL Server:

BINARY(n)
VARBINARY(n)

SQLite equivalent:
BLOB

Example:

X'48656C6C6F'
Represents binary for "Hello"

Use cases:

- Images
- Files
- Encrypted data
- Hashes

---

# Important: SQLite Type Affinity

SQLite does NOT enforce strict types like SQL Server.

Instead it uses:

Type Affinity Categories:

INTEGER
REAL
TEXT
BLOB
NUMERIC

This means:

You can insert text into an INTEGER column.
SQLite will try to convert it.

This is very different from SQL Server or PostgreSQL.

---

# Exact vs Approximate

Exact types:
DECIMAL
NUMERIC
INTEGER

Approximate types:
FLOAT
REAL

Financial data → Always use exact types.
Scientific approximations → REAL or FLOAT.

---

# Mental Model

SQL Server:
Strict typing system.

SQLite:
Flexible typing system with type affinity.
