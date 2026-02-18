-- ========================================
-- Chapter 14: DELETE
-- Database: SQLite
-- ========================================

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Target;

-- ========================================
-- Setup Sample Tables
-- ========================================

CREATE TABLE Employees (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    FName TEXT NOT NULL,
    LName TEXT NOT NULL
);

INSERT INTO Employees (FName, LName) VALUES
('John', 'Doe'),
('Alice', 'Smith'),
('Bob', 'Brown'),
('John', 'Taylor');

CREATE TABLE Target (
    ID INTEGER
);

INSERT INTO Target VALUES (1), (3);

-- ========================================
-- 1. DELETE Certain Rows (Using WHERE)
-- ========================================

DELETE FROM Employees
WHERE FName = 'John';

-- View result
SELECT * FROM Employees;

-- ========================================
-- Reset Data
-- ========================================

DELETE FROM Employees;

INSERT INTO Employees (FName, LName) VALUES
('John', 'Doe'),
('Alice', 'Smith'),
('Bob', 'Brown'),
('John', 'Taylor');

-- ========================================
-- 2. DELETE All Rows
-- ========================================

DELETE FROM Employees;

SELECT * FROM Employees;

-- ========================================
-- Reset Again
-- ========================================

INSERT INTO Employees (FName, LName) VALUES
('John', 'Doe'),
('Alice', 'Smith'),
('Bob', 'Brown'),
('John', 'Taylor');

-- ========================================
-- 3. DELETE Using EXISTS
-- ========================================

DELETE FROM Employees
WHERE EXISTS (
    SELECT 1
    FROM Target
    WHERE Employees.ID = Target.ID
);

SELECT * FROM Employees;

-- ========================================
-- 4. DELETE Using NOT EXISTS
-- ========================================

-- Reset
DELETE FROM Employees;

INSERT INTO Employees (FName, LName) VALUES
('John', 'Doe'),
('Alice', 'Smith'),
('Bob', 'Brown'),
('John', 'Taylor');

DELETE FROM Employees
WHERE NOT EXISTS (
    SELECT 1
    FROM Target
    WHERE Employees.ID = Target.ID
);

SELECT * FROM Employees;
