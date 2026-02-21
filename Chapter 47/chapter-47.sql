-- =========================================
-- CHAPTER 47 — SKIP / TAKE (Pagination)
-- Includes: ANSI SQL, MySQL, PostgreSQL,
-- SQLite, Oracle, SQL Server
-- =========================================


-- =========================================
-- 🔹 SKIP ONLY
-- =========================================

-- ANSI SQL
SELECT Id, Col1
FROM TableName
ORDER BY Id
OFFSET 20 ROWS;


-- MySQL
SELECT *
FROM TableName
LIMIT 20, 1000000;


-- PostgreSQL
SELECT *
FROM TableName
OFFSET 20;


-- SQLite
SELECT *
FROM TableName
LIMIT -1 OFFSET 20;


-- Oracle (ROW_NUMBER method)
SELECT Id, Col1
FROM (
    SELECT Id, Col1,
           ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber
    FROM TableName
)
WHERE RowNumber > 20;



-- =========================================
-- 🔹 TAKE ONLY
-- =========================================

-- ANSI SQL
SELECT *
FROM TableName
FETCH FIRST 20 ROWS ONLY;


-- MySQL / PostgreSQL / SQLite
SELECT *
FROM TableName
LIMIT 20;


-- SQL Server
SELECT TOP 20 *
FROM TableName;


-- Oracle (ROW_NUMBER method)
SELECT Id, Col1
FROM (
    SELECT Id, Col1,
           ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber
    FROM TableName
)
WHERE RowNumber <= 20;



-- =========================================
-- 🔹 SKIP + TAKE (Full Pagination)
-- Example: Page 2, 20 rows per page
-- =========================================

-- ANSI SQL
SELECT Id, Col1
FROM TableName
ORDER BY Id
OFFSET 20 ROWS
FETCH NEXT 20 ROWS ONLY;


-- MySQL
SELECT *
FROM TableName
LIMIT 20, 20;


-- PostgreSQL
SELECT *
FROM TableName
OFFSET 20 LIMIT 20;


-- SQL Server (modern versions)
SELECT *
FROM TableName
ORDER BY Id
OFFSET 20 ROWS
FETCH NEXT 20 ROWS ONLY;


-- Oracle / SQL Server (ROW_NUMBER method)
SELECT Id, Col1
FROM (
    SELECT Id, Col1,
           ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber
    FROM TableName
)
WHERE RowNumber BETWEEN 21 AND 40;
