-- =========================================
-- Chapter 22: Filtering Results (WHERE & HAVING)
-- =========================================

-- =========================================
-- Setup Sample Tables
-- =========================================

DROP TABLE IF EXISTS Items;
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS ItemSales;
DROP TABLE IF EXISTS Orders;

CREATE TABLE Items (
    ItemId INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Price INT
);

INSERT INTO Items (Name, Price)
VALUES
('Puzzle Game', 5),
('Shooter', 15);


CREATE TABLE Cars (
    CarId INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    Model VARCHAR(50),
    TotalCost INT
);

INSERT INTO Cars (CustomerId, Model, TotalCost)
VALUES
(1, 'A', 500),
(2, 'B', 200),
(3, 'C', 100),
(1, 'D', 300);


CREATE TABLE Employees (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    FName VARCHAR(50),
    LName VARCHAR(50),
    DepartmentId INT,
    ManagerId INT
);

INSERT INTO Employees (FName, LName, DepartmentId, ManagerId)
VALUES
('John', 'Doe', 1, 2),
('Johnathon', 'Lee', 1, 1),
('Alice', 'Brown', 2, NULL);


CREATE TABLE ItemSales (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Quantity INT,
    SaleDate DATE
);

INSERT INTO ItemSales (Quantity, SaleDate)
VALUES
(5, '2013-07-10'),
(12, '2013-07-12'),
(17, '2013-07-20'),
(25, '2013-07-30');


CREATE TABLE Orders (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    ProductId INT
);

INSERT INTO Orders (CustomerId, ProductId)
VALUES
(1, 2),
(1, 3),
(2, 2),
(3, 4);

-- =========================================
-- WHERE Clause
-- =========================================

-- Price less than 10
SELECT *
FROM Items
WHERE Price < 10;


-- Equality
SELECT *
FROM Employees
WHERE DepartmentId = 1;


-- IN operator
SELECT *
FROM Cars
WHERE TotalCost IN (100, 200, 300);


-- LIKE operator
SELECT *
FROM Employees
WHERE FName LIKE 'John%';


-- NULL filtering
SELECT *
FROM Employees
WHERE ManagerId IS NULL;


-- BETWEEN (Numbers)
SELECT *
FROM ItemSales
WHERE Quantity BETWEEN 10 AND 17;


-- BETWEEN (Dates)
SELECT *
FROM ItemSales
WHERE SaleDate BETWEEN '2013-07-11' AND '2013-07-24';


-- AND condition
SELECT *
FROM Employees
WHERE DepartmentId = 1 AND ManagerId = 1;


-- OR condition
SELECT *
FROM Employees
WHERE DepartmentId = 2 OR ManagerId = 2;


-- =========================================
-- HAVING Clause
-- =========================================

-- Customers with more than one car
SELECT CustomerId, COUNT(CarId) AS NumberOfCars
FROM Cars
GROUP BY CustomerId
HAVING COUNT(CarId) > 1;


-- HAVING with multiple conditions
-- Customers who ordered both Product 2 and 3
SELECT CustomerId
FROM Orders
WHERE ProductId IN (2,3)
GROUP BY CustomerId
HAVING COUNT(DISTINCT ProductId) = 2;


-- =========================================
-- EXISTS Example
-- =========================================

SELECT *
FROM Employees e
WHERE EXISTS (
    SELECT 1
    FROM Cars c
    WHERE c.CustomerId = e.Id
);
