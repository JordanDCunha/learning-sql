-- =========================================
-- CHAPTER 61 — UPDATE
-- Includes SQL Server, PostgreSQL, Oracle, MySQL examples
-- =========================================



-- =========================================
-- 🔹 BASIC UPDATE (ALL DATABASES)
-- =========================================

CREATE TABLE Cars (
    Id INT PRIMARY KEY,
    Model VARCHAR(50),
    Status VARCHAR(20),
    TotalCost DECIMAL(10,2)
);

-- Update ALL rows (No WHERE clause)
UPDATE Cars
SET Status = 'READY';

-- Update Specific Row
UPDATE Cars
SET Status = 'READY'
WHERE Id = 4;

-- Modify Existing Values
UPDATE Cars
SET TotalCost = TotalCost + 100
WHERE Id = 3 OR Id = 4;



-- =========================================
-- 🔹 STANDARD SQL (Correlated Subquery)
-- Works in SQL Server, PostgreSQL, Oracle, MySQL
-- =========================================

CREATE TABLE Employees (
    FName VARCHAR(30),
    LName VARCHAR(30),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Customers (
    FName VARCHAR(30),
    LName VARCHAR(30),
    PhoneNumber VARCHAR(20)
);

-- Update Employees using data from Customers
UPDATE Employees
SET PhoneNumber = (
    SELECT c.PhoneNumber
    FROM Customers c
    WHERE c.FName = Employees.FName
      AND c.LName = Employees.LName
)
WHERE PhoneNumber IS NULL;



-- =========================================
-- 🔹 SQL SERVER – UPDATE with JOIN
-- =========================================

UPDATE e
SET e.PhoneNumber = c.PhoneNumber
FROM Employees e
INNER JOIN Customers c
    ON e.FName = c.FName
    AND e.LName = c.LName
WHERE e.PhoneNumber IS NULL;



-- =========================================
-- 🔹 POSTGRESQL – UPDATE with FROM
-- =========================================

UPDATE Employees e
SET PhoneNumber = c.PhoneNumber
FROM Customers c
WHERE e.FName = c.FName
  AND e.LName = c.LName
  AND e.PhoneNumber IS NULL;



-- =========================================
-- 🔹 ORACLE – MERGE (SQL:2003 Standard)
-- =========================================

MERGE INTO Employees e
USING Customers c
ON (
    e.FName = c.FName
    AND e.LName = c.LName
    AND e.PhoneNumber IS NULL
)
WHEN MATCHED THEN
UPDATE SET e.PhoneNumber = c.PhoneNumber;



-- =========================================
-- 🔹 SQL SERVER – Capturing Updated Rows
-- =========================================

CREATE TABLE #TempUpdated (ID INT);

UPDATE Cars
SET Status = 'SOLD'
OUTPUT inserted.Id INTO #TempUpdated
WHERE Id > 50;



-- =========================================
-- 🔹 PERFORMANCE NOTE
-- =========================================

-- Always use a WHERE clause unless you truly intend
-- to update the entire table.

-- Good Practice:
UPDATE Cars
SET Status = 'READY'
WHERE Status IS NULL;

-- Dangerous:
UPDATE Cars
SET Status = 'READY';
