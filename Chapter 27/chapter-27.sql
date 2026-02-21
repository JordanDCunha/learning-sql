-- ========================================
-- Chapter 27: Scalar (Single-Row) Functions
-- Database: SQLite
-- ========================================

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    ID INTEGER PRIMARY KEY,
    Name TEXT,
    HireDate TEXT,
    SalesYTD INTEGER
);

INSERT INTO Employee VALUES
(1, 'Alice', '2017-01-14', 250000),
(2, 'Bob', '2018-03-10', 150000),
(3, 'Charlie', '2019-06-22', 50000);

-- ========================================
-- CAST (SQLite supports CAST)
-- ========================================

SELECT CAST(HireDate AS TEXT) AS HireDateText
FROM Employee;

-- ========================================
-- Current Date (SQLite equivalent of GETDATE)
-- ========================================

SELECT datetime('now') AS SystemDate;

-- ========================================
-- Date Part Extraction (DATENAME equivalent)
-- ========================================

SELECT strftime('%w', '2017-01-14') AS WeekdayNumber;

-- ========================================
-- Date Difference (DATEDIFF equivalent)
-- ========================================

SELECT julianday('2017-02-03') - julianday('2017-01-14') AS DaysDifference;

-- ========================================
-- Date Add (DATEADD equivalent)
-- ========================================

SELECT date('2017-01-14', '+20 days') AS NewDate;

-- ========================================
-- IIF (SQLite supports IIF in newer versions)
-- ========================================

SELECT ID,
       SalesYTD,
       IIF(SalesYTD > 200000, 'Bonus', 'No Bonus') AS BonusStatus
FROM Employee;

-- ========================================
-- SIGN (Simulated in SQLite)
-- ========================================

SELECT CASE
           WHEN -20 > 0 THEN 1
           WHEN -20 < 0 THEN -1
           ELSE 0
       END AS SignResult;

-- ========================================
-- POWER
-- ========================================

SELECT POWER(50, 3) AS Result;
