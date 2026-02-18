-- ========================================
-- Chapter 15: DROP vs DELETE
-- Database: SQLite
-- ========================================

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL
);

INSERT INTO Employees (Name)
VALUES ('Alice'), ('Bob');

-- ========================================
-- 1. DELETE (removes data only)
-- ========================================

DELETE FROM Employees;

SELECT * FROM Employees;  -- Table still exists

-- ========================================
-- 2. DROP TABLE (removes structure + data)
-- ========================================

DROP TABLE IF EXISTS Employees;

-- This will now fail if executed:
-- SELECT * FROM Employees;

-- ========================================
-- 3. Simulating DROP DATABASE in SQLite
-- ========================================

-- Attach a second database file
ATTACH DATABASE 'temp_database.db' AS tempdb;

CREATE TABLE tempdb.Sample (
    ID INTEGER PRIMARY KEY,
    Value TEXT
);

INSERT INTO tempdb.Sample VALUES (1, 'Test');

-- Detach (similar to removing access)
DETACH DATABASE tempdb;

-- True "DROP DATABASE" in SQLite:
-- You must delete the .db file from disk manually.
