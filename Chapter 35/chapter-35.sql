-- =====================================================
-- Chapter 35: JOIN Examples (Portable SQL Versions)
-- Works across SQL Server / PostgreSQL / MySQL / SQLite
-- =====================================================

-- 1️⃣ INNER JOIN
SELECT e.FName, d.Name
FROM Employees e
JOIN Departments d
    ON e.DepartmentId = d.Id;

-- 2️⃣ LEFT OUTER JOIN
SELECT d.Name, e.FName
FROM Departments d
LEFT JOIN Employees e
    ON d.Id = e.DepartmentId;

-- 3️⃣ RIGHT OUTER JOIN
-- (Supported in SQL Server, PostgreSQL, MySQL)
SELECT e.FName, d.Name
FROM Employees e
RIGHT JOIN Departments d
    ON e.DepartmentId = d.Id;

-- 4️⃣ FULL OUTER JOIN
-- (SQL Server / PostgreSQL only)
SELECT *
FROM Table1 t1
FULL JOIN Table2 t2
    ON t1.Id = t2.Id;

-- 5️⃣ CROSS JOIN
SELECT d.Name, e.FName
FROM Departments d
CROSS JOIN Employees e;

-- 6️⃣ SELF JOIN
SELECT
    e.FName AS Employee,
    m.FName AS Manager
FROM Employees e
JOIN Employees m
    ON e.ManagerId = m.Id;

-- 7️⃣ JOIN with Subquery
SELECT po.Id, po.PODate, item.ItemNo
FROM PurchaseOrders po
LEFT JOIN (
    SELECT l.PurchaseOrderId,
           l.ItemNo,
           MIN(l.Id) AS MinId
    FROM PurchaseOrderLineItems l
    GROUP BY l.PurchaseOrderId, l.ItemNo
) item
    ON item.PurchaseOrderId = po.Id;

-- 8️⃣ RECURSIVE CTE (PostgreSQL / SQLite / MySQL 8+)
WITH RECURSIVE MyDescendants AS (
    SELECT Name
    FROM People
    WHERE Name = 'John Doe'
    UNION ALL
    SELECT p.Name
    FROM People p
    JOIN MyDescendants d
        ON p.Parent = d.Name
)
SELECT * FROM MyDescendants;
