# Chapter 22: Filtering Results using WHERE and HAVING

## Purpose

This chapter covers how to filter query results using:

- WHERE (row-level filtering)
- HAVING (group-level filtering)
- Logical operators (AND, OR)
- Pattern matching (LIKE)
- Range filtering (BETWEEN)
- List filtering (IN)
- NULL handling
- EXISTS subqueries

---

# WHERE Clause

Filters individual rows BEFORE grouping or aggregation.

### Example

```sql
SELECT *
FROM Items
WHERE Price < 10;
