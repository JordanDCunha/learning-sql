-- =====================================================
-- Chapter 44: ROW_NUMBER Examples
-- =====================================================

-- 1️⃣ Row numbers without partition
SELECT
    ROW_NUMBER() OVER (ORDER BY Fname ASC) AS RowNumber,
    Fname,
    LName
FROM Employees;

-- 2️⃣ Row numbers with partition
SELECT
    ROW_NUMBER() OVER (
        PARTITION BY DepartmentId
        ORDER BY Fname ASC
    ) AS RowNumber,
    DepartmentId,
    Fname,
    LName
FROM Employees;

-- 3️⃣ Remove duplicates example

WITH cte AS (
    SELECT ProjectID,
           ROW_NUMBER() OVER (
               PARTITION BY ProjectID
               ORDER BY InsertDate DESC
           ) AS rn
    FROM ProjectNotes
)
DELETE FROM cte
WHERE rn > 1;

-- 4️⃣ Pagination Example

WITH numbered AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY Id) AS rn
    FROM Employees
)
SELECT *
FROM numbered
WHERE rn BETWEEN 11 AND 20;
