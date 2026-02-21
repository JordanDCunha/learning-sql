-- =====================================================
-- Chapter 36: LIKE Operator Examples
-- Portable Core + DB-Specific Sections
-- =====================================================

-- 1️⃣ Basic % wildcard
SELECT * 
FROM Employees
WHERE FName LIKE '%on%';

-- 2️⃣ Starts with pattern
SELECT * 
FROM Employees
WHERE PhoneNumber LIKE '246%';

-- 3️⃣ Ends with pattern
SELECT * 
FROM Employees
WHERE PhoneNumber LIKE '%11';

-- 4️⃣ Single character wildcard
SELECT * 
FROM Employees
WHERE FName LIKE '__n%';

-- =====================================================
-- SQL Server Only: [ ] Pattern Matching
-- =====================================================

SELECT * 
FROM Employees
WHERE FName LIKE '[A-F]%';

SELECT * 
FROM Employees
WHERE FName LIKE '[^a-g]ary';

-- =====================================================
-- PostgreSQL Only: LIKE ANY / ALL
-- =====================================================

SELECT *
FROM customer_table
WHERE full_address LIKE ALL (ARRAY['%london%', '%road%']);

-- Case-insensitive search (PostgreSQL)
SELECT *
FROM Employees
WHERE FName ILIKE '%john%';

-- =====================================================
-- ESCAPE Example (All Major DBs)
-- =====================================================

SELECT *
FROM Products
WHERE ProductCode LIKE '%\%%' ESCAPE '\';
