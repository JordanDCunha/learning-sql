-- =====================================================
-- Chapter 41: Order of Execution Examples
-- =====================================================

-- Example demonstrating logical order
SELECT DepartmentId, COUNT(*) AS EmpCount
FROM Employees
WHERE Salary > 500
GROUP BY DepartmentId
HAVING COUNT(*) > 3
ORDER BY EmpCount DESC;

-- ❌ Alias cannot be used in WHERE
SELECT Salary * 12 AS AnnualSalary
FROM Employees
-- WHERE AnnualSalary > 50000;  -- Invalid

-- ✅ Correct approach
SELECT Salary * 12 AS AnnualSalary
FROM Employees
WHERE Salary * 12 > 50000;

-- WHERE filters rows
SELECT *
FROM Employees
WHERE Salary > 500;

-- HAVING filters groups
SELECT DepartmentId, COUNT(*)
FROM Employees
GROUP BY DepartmentId
HAVING COUNT(*) > 5;
