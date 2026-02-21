-- =====================================================
-- Chapter 39: NULL Examples
-- =====================================================

-- 1️⃣ Filtering for NULL
SELECT *
FROM Employees
WHERE ManagerId IS NULL;

SELECT *
FROM Employees
WHERE ManagerId IS NOT NULL;

-- 2️⃣ Incorrect Comparison (Do NOT use)
-- This always returns UNKNOWN
SELECT *
FROM Employees
WHERE ManagerId = NULL;

-- 3️⃣ Nullable vs NOT NULL Columns
CREATE TABLE MyTable (
    MyCol1 INT NOT NULL,
    MyCol2 INT NULL
);

INSERT INTO MyTable (MyCol1, MyCol2)
VALUES (1, NULL);

-- This will fail
-- INSERT INTO MyTable (MyCol1, MyCol2)
-- VALUES (NULL, 2);

-- 4️⃣ Update to NULL
UPDATE Employees
SET ManagerId = NULL
WHERE Id = 4;

-- 5️⃣ Insert with NULL values
INSERT INTO Employees
(Id, FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate)
VALUES
(5, 'Jane', 'Doe', NULL, NULL, 2, 800, '2016-07-22');

-- 6️⃣ NULL in Expressions
SELECT Salary + NULL
FROM Employees;

-- 7️⃣ Handling NULL with COALESCE
SELECT COALESCE(ManagerId, 0)
FROM Employees;

-- SQL Server only
SELECT ISNULL(ManagerId, 0)
FROM Employees;

-- MySQL only
SELECT IFNULL(ManagerId, 0)
FROM Employees;
