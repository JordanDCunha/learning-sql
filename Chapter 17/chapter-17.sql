-- =========================================
-- Chapter 17: Example Databases and Tables
-- =========================================

-- Create Database
CREATE DATABASE AutoShop;
USE AutoShop;

-- =========================================
-- AUTO SHOP DATABASE
-- =========================================

-- Drop tables safely (for re-running script)
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- Departments
CREATE TABLE Departments (
    Id INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(25) NOT NULL,
    PRIMARY KEY (Id)
);

INSERT INTO Departments (Name)
VALUES
('HR'),
('Sales'),
('Tech');

-- Employees
CREATE TABLE Employees (
    Id INT NOT NULL AUTO_INCREMENT,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    PhoneNumber VARCHAR(11),
    ManagerId INT,
    DepartmentId INT NOT NULL,
    Salary INT NOT NULL,
    HireDate DATETIME NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (ManagerId) REFERENCES Employees(Id),
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

INSERT INTO Employees (FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate)
VALUES
('James', 'Smith', '1234567890', NULL, 1, 1000, '2002-01-01'),
('John', 'Johnson', '2468101214', 1, 1, 400, '2005-03-23'),
('Michael', 'Williams', '1357911131', 1, 2, 600, '2009-05-12'),
('Johnathon', 'Smith', '1212121212', 2, 1, 500, '2016-07-24');

-- Customers
CREATE TABLE Customers (
    Id INT NOT NULL AUTO_INCREMENT,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(11),
    PreferredContact VARCHAR(5) NOT NULL,
    PRIMARY KEY (Id)
);

INSERT INTO Customers (FName, LName, Email, PhoneNumber, PreferredContact)
VALUES
('William', 'Jones', 'william.jones@example.com', '3347927472', 'PHONE'),
('David', 'Miller', 'dmiller@example.net', '2137921892', 'EMAIL'),
('Richard', 'Davis', 'richard0123@example.com', NULL, 'EMAIL');

-- Cars
CREATE TABLE Cars (
    Id INT NOT NULL AUTO_INCREMENT,
    CustomerId INT NOT NULL,
    EmployeeId INT NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Status VARCHAR(25) NOT NULL,
    TotalCost INT NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
);

INSERT INTO Cars (CustomerId, EmployeeId, Model, Status, TotalCost)
VALUES
(1, 2, 'Ford F-150', 'READY', 230),
(1, 2, 'Ford F-150', 'READY', 200),
(2, 1, 'Ford Mustang', 'WAITING', 100),
(3, 3, 'Toyota Prius', 'WORKING', 1254);

-- =========================================
-- LIBRARY DATABASE STRUCTURE
-- =========================================

DROP TABLE IF EXISTS BooksAuthors;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;

-- Authors
CREATE TABLE Authors (
    Id INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(70) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    PRIMARY KEY (Id)
);

INSERT INTO Authors (Name, Country)
VALUES
('J.D. Salinger', 'USA'),
('F. Scott Fitzgerald', 'USA'),
('Jane Austen', 'UK'),
('Scott Hanselman', 'USA'),
('Jason N. Gaylord', 'USA'),
('Pranav Rastogi', 'India'),
('Todd Miranda', 'USA'),
('Christian Wenz', 'USA');

-- Books
CREATE TABLE Books (
    Id INT NOT
