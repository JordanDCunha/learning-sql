-- ========================================
-- Chapter 3: AND & OR Operators
-- Database: SQLite
-- ========================================

-- Clean start
DROP TABLE IF EXISTS People;

-- Create table
CREATE TABLE People (
    Name TEXT,
    Age INTEGER,
    City TEXT
);

-- Insert sample data
INSERT INTO People (Name, Age, City)
VALUES
    ('Bob', 10, 'Paris'),
    ('Mat', 20, 'Berlin'),
    ('Mary', 24, 'Prague');

-- ========================================
-- Using AND
-- ========================================

SELECT Name
FROM People
WHERE Age > 10 AND City = 'Prague';

-- Expected Result:
-- Mary


-- ========================================
-- Using OR
-- ========================================

SELECT Name
FROM People
WHERE Age = 10 OR City = 'Prague';

-- Expected Result:
-- Bob
-- Mary
