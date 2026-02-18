# Chapter 23: Finding Duplicates on a Column

## Concept Overview

Goal:
Find duplicate rows based on selected columns.

Example:
Duplicate students with the same:
- FirstName
- LastName
- DateOfBirth

We use:
- CTE (Common Table Expression)
- Window Functions
- GROUP BY + HAVING

---

# Example Table: tblStudent

| StudentId | FirstName | LastName | DateOfBirth |
|------------|------------|----------|-------------|
| 1 | John | Smith | 2004-05-12 |
| 2 | Emma | Brown | 2003-11-02 |
| 3 | John | Smith | 2004-05-12 |
| 4 | Ava | Wilson | 2002-08-22 |
| 5 | Emma | Brown | 2003-11-02 |

Duplicates:
- John Smith (2004-05-12)
- Emma Brown (2003-11-02)

---

# Method 1: CTE + Window Function

```sql
WITH CTE AS (
    SELECT 
        StudentId,
        FirstName,
        LastName,
        DateOfBirth,
        SUM(1) OVER (
            PARTITION BY FirstName, LastName, DateOfBirth
        ) AS RowCnt
    FROM tblStudent
)

SELECT *
FROM CTE
WHERE RowCnt > 1;
