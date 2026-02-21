-- =========================================
-- CHAPTER 60 — UNION / UNION ALL
-- Includes SQL Server, PostgreSQL, Oracle, MySQL examples
-- =========================================



-- =========================================
-- 🔹 SQL SERVER EXAMPLE
-- =========================================

CREATE TABLE HR_EMPLOYEES (
    PersonID INT,
    LastName VARCHAR(30),
    FirstName VARCHAR(30),
    Position VARCHAR(30)
);

CREATE TABLE FINANCE_EMPLOYEES (
    PersonID INT,
    LastName VARCHAR(30),
    FirstName VARCHAR(30),
    Position VARCHAR(30)
);

-- Retrieve all managers (duplicates allowed)
SELECT FirstName, LastName
FROM HR_EMPLOYEES
WHERE Position = 'manager'

UNION ALL

SELECT FirstName, LastName
FROM FINANCE_EMPLOYEES
WHERE Position = 'manager';



-- =========================================
-- 🔹 POSTGRESQL EXAMPLE
-- =========================================

CREATE TABLE hr_employees (
    personid INT,
    lastname VARCHAR(30),
    firstname VARCHAR(30),
    position VARCHAR(30)
);

CREATE TABLE finance_employees (
    personid INT,
    lastname VARCHAR(30),
    firstname VARCHAR(30),
    position VARCHAR(30)
);

SELECT firstname, lastname
FROM hr_employees
WHERE position = 'manager'

UNION

SELECT firstname, lastname
FROM finance_employees
WHERE position = 'manager';



-- =========================================
-- 🔹 ORACLE EXAMPLE
-- =========================================

CREATE TABLE HR_EMPLOYEES (
    PersonID NUMBER,
    LastName VARCHAR2(30),
    FirstName VARCHAR2(30),
    Position VARCHAR2(30)
);

CREATE TABLE FINANCE_EMPLOYEES (
    PersonID NUMBER,
    LastName VARCHAR2(30),
    FirstName VARCHAR2(30),
    Position VARCHAR2(30)
);

SELECT FirstName, LastName
FROM HR_EMPLOYEES
WHERE Position = 'manager'

UNION ALL

SELECT FirstName, LastName
FROM FINANCE_EMPLOYEES
WHERE Position = 'manager';



-- =========================================
-- 🔹 MYSQL EXAMPLE
-- =========================================

CREATE TABLE HR_EMPLOYEES (
    PersonID INT,
    LastName VARCHAR(30),
    FirstName VARCHAR(30),
    Position VARCHAR(30)
);

CREATE TABLE FINANCE_EMPLOYEES (
    PersonID INT,
    LastName VARCHAR(30),
    FirstName VARCHAR(30),
    Position VARCHAR(30)
);

SELECT FirstName, LastName
FROM HR_EMPLOYEES
WHERE Position = 'manager'

UNION ALL

SELECT FirstName, LastName
FROM FINANCE_EMPLOYEES
WHERE Position = 'manager';



-- =========================================
-- 🔹 PERFORMANCE EXAMPLES
-- =========================================

-- When you need unique results
SELECT C1, C2, C3 FROM Table1 WHERE C1 = @Param1
UNION
SELECT C1, C2, C3 FROM Table1 WHERE C2 = @Param2;

-- When duplicates are acceptable (faster)
SELECT C1 FROM Table1
UNION ALL
SELECT C1 FROM Table2;
