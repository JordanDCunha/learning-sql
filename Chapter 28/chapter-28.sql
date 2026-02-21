-- =====================================================
-- Chapter 28 — GRANT & REVOKE
-- Multi-Database Reference
-- =====================================================



-- =====================================================
-- 1️⃣ SQL SERVER (T-SQL)
-- =====================================================

-- Create login (server level)
CREATE LOGIN User1 WITH PASSWORD = 'StrongPassword123!';

-- Create database user
CREATE USER User1 FOR LOGIN User1;

-- Grant permissions
GRANT SELECT, UPDATE
ON dbo.Employees
TO User1;

-- Grant with ability to pass permission
GRANT SELECT
ON dbo.Employees
TO User1
WITH GRANT OPTION;

-- Revoke permission
REVOKE UPDATE
ON dbo.Employees
FROM User1;



-- =====================================================
-- 2️⃣ POSTGRESQL
-- =====================================================

-- Create role (Postgres uses roles)
CREATE ROLE user1 WITH LOGIN PASSWORD 'StrongPassword123';

-- Grant permissions
GRANT SELECT, UPDATE
ON TABLE employees
TO user1;

-- Grant with delegation ability
GRANT SELECT
ON TABLE employees
TO user1
WITH GRANT OPTION;

-- Revoke
REVOKE UPDATE
ON TABLE employees
FROM user1;



-- =====================================================
-- 3️⃣ MYSQL
-- =====================================================

-- Create user
CREATE USER 'user1'@'localhost'
IDENTIFIED BY 'StrongPassword123';

-- Grant permissions
GRANT SELECT, UPDATE
ON company.employees
TO 'user1'@'localhost';

-- Grant with delegation
GRANT SELECT
ON company.employees
TO 'user1'@'localhost'
WITH GRANT OPTION;

-- Revoke
REVOKE UPDATE
ON company.employees
FROM 'user1'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;



-- =====================================================
-- 4️⃣ ORACLE
-- =====================================================

-- Create user
CREATE USER user1 IDENTIFIED BY StrongPassword123;

-- Allow login
GRANT CREATE SESSION TO user1;

-- Grant table permissions
GRANT SELECT, UPDATE
ON employees
TO user1;

-- Grant with delegation
GRANT SELECT
ON employees
TO user1
WITH GRANT OPTION;

-- Revoke
REVOKE UPDATE
ON employees
FROM user1;



-- =====================================================
-- 5️⃣ SQLITE
-- =====================================================

-- IMPORTANT:
-- SQLite does NOT support GRANT or REVOKE.
-- SQLite security is file-based.

-- Access control is handled by:
-- 1. Operating system file permissions
-- 2. Application-level authentication

-- Example:
-- If user has read access to the .db file → they can read.
-- If they have write access → they can modify.
