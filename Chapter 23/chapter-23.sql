-- =========================================
-- Chapter 23: Finding Duplicates on a Column
-- =========================================

-- =========================================
-- Setup Example Table
-- =========================================

DROP TABLE IF EXISTS tblStudent;

CREATE TABLE tblStudent (
    StudentId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE
);

INSERT INTO tblStudent (FirstName, LastName, DateOfBirth)
VALUES
('John', 'Smith', '2004-05-12'),
('Emma', 'Brown', '2003-11-02'),
('John', 'Smith', '2004-05-12'),
('Ava', 'Wilson', '2002-08-22'),
('Emma', 'Brown', '2003-11-02');

-- =========================================
-- Method 1: Using CTE + Window Function
-- =========================================

WITH CTE AS (
    SELECT 
        StudentId,
        FirstName,
        LastName,
        DateOfBirth,
        SUM(1) OVER (
            PARTITION BY FirstName, LastName, DateOfBirth
        ) AS RowCnt
    FROM tblStudent
)

SELECT *
FROM CTE
WHERE RowCnt > 1
ORDER BY DateOfBirth, LastName;

-- =========================================
-- Method 2: Using GROUP BY + HAVING
-- =========================================

SELECT 
    FirstName,
    LastName,
    DateOfBirth,
    COUNT(*) AS DuplicateCount
FROM tblStudent
GROUP BY FirstName, LastName, DateOfBirth
HAVING COUNT(*) > 1;

-- =========================================
-- Optional: Delete Duplicates (Keep One)
-- =========================================

-- Example using ROW_NUMBER (SQL Server / PostgreSQL)

WITH DuplicateCTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY FirstName, LastName, DateOfBirth
               ORDER BY StudentId
           ) AS RowNum
    FROM tblStudent
)

-- Delete all but the first occurrence
DELETE FROM tblStudent
WHERE StudentId IN (
    SELECT StudentId
    FROM DuplicateCTE
    WHERE RowNum > 1
);
