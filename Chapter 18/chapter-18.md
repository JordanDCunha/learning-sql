# Chapter 18: EXCEPT Operator

## What It Does

The `EXCEPT` operator compares two result sets and returns only the rows
that appear in the first (left) query but NOT in the second (right) query.

EXCEPT = "Everything in A that is NOT in B"

---

## Basic Syntax

```sql
SELECT column_list
FROM table1
EXCEPT
SELECT column_list
FROM table2;
