-- ========================================
-- Chapter 7: SQL Comments
-- Database: SQLite
-- ========================================

DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    ID INTEGER PRIMARY KEY,
    FName TEXT,
    LName TEXT
);

INSERT INTO Employees (FName, LName)
VALUES
    ('John', 'Doe'),
    ('Alice', 'Smith');

-- ========================================
-- Single-line Comment Example
-- ========================================

SELECT *
FROM Employees -- This comment explains the query
WHERE FName = 'John';

-- ========================================
-- Multi-line Comment Example
-- ========================================

/*
This query
returns all employees
in the table.
*/

SELECT *
FROM Employees;
