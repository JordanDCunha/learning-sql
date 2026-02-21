-- =========================================
-- CHAPTER 62 — VIEWS
-- Includes SQL Server, PostgreSQL, Oracle, MySQL examples
-- =========================================



-- =========================================
-- 🔹 BASIC TABLE SETUP (ALL DATABASES)
-- =========================================

CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    FName VARCHAR(50),
    Salary DECIMAL(10,2),
    Hire_Date DATE,
    DepartmentId INT
);

CREATE TABLE Departments (
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);



-- =========================================
-- 🔹 SIMPLE VIEW (ALL DATABASES)
-- =========================================

-- Employees hired after Jan 1, 2015
CREATE VIEW new_employees_details AS
SELECT 
    E.Id,
    E.FName,
    E.Salary,
    E.Hire_Date
FROM Employees E
WHERE E.Hire_Date > '2015-01-01';

-- Query the View
SELECT * FROM new_employees_details;



-- =========================================
-- 🔹 COMPLEX VIEW (JOIN + AGGREGATION)
-- =========================================

CREATE VIEW dept_income AS
SELECT 
    d.Name AS DepartmentName,
    SUM(e.Salary) AS TotalSalary
FROM Employees e
JOIN Departments d 
    ON e.DepartmentId = d.Id
GROUP BY d.Name;

-- Query the Complex View
SELECT * FROM dept_income;



-- =========================================
-- 🔹 SQL SERVER – ALTER VIEW
-- =========================================

ALTER VIEW new_employees_details AS
SELECT 
    Id,
    FName,
    Salary
FROM Employees
WHERE Hire_Date > '2018-01-01';



-- =========================================
-- 🔹 ORACLE – FORCE VIEW (Creates even if base table missing)
-- =========================================

CREATE OR REPLACE VIEW new_employees_details AS
SELECT 
    Id,
    FName,
    Salary,
    Hire_Date
FROM Employees
WHERE Hire_Date > DATE '2015-01-01';



-- =========================================
-- 🔹 POSTGRESQL – CREATE OR REPLACE VIEW
-- =========================================

CREATE OR REPLACE VIEW new_employees_details AS
SELECT 
    Id,
    FName,
    Salary,
    Hire_Date
FROM Employees
WHERE Hire_Date > '2015-01-01';



-- =========================================
-- 🔹 MYSQL – CREATE OR REPLACE VIEW
-- =========================================

CREATE OR REPLACE VIEW new_employees_details AS
SELECT 
    Id,
    FName,
    Salary,
    Hire_Date
FROM Employees
WHERE Hire_Date > '2015-01-01';



-- =========================================
-- 🔹 UPDATABLE VIEW EXAMPLE (Simple View Only)
-- =========================================

-- This works only if the view:
-- - References one table
-- - Has no GROUP BY
-- - Has no DISTINCT
-- - Has no aggregate functions

UPDATE new_employees_details
SET Salary = Salary + 100
WHERE Id = 4;



-- =========================================
-- 🔹 DROPPING A VIEW
-- =========================================

-- SQL Server / PostgreSQL / MySQL
DROP VIEW new_employees_details;

-- Oracle
DROP VIEW new_employees_details;



-- =========================================
-- 🔹 SECURITY EXAMPLE
-- =========================================

-- Hide salary column from users
CREATE VIEW employee_public_info AS
SELECT Id, FName, Hire_Date
FROM Employees;

-- Grant access to view instead of table
-- (Syntax varies by DBMS)
-- SQL Server / PostgreSQL:
-- GRANT SELECT ON employee_public_info TO some_user;
