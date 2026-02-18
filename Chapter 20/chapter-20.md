# Chapter 20: EXISTS Clause

## What It Does

The EXISTS clause checks whether a subquery returns any rows.

If the subquery finds at least one matching row:
EXISTS = TRUE

If it finds no rows:
EXISTS = FALSE

It is commonly used inside a WHERE condition.

---

# Basic Syntax

```sql
SELECT *
FROM Table1 t1
WHERE EXISTS (
    SELECT 1
    FROM Table2 t2
    WHERE t2.ForeignKey = t1.PrimaryKey
);
