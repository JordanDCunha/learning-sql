-- ========================================
-- Chapter 16: DROP TABLE
-- Database: SQLite
-- ========================================

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;

-- ========================================
-- 1. Create Sample Tables
-- ========================================

CREATE TABLE Students (
    StudentID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL
);

CREATE TABLE Courses (
    CourseID INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentID INTEGER,
    CourseName TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Students (Name)
VALUES ('Alice'), ('Bob');

INSERT INTO Courses (StudentID, CourseName)
VALUES (1, 'SQL'), (2, 'Databases');

-- ========================================
-- 2. Safe Drop Using IF EXISTS
-- ========================================

DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;

-- ========================================
-- 3. Demonstration: What Happens After Drop
-- ========================================

-- This will now fail if uncommented:
-- SELECT * FROM Students;
