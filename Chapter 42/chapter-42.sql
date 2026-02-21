-- =====================================================
-- Chapter 42: Primary Key Examples
-- =====================================================

-- 1️⃣ Single-Column Primary Key
CREATE TABLE Employees (
    Id INT NOT NULL,
    PRIMARY KEY (Id),
    FName VARCHAR(50),
    LName VARCHAR(50)
);

-- 2️⃣ Inline Primary Key Syntax
CREATE TABLE Employees_Inline (
    Id INT NOT NULL PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50)
);

-- 3️⃣ Composite Primary Key
CREATE TABLE EmployeeProjects (
    e1_id INT,
    e2_id INT,
    PRIMARY KEY (e1_id, e2_id)
);

-- 4️⃣ Auto-Increment Primary Keys

-- MySQL
CREATE TABLE Employees_MySQL (
    Id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Id)
);

-- PostgreSQL
CREATE TABLE Employees_Postgres (
    Id SERIAL PRIMARY KEY
);

-- SQL Server
CREATE TABLE Employees_SQLServer (
    Id INT NOT NULL IDENTITY,
    PRIMARY KEY (Id)
);

-- SQLite
CREATE TABLE Employees_SQLite (
    Id INTEGER PRIMARY KEY
);

-- 5️⃣ Adding Primary Key After Creation
ALTER TABLE Employees
ADD PRIMARY KEY (Id);
