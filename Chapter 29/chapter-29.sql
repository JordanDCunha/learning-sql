-- =====================================================
-- Chapter 29 — GROUP BY
-- Multi-Database Reference
-- =====================================================



-- =====================================================
-- 1️⃣ BASIC GROUP BY (ALL DATABASES)
-- Works in:
-- SQL Server, PostgreSQL, MySQL, Oracle, SQLite
-- =====================================================

-- Count rows per group
SELECT GreatHouseAllegience AS House,
       COUNT(*) AS Number_of_Westerosians
FROM Westerosians
GROUP BY GreatHouseAllegience;


-- Add ORDER BY
SELECT GreatHouseAllegience AS House,
       COUNT(*) AS Number_of_Westerosians
FROM Westerosians
GROUP BY GreatHouseAllegience
ORDER BY Number_of_Westerosians DESC;


-- GROUP BY with JOIN
SELECT a.Id,
       a.Name,
       COUNT(*) AS BooksWritten
FROM BooksAuthors ba
JOIN Authors a ON a.Id = ba.AuthorId
GROUP BY a.Id, a.Name
HAVING COUNT(*) > 1;


-- Example: books with more than 3 authors
SELECT b.Id,
       b.Title,
       COUNT(*) AS NumberOfAuthors
FROM BooksAuthors ba
JOIN Books b ON b.Id = ba.BookId
GROUP BY b.Id, b.Title
HAVING COUNT(*) > 3;


-- “For each” example
SELECT EmpID,
       SUM(MonthlySalary) AS TotalSalary
FROM Employee
GROUP BY EmpID;



-- =====================================================
-- 2️⃣ SQL SERVER (T-SQL)
-- =====================================================

-- ROLLUP
SELECT Food,
       Brand,
       SUM(Total_amount) AS Total
FROM Sales
GROUP BY ROLLUP (Food, Brand);

-- CUBE
SELECT Food,
       Brand,
       SUM(Total_amount) AS Total
FROM Sales
GROUP BY CUBE (Food, Brand);

-- GROUPING SETS
SELECT Food,
       Brand,
       SUM(Total_amount) AS Total
FROM Sales
GROUP BY GROUPING SETS (
    (Food, Brand),
    (Food),
    ()
);



-- =====================================================
-- 3️⃣ POSTGRESQL
-- =====================================================

-- ROLLUP
SELECT Food,
       Brand,
       SUM(Total_amount) AS Total
FROM Sales
GROUP BY ROLLUP (Food, Brand);

-- CUBE
SELECT Food,
       Brand,
       SUM(Total_amount) AS Total
FROM Sales
GROUP BY CUBE (Food, Brand);

-- GROUPING SETS
SELECT Food,
       Brand,
       SUM(Total_amount) AS Total
FROM Sales
GROUP BY GROUPING SETS (
    (Food, Brand),
    (Food),
    ()
);



-- =====================================================
-- 4️⃣ ORACLE
-- =====================================================

-- ROLLUP
SELECT Food,
       Brand,
       SUM(Total_amount) AS Total
FROM Sales
GROUP BY ROLLUP (Food, Brand);

-- CUBE
SELECT Food,
       Brand,
       SUM(Total_amount) AS Total
FROM Sales
GROUP BY CUBE (Food, Brand);

-- GROUPING SETS
SELECT Food,
       Brand,
       SUM(Total_amount) AS Total
FROM Sales
GROUP BY GROUPING SETS (
    (Food, Brand),
    (Food),
    ()
);



-- =====================================================
-- 5️⃣ MYSQL
-- =====================================================

-- Basic GROUP BY works in all versions

-- ROLLUP (supported)
SELECT Food,
       Brand,
       SUM(Total_amount) AS Total
FROM Sales
GROUP BY Food, Brand WITH ROLLUP;

-- MySQL does NOT support CUBE (as of current versions)
-- No native GROUPING SETS support



-- =====================================================
-- 6️⃣ SQLITE
-- =====================================================

-- Supports:
-- ✔ Basic GROUP BY
-- ✔ HAVING
-- ✔ ORDER BY

-- Does NOT support:
-- ✖ ROLLUP
-- ✖ CUBE
-- ✖ GROUPING SETS

-- SQLite only supports standard grouping:

SELECT Food,
       Brand,
       SUM(Total_amount) AS Total
FROM Sales
GROUP BY Food, Brand;
