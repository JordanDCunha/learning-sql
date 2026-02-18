-- ========================================
-- Chapter 8: Common Table Expressions (CTEs)
-- Database: SQLite
-- ========================================

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS sale;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;

-- ========================================
-- Sample Tables
-- ========================================

CREATE TABLE Employees (
    ID INTEGER PRIMARY KEY,
    FName TEXT,
    LName TEXT,
    ManagerID INTEGER
);

INSERT INTO Employees (ID, FName, LName, ManagerID) VALUES
(1, 'James', 'Smith', NULL),
(2, 'Alice', 'Brown', 1),
(3, 'Bob', 'White', 1),
(4, 'Jonathon', 'Taylor', 2),
(5, 'Emma', 'Wilson', 2);

CREATE TABLE Cars (
    ID INTEGER PRIMARY KEY,
    Model TEXT,
    Status TEXT,
    TotalCost INTEGER
);

INSERT INTO Cars (Model, Status, TotalCost) VALUES
('Ford F-150', 'READY', 200),
('Ford F-150', 'READY', 230),
('Tesla Model 3', 'SOLD', 500);

CREATE TABLE category (
    id INTEGER PRIMARY KEY,
    description TEXT
);

CREATE TABLE product (
    id INTEGER PRIMARY KEY,
    price INTEGER,
    category_id INTEGER
);

CREATE TABLE sale (
    id INTEGER PRIMARY KEY,
    product_id INTEGER
);

INSERT INTO category VALUES (1, 'Electronics'), (2, 'Books');

INSERT INTO product VALUES
(1, 10, 1),
(2, 15, 1),
(3, 5, 2);

INSERT INTO sale VALUES (1, 1), (2, 2), (3, 3);

-- ========================================
-- 1. Basic CTE
-- ========================================

WITH ReadyCars AS (
    SELECT *
    FROM Cars
    WHERE Status = 'READY'
)
SELECT ID, Model, TotalCost
FROM ReadyCars
ORDER BY TotalCost;

-- ========================================
-- 2. Equivalent Subquery
-- ========================================

SELECT ID, Model, TotalCost
FROM (
    SELECT *
    FROM Cars
    WHERE Status = 'READY'
) AS ReadyCars
ORDER BY TotalCost;

-- ========================================
-- 3. Recursive CTE (Managers of Jonathon)
-- ========================================

WITH RECURSIVE ManagersOfJonathon AS (
    SELECT *
    FROM Employees
    WHERE ID = 4

    UNION ALL

    SELECT e.*
    FROM Employees e
    JOIN ManagersOfJonathon m
         ON e.ID = m.ManagerID
)
SELECT *
FROM ManagersOfJonathon;

-- ========================================
-- 4. Generate Numbers 1–5
-- ========================================

WITH RECURSIVE Numbers(i) AS (
    SELECT 1
    UNION ALL
    SELECT i + 1
    FROM Numbers
    WHERE i < 5
)
SELECT i
FROM Numbers;

-- ========================================
-- 5. Recursively Enumerate Subtree
-- ========================================

WITH RECURSIVE ManagedByJames(Level, ID, FName, LName) AS (
    SELECT 1, ID, FName, LName
    FROM Employees
    WHERE ID = 1

    UNION ALL

    SELECT m.Level + 1,
           e.ID,
           e.FName,
           e.LName
    FROM Employees e
    JOIN ManagedByJames m
         ON e.ManagerID = m.ID
)
SELECT *
FROM ManagedByJames
ORDER BY Level DESC;

-- ========================================
-- 6. Refactoring Without CTE
-- ========================================

SELECT category.description,
       SUM(product.price) AS total_sales
FROM sale
LEFT JOIN product ON sale.product_id = product.id
LEFT JOIN category ON product.category_id = category.id
GROUP BY category.id, category.description
HAVING SUM(product.price) > 20;

-- ========================================
-- 7. Refactoring With CTE
-- ========================================

WITH all_sales AS (
    SELECT product.price,
           category.id AS category_id,
           category.description AS category_description
    FROM sale
    LEFT JOIN product ON sale.product_id = product.id
    LEFT JOIN category ON product.category_id = category.id
),
sales_by_category AS (
    SELECT category_description,
           SUM(price) AS total_sales
    FROM all_sales
    GROUP BY category_id, category_description
)
SELECT *
FROM sales_by_category
WHERE total_sales > 20;
