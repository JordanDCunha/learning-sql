-- ========================================
-- Chapter 26: Analytic (Window) Functions
-- Database: SQLite 3.25+
-- ========================================

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    BusinessEntityID INTEGER PRIMARY KEY,
    JobTitle TEXT,
    TerritoryID INTEGER,
    SalesYTD INTEGER,
    SickLeaveHours INTEGER
);

INSERT INTO employees VALUES
(1, 'Manager', 1, 50000, 10),
(2, 'Manager', 1, 60000, 5),
(3, 'Sales Rep', 2, 45000, 20),
(4, 'Sales Rep', 2, 70000, 15),
(5, 'Sales Rep', 3, 30000, 25);

-- ========================================
-- FIRST_VALUE()
-- ========================================

SELECT BusinessEntityID,
       SalesYTD,
       FIRST_VALUE(SalesYTD) OVER (
           ORDER BY SalesYTD ASC
       ) AS LowestSales
FROM employees;

-- ========================================
-- LAST_VALUE()
-- (Correct frame definition required)
-- ========================================

SELECT BusinessEntityID,
       SalesYTD,
       LAST_VALUE(SalesYTD) OVER (
           ORDER BY SalesYTD
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND UNBOUNDED FOLLOWING
       ) AS HighestSales
FROM employees;

-- ========================================
-- LAG() / LEAD()
-- ========================================

SELECT BusinessEntityID,
       SalesYTD,
       LAG(SalesYTD, 1, 0) OVER (ORDER BY BusinessEntityID) AS PreviousSales,
       LEAD(SalesYTD, 1, 0) OVER (ORDER BY BusinessEntityID) AS NextSales
FROM employees;

-- ========================================
-- PERCENT_RANK()
-- ========================================

SELECT BusinessEntityID,
       JobTitle,
       SickLeaveHours,
       PERCENT_RANK() OVER (
           PARTITION BY JobTitle
           ORDER BY SickLeaveHours DESC
       ) AS PercentRank
FROM employees;

-- ========================================
-- CUME_DIST()
-- ========================================

SELECT BusinessEntityID,
       JobTitle,
       SickLeaveHours,
       CUME_DIST() OVER (
           PARTITION BY JobTitle
           ORDER BY SickLeaveHours DESC
       ) AS CumeDistribution
FROM employees;
