-- =========================================
-- CHAPTER 45 — SELECT Examples
-- Compatible with: SQL Server, Oracle, SQLite, PostgreSQL, MySQL
-- (LIMIT syntax may vary slightly by system)
-- =========================================


-- 1️⃣ Basic SELECT
SELECT Name, SerialNumber
FROM ArmyInfo;


-- 2️⃣ Select All Columns
SELECT *
FROM ArmyInfo;


-- 3️⃣ SELECT with JOIN
SELECT Employees.*, Departments.Name
FROM Employees
JOIN Departments ON Departments.Id = Employees.DeptId;


-- 4️⃣ WHERE Clause
SELECT *
FROM Cars
WHERE status = 'READY';


-- 5️⃣ WHERE with NULL
SELECT Name
FROM Customers
WHERE PhoneNumber IS NULL;


-- 6️⃣ Aliases + LEFT JOIN
SELECT c.Email, o.Id AS OrderId
FROM Customers c
LEFT JOIN Orders o ON o.CustomerId = c.Id;


-- 7️⃣ Column Aliases
SELECT 
    FName AS "First Name",
    LName AS "Last Name"
FROM Employees;


-- 8️⃣ ORDER BY
SELECT *
FROM Employees
ORDER BY LName ASC;


-- 9️⃣ ORDER BY Multiple Columns
SELECT *
FROM Employees
ORDER BY LName ASC, FName ASC;


-- 🔟 Top 10 (SQLite / PostgreSQL / MySQL)
SELECT Id, ProductName
FROM Product
ORDER BY UnitPrice DESC
LIMIT 10;


-- 🔟 (SQL Server Equivalent)
-- SELECT TOP 10 Id, ProductName
-- FROM Product
-- ORDER BY UnitPrice DESC;


-- 🔟 (Oracle Equivalent)
-- SELECT *
-- FROM (
--     SELECT Id, ProductName
--     FROM Product
--     ORDER BY UnitPrice DESC
-- )
-- WHERE ROWNUM <= 10;


-- 1️⃣1️⃣ CASE Example
SELECT
    CASE 
        WHEN Salary < 50000 THEN 'Low'
        WHEN Salary < 100000 THEN 'Medium'
        ELSE 'High'
    END AS SalaryRange
FROM Employees;


-- 1️⃣2️⃣ Aggregate Examples
SELECT AVG(Salary) AS AvgSalary FROM Employees;
SELECT MIN(Salary) AS MinSalary FROM Employees;
SELECT MAX(Salary) AS MaxSalary FROM Employees;
SELECT SUM(Salary) AS TotalSalary FROM Employees;
SELECT COUNT(*) AS TotalEmployees FROM Employees;
