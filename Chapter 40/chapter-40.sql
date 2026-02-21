-- =====================================================
-- Chapter 40: ORDER BY Examples
-- =====================================================

-- 1️⃣ Basic Sorting
SELECT DisplayName, Reputation
FROM Users
ORDER BY Reputation;

SELECT DisplayName, Reputation
FROM Users
ORDER BY Reputation DESC;

-- 2️⃣ Top N Results

-- SQL Server
SELECT TOP 5 DisplayName, Reputation
FROM Users
ORDER BY Reputation DESC;

-- MySQL
SELECT DisplayName, Reputation
FROM Users
ORDER BY Reputation DESC
LIMIT 5;

-- 3️⃣ Multiple Column Sorting
SELECT DisplayName, JoinDate, Reputation
FROM Users
ORDER BY JoinDate, Reputation;

-- 4️⃣ Column Position Sorting
SELECT DisplayName, JoinDate, Reputation
FROM Users
ORDER BY 3;

-- 5️⃣ Sorting Using Alias
SELECT DisplayName, JoinDate AS jd, Reputation AS rep
FROM Users
ORDER BY jd, rep;

-- Using positions
SELECT DisplayName, JoinDate AS jd, Reputation AS rep
FROM Users
ORDER BY 2, 3;

-- 6️⃣ Custom Sorting with CASE
SELECT Name, Department
FROM Employees
ORDER BY
  CASE Department
    WHEN 'IT' THEN 1
    WHEN 'HR' THEN 2
    ELSE 3
  END;

-- 7️⃣ ORDER BY with NULL values
SELECT Name, ManagerId
FROM Employees
ORDER BY ManagerId;
