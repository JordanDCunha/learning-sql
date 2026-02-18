-- ========================================
-- Chapter 5: CASE Expression
-- Database: SQLite
-- ========================================

DROP TABLE IF EXISTS ItemSales;
DROP TABLE IF EXISTS DEPT;
DROP TABLE IF EXISTS ItemPrice;
DROP TABLE IF EXISTS YourTable;

-- ========================================
-- Create ItemSales Table
-- ========================================

CREATE TABLE ItemSales (
    Id INTEGER PRIMARY KEY,
    ItemId INTEGER,
    Price REAL
);

INSERT INTO ItemSales (ItemId, Price)
VALUES
    (1, 34.5),
    (2, 2.3),
    (3, 10),
    (4, 18),
    (5, 25);

-- ========================================
-- Classify by Price (Searched CASE)
-- ========================================

SELECT Id, ItemId, Price,
CASE
    WHEN Price < 10 THEN 'CHEAP'
    WHEN Price < 20 THEN 'AFFORDABLE'
    ELSE 'EXPENSIVE'
END AS PriceRating
FROM ItemSales;

-- ========================================
-- Counting Using CASE (like COUNTIF)
-- ========================================

SELECT
    COUNT(Id) AS ItemsCount,
    SUM(CASE WHEN Price > 20 THEN 1 ELSE 0 END) AS ExpensiveItemsCount
FROM ItemSales;

-- ========================================
-- Shorthand (Simple) CASE
-- ========================================

SELECT Id, ItemId, Price,
CASE Price
    WHEN 5 THEN 'CHEAP'
    WHEN 15 THEN 'AFFORDABLE'
    ELSE 'EXPENSIVE'
END AS PriceRating
FROM ItemSales;

-- ========================================
-- Using CASE in ORDER BY
-- ========================================

CREATE TABLE DEPT (
    ID INTEGER PRIMARY KEY,
    DEPARTMENT TEXT,
    CITY TEXT,
    REGION TEXT
);

INSERT INTO DEPT (DEPARTMENT, CITY, REGION)
VALUES
    ('SALES', 'Paris', 'West'),
    ('MARKETING', 'Berlin', NULL),
    ('RESEARCH', 'Prague', 'East'),
    ('INNOVATION', 'Rome', NULL);

SELECT *
FROM DEPT
ORDER BY
CASE DEPARTMENT
    WHEN 'MARKETING' THEN 1
    WHEN 'SALES' THEN 2
    WHEN 'RESEARCH' THEN 3
    WHEN 'INNOVATION' THEN 4
    ELSE 5
END,
CITY;

-- ========================================
-- Sorting NULLs Last
-- ========================================

SELECT ID, REGION, CITY, DEPARTMENT
FROM DEPT
ORDER BY
CASE WHEN REGION IS NULL THEN 1 ELSE 0 END,
REGION;

-- ========================================
-- Using CASE in UPDATE
-- ========================================

CREATE TABLE ItemPrice (
    ItemId INTEGER PRIMARY KEY,
    Price REAL
);

INSERT INTO ItemPrice (ItemId, Price)
VALUES
    (1, 100),
    (2, 200),
    (3, 300);

UPDATE ItemPrice
SET Price = Price *
CASE ItemId
    WHEN 1 THEN 1.05
    WHEN 2 THEN 1.10
    WHEN 3 THEN 1.15
    ELSE 1.00
END;

SELECT * FROM ItemPrice;

-- ========================================
-- Compare Two Columns with CASE
-- ========================================

CREATE TABLE YourTable (
    Id INTEGER PRIMARY KEY,
    Date1 TEXT,
    Date2 TEXT
);

INSERT INTO YourTable (Date1, Date2)
VALUES
    ('2024-01-01', '2024-02-01'),
    (NULL, '2023-05-01'),
    ('2022-03-01', NULL);

SELECT Id, Date1, Date2
FROM YourTable
ORDER BY CASE
    WHEN COALESCE(Date1, '0001-01-01') < COALESCE(Date2, '0001-01-01') THEN Date1
    ELSE Date2
END;
