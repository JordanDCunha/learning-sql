-- =====================================================
-- Chapter 30 — Identifiers
-- Multi-Database Reference
-- =====================================================



-- =====================================================
-- 1️⃣ BASIC IDENTIFIERS (Works Everywhere)
-- =====================================================

-- Valid identifiers
CREATE TABLE Customers (
    customer_id INT,
    order2025 INT,
    employee_salary DECIMAL(10,2)
);

-- Invalid examples (will fail in most systems)

-- CREATE TABLE 2employees (id INT);       -- ❌ Cannot start with number
-- CREATE TABLE total$revenue (id INT);    -- ❌ Illegal symbol in many systems



-- =====================================================
-- 2️⃣ QUOTED IDENTIFIERS
-- =====================================================

-- SQL Standard (PostgreSQL, Oracle, SQLite)
CREATE TABLE "Weird-Name!" (
    "Column With Spaces" INT
);

SELECT "Column With Spaces"
FROM "Weird-Name!";


-- SQL Server (uses brackets OR quotes if QUOTED_IDENTIFIER ON)

CREATE TABLE [Weird-Name!] (
    [Column With Spaces] INT
);

SELECT [Column With Spaces]
FROM [Weird-Name!];



-- =====================================================
-- 3️⃣ CASE BEHAVIOR BY SYSTEM
-- =====================================================

-- PostgreSQL:
-- Unquoted identifiers → converted to lowercase
CREATE TABLE MyTable (Id INT);
-- Actually stored as: mytable

-- Oracle:
-- Unquoted identifiers → converted to UPPERCASE
CREATE TABLE MyTable (Id NUMBER);
-- Actually stored as: MYTABLE

-- MySQL:
-- Case sensitivity depends on OS and configuration
-- (Linux often case-sensitive for table names)

-- SQLite:
-- Case preserved, but comparisons are case-insensitive (ASCII)

-- SQL Server:
-- Case sensitivity depends on database collation



-- =====================================================
-- 4️⃣ BEST PRACTICE NAMING EXAMPLES
-- =====================================================

-- snake_case
CREATE TABLE employee_first_name (
    id INT
);

-- PascalCase
CREATE TABLE EmployeeFirstName (
    Id INT
);

-- camelCase
CREATE TABLE employeeFirstName (
    id INT
);

-- Avoid:
-- Spaces
-- Special characters (#, $, %, !)
-- Inconsistent casing



-- =====================================================
-- 5️⃣ IMPORTANT RULES
-- =====================================================

-- ✔ Must start with a letter
-- ✔ Use letters, numbers, underscore
-- ✔ Avoid quotes unless necessary
-- ✔ Be consistent in naming style
