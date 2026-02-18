-- ========================================
-- Chapter 13: Data Types
-- Database: SQLite
-- ========================================

DROP TABLE IF EXISTS DataTypeExamples;

-- ========================================
-- SQLite Type Demonstration
-- ========================================

CREATE TABLE DataTypeExamples (
    id INTEGER PRIMARY KEY,

    -- Integer types
    whole_number INTEGER,

    -- Fixed precision (SQLite treats as NUMERIC affinity)
    exact_value DECIMAL(10,2),

    -- Floating point
    approximate_value REAL,

    -- Text
    description TEXT,

    -- Binary
    binary_data BLOB
);

INSERT INTO DataTypeExamples
(whole_number, exact_value, approximate_value, description, binary_data)
VALUES
(42, 123.45, 3.1415926535, 'Example row', X'48656C6C6F');

SELECT *
FROM DataTypeExamples;

-- ========================================
-- Casting Examples
-- ========================================

SELECT
    CAST(123 AS DECIMAL(5,2))      AS DecimalExample,
    CAST(12345.12 AS NUMERIC(10,5)) AS NumericExample,
    CAST(3.1415926535 AS REAL)     AS RealExample,
    CAST(12345 AS BLOB)            AS BlobExample;
