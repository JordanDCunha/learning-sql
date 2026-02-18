-- =========================================
-- Chapter 20: EXISTS Clause
-- =========================================

-- Setup Example Tables
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

CREATE TABLE Orders (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    OrderDate DATETIME,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
);

-- Insert Sample Data
INSERT INTO Customers (FirstName, LastName)
VALUES
('Ozgur', 'Ozturk'),
('Youssef', 'Medi'),
('Henry', 'Tai');

INSERT INTO Orders (CustomerId, OrderDate)
VALUES
(2, NOW()),
(3, NOW());

-- =========================================
-- Example 1: Customers with at least one order
-- =========================================

SELECT *
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.CustomerId = c.Id
);

-- =========================================
-- Example 2: Customers with NO orders
-- =========================================

SELECT *
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.CustomerId = c.Id
);

-- =========================================
-- Notes
-- =========================================
-- EXISTS returns TRUE if subquery returns at least one row.
-- NOT EXISTS returns TRUE if subquery returns zero rows.
-- SELECT 1 is commonly used because the actual data is irrelevant.
