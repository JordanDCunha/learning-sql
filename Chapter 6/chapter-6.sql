-- ========================================
-- Chapter 6: Joins & Best Practices
-- Database: SQLite
-- ========================================

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS Recipes;
DROP TABLE IF EXISTS Ingredients;

-- ========================================
-- Create Sample Tables
-- ========================================

CREATE TABLE Departments (
    ID INTEGER PRIMARY KEY,
    Name TEXT
);

CREATE TABLE Employees (
    ID INTEGER PRIMARY KEY,
    FName TEXT,
    LName TEXT,
    Salary REAL,
    DepartmentID INTEGER,
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(ID)
);

INSERT INTO Departments (Name)
VALUES ('HR'), ('IT'), ('Sales');

INSERT INTO Employees (FName, LName, Salary, DepartmentID)
VALUES
    ('Alice', 'Smith', 700, 2),
    ('Bob', 'Brown', 400, 1),
    ('Charlie', 'Jones', 900, 3);

-- ========================================
-- Explicit JOIN (Best Practice)
-- ========================================

SELECT d.Name,
       e.FName || ' ' || e.LName AS EmpName
FROM Departments AS d
LEFT JOIN Employees AS e
    ON d.ID = e.DepartmentID;

-- ========================================
-- Filtering with JOIN
-- ========================================

SELECT d.Name,
       COUNT(*) AS EmployeeCount
FROM Departments AS d
JOIN Employees AS e
    ON d.ID = e.DepartmentID
WHERE d.Name != 'HR'
GROUP BY d.Name
HAVING COUNT(*) > 0
ORDER BY EmployeeCount DESC;

-- ========================================
-- USING Clause Example
-- ========================================

CREATE TABLE Recipes (
    RecipeID INTEGER PRIMARY KEY,
    Name TEXT
);

CREATE TABLE Ingredients (
    IngredientID INTEGER PRIMARY KEY,
    RecipeID INTEGER,
    IngredientName TEXT,
    FOREIGN KEY (RecipeID)
        REFERENCES Recipes(RecipeID)
);

INSERT INTO Recipes (Name)
VALUES ('Pasta'), ('Cake');

INSERT INTO Ingredients (RecipeID, IngredientName)
VALUES
    (1, 'Noodles'),
    (1, 'Tomato Sauce'),
    (2, 'Flour'),
    (2, 'Sugar');

SELECT RecipeID,
       Recipes.Name,
       COUNT(*) AS NumberOfIngredients
FROM Recipes
LEFT JOIN Ingredients USING (RecipeID)
GROUP BY RecipeID;
