-- =========================================
-- CHAPTER 50 — SQL Injection
-- Defensive Examples Only
-- =========================================


-- =========================================
-- ❌ VULNERABLE EXAMPLE (DO NOT USE)
-- =========================================

-- This demonstrates bad practice.
-- NEVER concatenate user input into SQL strings.

-- Example (pseudo-code representation)
-- SELECT * FROM Users WHERE username = 'userInput' AND password = 'userInput';



-- =========================================
-- ✅ SAFE EXAMPLE — PARAMETERIZED (SQL SERVER)
-- =========================================

-- In application code (ADO.NET example shown in .md file)
-- SQL itself should use parameters like:

SELECT *
FROM Users
WHERE username = @username
  AND password = @password;



-- =========================================
-- ✅ SAFE EXAMPLE — POSTGRESQL
-- =========================================

SELECT *
FROM users
WHERE username = $1
  AND password = $2;



-- =========================================
-- ✅ SAFE EXAMPLE — MYSQL (PREPARED)
-- =========================================

PREPARE stmt FROM
  'SELECT * FROM Users WHERE username = ? AND password = ?';

-- Values bound separately (not concatenated)
EXECUTE stmt USING @username, @password;

DEALLOCATE PREPARE stmt;



-- =========================================
-- 🔐 LEAST PRIVILEGE EXAMPLE
-- =========================================

-- Create restricted user (example syntax may vary by DB)

-- SQL Server example:
-- CREATE LOGIN app_user WITH PASSWORD = 'StrongPassword!';
-- CREATE USER app_user FOR LOGIN app_user;
-- GRANT SELECT, INSERT, UPDATE ON Orders TO app_user;

-- Principle:
-- Application accounts should NOT have:
-- DROP TABLE, ALTER TABLE, or administrative permissions
