# Chapter 8 – Common Table Expressions (CTEs)

Database Used: SQLite

---

# What Is a CTE?

A Common Table Expression (CTE) is a temporary result set defined using:

WITH QueryName AS (
    SELECT ...
)

It exists only for the next query.

---

# Why Use CTEs?

- Break complex queries into readable parts
- Replace nested subqueries
- Improve maintainability
- Reference the same result multiple times
- Handle recursion (trees, hierarchies, sequences)

---

# 1. Basic CTE

WITH ReadyCars AS (
    SELECT * FROM Cars WHERE Status = 'READY'
)
SELECT * FROM ReadyCars;

Equivalent to a subquery but more readable.

---

# 2. Recursive CTE

Used for:

- Organizational hierarchies
- Trees
- Graph traversal
- Generating sequences

Structure:

WITH RECURSIVE Name AS (
    Anchor query
    UNION ALL
    Recursive query referencing Name
)

The anchor starts the recursion.
The recursive part repeats until no new rows are produced.

---

# 3. Generating Numbers

Recursive CTEs can generate sequences:

WITH RECURSIVE Numbers(i) AS (
    SELECT 1
    UNION ALL
    SELECT i + 1 FROM Numbers WHERE i < 5
)
SELECT i FROM Numbers;

---

# 4. Refactoring Queries

Without CTE → large, complex query  
With CTE → broken into logical stages

This makes debugging much easier.

---

# Important Notes

- CTEs exist only for one query.
- They are not stored permanently.
- They execute each time they are referenced.
- They can sometimes improve readability more than performance.

---

# Mental Model

CTE = temporary named subquery  
Recursive CTE = loop written in SQL
