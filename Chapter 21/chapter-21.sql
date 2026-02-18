-- =========================================
-- Chapter 21: DESCRIBE and EXPLAIN
-- =========================================

-- =========================================
-- Example Setup
-- =========================================

DROP TABLE IF EXISTS data;
DROP TABLE IF EXISTS user;

CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    test VARCHAR(255),
    INDEX (test)
);

CREATE TABLE data (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_user VARCHAR(255),
    INDEX (fk_user)
);

-- Insert Sample Data
INSERT INTO user (test) VALUES ('A'), ('B'), ('C');
INSERT INTO data (fk_user) VALUES ('A'), ('B');


-- =========================================
-- 1. DESCRIBE (View Table Structure)
-- =========================================

DESCRIBE user;

-- Alternative (works in most SQL systems)
-- SHOW COLUMNS FROM user;


-- =========================================
-- 2. EXPLAIN (Analyze Query Execution Plan)
-- =========================================

EXPLAIN
SELECT *
FROM user
JOIN data
  ON user.test = data.fk_user;


-- =========================================
-- Notes
-- =========================================
-- DESCRIBE shows metadata about table structure.
-- EXPLAIN shows how the query optimizer executes a query.
-- Used for debugging performance issues.
