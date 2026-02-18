-- ========================================
-- Chapter 11: CREATE TABLE
-- Database: SQLite
-- ========================================

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Cities;
DROP TABLE IF EXISTS ClonedEmployees;
DROP TABLE IF EXISTS ModifiedEmployees;

-- ========================================
-- 1. Create a Basic Table
-- ========================================

CREATE TABLE Employees (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    FName TEXT NOT NULL,
    LName TEXT NOT NULL,
    PhoneNumber TEXT NOT NULL
);

INSERT INTO Employees (FName, LName, PhoneNumber)
VALUES
('John', 'Doe', '1234567890'),
('Alice', 'Smith', '9876543210'),
('Bob', 'Brown', '5555555555');

-- ========================================
-- 2. Duplicate a Table
-- ========================================

CREATE TABLE ClonedEmployees AS
SELECT *
FROM Employees;

-- ========================================
-- 3. Create Modified Table
-- ========================================

CREATE TABLE ModifiedEmployees AS
SELECT
    Id,
    FName || ' ' || LName AS FullName
FROM Employees
WHERE Id > 1;

-- ========================================
-- 4. Create Table with FOREIGN KEY
-- ========================================

CREATE TABLE Cities (
    CityID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Zip TEXT NOT NULL
);

INSERT INTO Cities (Name, Zip)
VALUES
('Toronto', 'M5H'),
('Vancouver', 'V5K');

CREATE TABLE EmployeesWithCity (
    EmployeeID INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    PhoneNumber TEXT NOT NULL,
    CityID INTEGER,
    FOREIGN KEY (CityID) REFERENCES Cities(CityID)
);

INSERT INTO EmployeesWithCity
(FirstName, LastName, PhoneNumber, CityID)
VALUES
('Emma', 'Wilson', '2223334444', 1),
('Liam', 'Taylor', '1112223333', 2);

-- View result
SELECT *
FROM EmployeesWithCity;
