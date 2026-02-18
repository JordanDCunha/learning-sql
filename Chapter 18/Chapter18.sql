-- =========================================
-- Chapter 18: EXCEPT Operator
-- =========================================

-- Basic Example
-- EXCEPT returns rows from the first query
-- that do NOT appear in the second query.

SELECT 'Data1' AS `Column`
UNION ALL
SELECT 'Data2'
UNION ALL
SELECT 'Data3'
UNION ALL
SELECT 'Data4'
UNION ALL
SELECT 'Data5'
EXCEPT
SELECT 'Data3';


-- =========================================
-- Example 2: Using Tables (Practical Example)
-- =========================================

-- Create sample tables
DROP TABLE IF EXISTS Customers2023;
DROP TABLE IF EXISTS Customers2024;

CREATE TABLE Customers2023 (
    Name VARCHAR(50)
);

CREATE TABLE Customers2024 (
    Name VARCHAR(50)
);

INSERT INTO Customers2023 (Name)
VALUES
('Alice'),
('Bob'),
('Charlie'),
('David');

INSERT INTO Customers2024 (Name)
VALUES
('Bob'),
('David');

-- Find customers who ordered in 2023 but NOT in 2024
SELECT Name FROM Customers2023
EXCEPT
SELECT Name FROM Customers2024;


-- =========================================
-- Notes
-- =========================================
-- Both SELECT statements must:
-- 1. Return same number of columns
-- 2. Have compatible data types
-- 3. Column order must match
