-- ==========================================
-- Chapter 53 — Subqueries Examples
-- ==========================================

-- 1. Subquery in WHERE (Max Salary)
SELECT *
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);


-- 2. Subquery in FROM (Derived Table)
SELECT Managers.Id, Employees.Salary
FROM (
    SELECT Id
    FROM Employees
    WHERE ManagerId IS NULL
) AS Managers
JOIN Employees 
    ON Managers.Id = Employees.Id;


-- 3. Subquery in SELECT (Calculated Column)
SELECT
    Id,
    FName,
    LName,
    (SELECT COUNT(*) 
     FROM Cars 
     WHERE Cars.CustomerId = Customers.Id) AS NumberOfCars
FROM Customers;


-- 4. Subquery in FROM with Filtering
SELECT *
FROM (
    SELECT city, temp_hi - temp_lo AS temp_var
    FROM weather
) AS w
WHERE temp_var > 20;


-- 5. Subquery with Aggregate Comparison
SELECT name, pop2000
FROM cities
WHERE pop2000 < (SELECT AVG(pop2000) FROM cities);


-- 6. Subquery in SELECT (Lookup Without JOIN)
SELECT 
    w.*, 
    (SELECT c.state 
     FROM cities AS c 
     WHERE c.name = w.city) AS state
FROM weather AS w;


-- 7. NOT IN Subquery
SELECT *
FROM Employees
WHERE EmployeeID NOT IN (
    SELECT EmployeeID 
    FROM Supervisors
);


-- 7b. Equivalent LEFT JOIN Version
SELECT *
FROM Employees AS e
LEFT JOIN Supervisors AS s
    ON s.EmployeeID = e.EmployeeID
WHERE s.EmployeeID IS NULL;


-- 8. Correlated Subquery
SELECT EmployeeId
FROM Employee AS eOuter
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee AS eInner
    WHERE eInner.DepartmentId = eOuter.DepartmentId
);
