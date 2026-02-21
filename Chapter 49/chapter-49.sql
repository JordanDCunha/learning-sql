-- =========================================
-- CHAPTER 49 — GROUP BY vs DISTINCT
-- Compatible with: SQL Server, Oracle,
-- PostgreSQL, MySQL, SQLite
-- =========================================


-- =========================================
-- 🔹 DISTINCT EXAMPLES
-- =========================================

-- Unique store-user combinations
SELECT DISTINCT storeName, userId
FROM Orders;

-- Unique products sold
SELECT DISTINCT productName
FROM Orders;

-- Unique job titles
SELECT DISTINCT jobTitle
FROM Employees;



-- =========================================
-- 🔹 GROUP BY EXAMPLES
-- =========================================

-- Number of orders per store
SELECT storeName,
       COUNT(*) AS TotalOrders
FROM Orders
GROUP BY storeName;


-- Average order value per store
SELECT storeName,
       AVG(orderValue) AS AvgOrderValue
FROM Orders
GROUP BY storeName;


-- First and last purchase date per user
SELECT userId,
       MIN(orderDate) AS FirstPurchase,
       MAX(orderDate) AS LastPurchase
FROM Orders
GROUP BY userId;


-- Multiple aggregates together
SELECT storeName,
       COUNT(*) AS TotalOrders,
       SUM(orderValue) AS TotalRevenue,
       AVG(orderValue) AS AvgOrderValue,
       MIN(orderValue) AS MinOrder,
       MAX(orderValue) AS MaxOrder
FROM Orders
GROUP BY storeName;
