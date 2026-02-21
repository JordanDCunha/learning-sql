-- =====================================================
-- Chapter 43: Relational Algebra SQL Equivalents
-- =====================================================

-- Assume tables:
-- People(PersonID, PersonName, StartYear, DepartmentID)
-- Departments(ID, Dept)

-- 1️⃣ SELECT (σ)
SELECT *
FROM People
WHERE DepartmentID = 2;

SELECT *
FROM People
WHERE StartYear > 2005
  AND DepartmentID = 2;

-- 2️⃣ PROJECT (π)
SELECT DISTINCT StartYear
FROM People;

-- 3️⃣ JOIN (⨝)
SELECT *
FROM People
JOIN Departments
  ON People.DepartmentID = Departments.ID;

-- 4️⃣ Combined Example

-- Goal:
-- Names of people who started in 2005
-- and belong to Production department

SELECT PersonName
FROM People
JOIN Departments
  ON People.DepartmentID = Departments.ID
WHERE StartYear = 2005
  AND Dept = 'Production';
