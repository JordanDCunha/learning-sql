-- ==========================================
-- Chapter 54 — Synonyms Examples
-- ==========================================

-- 1. Create a synonym for a table
CREATE SYNONYM EmployeeData
FOR MyDatabase.dbo.Employees;

-- Use the synonym
SELECT * FROM EmployeeData;


-- 2. Simplifying cross-database access
CREATE SYNONYM EmployeeRecords
FOR HRSystem.dbo.EmployeeRecords;

SELECT * FROM EmployeeRecords;


-- 3. Abstracting schema changes
CREATE SYNONYM CustomerData
FOR Sales.dbo.Customers;

-- Later, if table moves:
DROP SYNONYM CustomerData;

CREATE SYNONYM CustomerData
FOR Archive.dbo.Customers;


-- 4. Removing a synonym
DROP SYNONYM EmployeeData;
