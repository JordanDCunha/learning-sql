-- =====================================================
-- Chapter 37: Materialized Views Examples
-- =====================================================

-- =====================================================
-- PostgreSQL / Oracle: Native Materialized View
-- =====================================================

CREATE TABLE mytable (
    number INT
);

INSERT INTO mytable VALUES (1);

CREATE MATERIALIZED VIEW myview AS
SELECT * FROM mytable;

SELECT * FROM myview;

-- Insert new data
INSERT INTO mytable VALUES (2);

-- Refresh required
REFRESH MATERIALIZED VIEW myview;

SELECT * FROM myview;

-- =====================================================
-- SQL Server: Indexed View (Materialized Equivalent)
-- =====================================================

CREATE TABLE dbo.MyTable (
    number INT NOT NULL
);

GO

CREATE VIEW dbo.MyIndexedView
WITH SCHEMABINDING
AS
SELECT number, COUNT_BIG(*) AS RowCount
FROM dbo.MyTable
GROUP BY number;

GO

CREATE UNIQUE CLUSTERED INDEX IX_MyIndexedView
ON dbo.MyIndexedView(number);

-- =====================================================
-- MySQL / SQLite: Manual Workaround
-- =====================================================

CREATE TABLE myview AS
SELECT * FROM mytable;

-- Refresh manually
DELETE FROM myview;

INSERT INTO myview
SELECT * FROM mytable;
