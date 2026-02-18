-- ========================================
-- Chapter 9: CREATE DATABASE
-- Database: SQLite
-- ========================================

-- SQLite does NOT support CREATE DATABASE
-- A database is simply a file.

-- To simulate creating another database,
-- you attach a new database file:

ATTACH DATABASE 'new_database.db' AS newdb;

-- Now you can create tables inside it:

CREATE TABLE newdb.TestTable (
    ID INTEGER PRIMARY KEY,
    Name TEXT
);

-- Insert sample data
INSERT INTO newdb.TestTable (Name)
VALUES ('Example');

-- Query it
SELECT *
FROM newdb.TestTable;

-- Detach when done
DETACH DATABASE newdb;
