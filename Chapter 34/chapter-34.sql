-- =====================================================
-- Chapter 34 — INSERT
-- Multi-Database Reference
-- =====================================================
-- Works in:
-- SQL Server | PostgreSQL | MySQL | Oracle | SQLite
-- =====================================================



-- =====================================================
-- 1️⃣ BASIC INSERT (ALL COLUMNS)
-- =====================================================

INSERT INTO Customers
VALUES ('Zack', 'Smith', 'zack@example.com', '7049989942', 'EMAIL');

-- Must match:
-- ✔ Number of columns
-- ✔ Column order
-- ✔ Data types



-- =====================================================
-- 2️⃣ INSERT INTO SPECIFIC COLUMNS
-- =====================================================

INSERT INTO Customers (FName, LName, Email, PreferredContact)
VALUES ('Zack', 'Smith', 'zack@example.com', 'EMAIL');

-- Omits PhoneNumber (allowed if nullable or has default)
-- NOT NULL columns must be included



-- =====================================================
-- 3️⃣ MULTIPLE ROW INSERT
-- =====================================================

-- SQL Server | PostgreSQL | MySQL | SQLite

INSERT INTO tbl_name (field1, field2, field3)
VALUES (1,2,3),
       (4,5,6),
       (7,8,9);

-- Faster than multiple separate INSERT statements



-- =====================================================
-- 4️⃣ INSERT FROM ANOTHER TABLE
-- =====================================================

INSERT INTO Customers (FName, LName, PhoneNumber)
SELECT FName, LName, PhoneNumber
FROM Employees;



-- =====================================================
-- 5️⃣ INSERT ALL COLUMNS (MATCHING SCHEMA REQUIRED)
-- =====================================================

INSERT INTO Table1
SELECT *
FROM Table2;

-- ⚠ Requires:
-- Same column count
-- Same order
-- Compatible data types



-- =====================================================
-- 6️⃣ IDENTITY / AUTO-INCREMENT NOTES
-- =====================================================

-- SQL Server (Identity column auto-generated)
CREATE TABLE Example (
    Id INT IDENTITY(1,1),
    Name VARCHAR(50)
);

-- PostgreSQL (SERIAL or IDENTITY)
CREATE TABLE Example (
    Id SERIAL,
    Name VARCHAR(50)
);

-- MySQL
CREATE TABLE Example (
    Id INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (Id)
);

-- SQLite
CREATE TABLE Example (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT
);



-- =====================================================
-- 7️⃣ BULK INSERT METHODS (Database Specific)
-- =====================================================

-- MySQL
-- LOAD DATA INFILE 'file.csv'
-- INTO TABLE Customers;

-- SQL Server
-- BULK INSERT Customers
-- FROM 'file.csv'
-- WITH (FORMAT = 'CSV');

-- PostgreSQL
-- COPY Customers FROM 'file.csv' DELIMITER ',' CSV HEADER;

-- Oracle
-- Uses SQL*Loader utility
