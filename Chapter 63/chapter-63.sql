-- =========================================
-- CHAPTER 63 — WINDOW FUNCTIONS
-- Includes SQL Server, PostgreSQL, Oracle, MySQL examples
-- =========================================



-- =========================================
-- 🔹 BASIC SAMPLE TABLES
-- =========================================

CREATE TABLE items (
    id INT,
    name VARCHAR(50),
    tag VARCHAR(50)
);

CREATE TABLE operations (
    date DATE,
    amount INT
);

CREATE TABLE Data (
    User_ID INT,
    Completion_Date DATE
);



-- =========================================
-- 🔹 TOTAL ROW COUNT
-- =========================================

SELECT *,
       COUNT(*) OVER() AS Ttl_Rows
FROM items;



-- =========================================
-- 🔹 PARTITION EXAMPLE
-- =========================================

SELECT id, name, tag,
       COUNT(*) OVER (PARTITION BY tag) AS tag_count
FROM items;



-- =========================================
-- 🔹 RUNNING TOTAL
-- =========================================

SELECT date, amount,
       SUM(amount) OVER (ORDER BY date ASC) AS running_total
FROM operations
ORDER BY date ASC;



-- =========================================
-- 🔹 TOP N PER GROUP
-- =========================================

WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY User_ID
               ORDER BY Completion_Date DESC
           ) AS Row_Num
    FROM Data
)
SELECT *
FROM CTE
WHERE Row_Num <= 1;



-- =========================================
-- 🔹 LAG() EXAMPLE
-- =========================================

SELECT *,
       LAG(amount) OVER (
           ORDER BY date
       ) AS previous_amount
FROM operations;
