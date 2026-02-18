-- ========================================
-- Chapter 10: User Defined Functions (UDF)
-- Database: SQLite
-- ========================================

DROP TABLE IF EXISTS Example;

CREATE TABLE Example (
    ID INTEGER PRIMARY KEY,
    TextValue TEXT
);

INSERT INTO Example (TextValue) VALUES
('Hello World'),
('SQL is powerful'),
('Jordan');

-- ========================================
-- Simulating FirstWord Function in SQLite
-- ========================================

SELECT
    TextValue,
    CASE
        WHEN INSTR(TextValue, ' ') = 0
            THEN TextValue
        ELSE SUBSTR(TextValue, 1, INSTR(TextValue, ' ') - 1)
    END AS FirstWord
FROM Example;
