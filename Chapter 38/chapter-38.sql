-- =====================================================
-- Chapter 38: MERGE / UPSERT Examples
-- =====================================================

-- =====================================================
-- SQL Server / Oracle: MERGE
-- =====================================================

MERGE INTO targetTable AS t
USING sourceTable AS s
ON t.PKID = s.PKID

WHEN MATCHED THEN
    UPDATE SET
        t.ColumnA = s.ColumnA,
        t.ColumnB = s.ColumnB

WHEN NOT MATCHED BY TARGET THEN
    INSERT (PKID, ColumnA, ColumnB)
    VALUES (s.PKID, s.ColumnA, s.ColumnB)

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

-- =====================================================
-- MySQL: ON DUPLICATE KEY UPDATE
-- =====================================================

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(8),
    count INT,
    UNIQUE KEY name (name)
);

INSERT INTO users (name, count)
VALUES ('Joe', 1)
ON DUPLICATE KEY UPDATE count = count + 1;

-- =====================================================
-- PostgreSQL: ON CONFLICT
-- =====================================================

CREATE TABLE users (
    id SERIAL,
    name VARCHAR(8) UNIQUE,
    count INT
);

INSERT INTO users (name, count)
VALUES ('Joe', 1)
ON CONFLICT (name)
DO UPDATE SET count = users.count + 1;
