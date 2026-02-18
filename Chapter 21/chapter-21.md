# Chapter 21: DESCRIBE and EXPLAIN

## Purpose

DESCRIBE and EXPLAIN help you understand:

- Table structure (metadata)
- Query execution behavior
- Performance characteristics

They are essential for database debugging and optimization.

---

# DESCRIBE

## What It Does

Displays the structure of a table, including:

- Column name
- Data type
- Nullability
- Key type
- Default value
- Extra properties (like auto_increment)

---

## Syntax

```sql
DESCRIBE tablename;
