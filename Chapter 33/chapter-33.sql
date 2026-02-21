-- =====================================================
-- Chapter 33 — Information Schema
-- Multi-Database Reference
-- =====================================================
-- Supported in:
-- SQL Server | PostgreSQL | MySQL | Oracle (via ALL_* views)
-- SQLite uses different system tables (sqlite_master)
-- =====================================================



-- =====================================================
-- 1️⃣ LIST ALL TABLES
-- =====================================================

-- SQL Server / PostgreSQL / MySQL
SELECT TABLE_SCHEMA,
       TABLE_NAME,
       TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;



-- =====================================================
-- 2️⃣ LIST ALL COLUMNS IN DATABASE
-- =====================================================

SELECT TABLE_SCHEMA,
       TABLE_NAME,
       COLUMN_NAME,
       DATA_TYPE,
       CHARACTER_MAXIMUM_LENGTH,
       IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS;



-- =====================================================
-- 3️⃣ SEARCH FOR A COLUMN NAME
-- =====================================================

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE '%Institution%';



-- =====================================================
-- 4️⃣ LIST COLUMNS IN A SPECIFIC TABLE
-- =====================================================

SELECT COLUMN_NAME,
       DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Students';



-- =====================================================
-- 5️⃣ PRIMARY & FOREIGN KEY INFO
-- =====================================================

-- Key usage
SELECT *
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE;

-- Referential constraints (foreign keys)
SELECT *
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS;



-- =====================================================
-- 6️⃣ SQL SERVER ADDITIONAL SYSTEM VIEWS
-- =====================================================

-- More detailed metadata (SQL Server specific)
SELECT *
FROM sys.tables;

SELECT *
FROM sys.columns;



-- =====================================================
-- 7️⃣ POSTGRESQL
-- =====================================================

-- PostgreSQL fully supports INFORMATION_SCHEMA
-- Also has pg_catalog for deeper inspection

SELECT *
FROM pg_catalog.pg_tables;



-- =====================================================
-- 8️⃣ MYSQL
-- =====================================================

-- INFORMATION_SCHEMA is a virtual database in MySQL

SELECT *
FROM information_schema.tables;



-- =====================================================
-- 9️⃣ ORACLE
-- =====================================================

-- Oracle does not use INFORMATION_SCHEMA.
-- Equivalent views:

SELECT *
FROM ALL_TABLES;

SELECT *
FROM ALL_TAB_COLUMNS;

SELECT *
FROM ALL_CONSTRAINTS;



-- =====================================================
-- 🔟 SQLITE
-- =====================================================

-- SQLite does NOT support INFORMATION_SCHEMA
-- Uses sqlite_master

SELECT name, type
FROM sqlite_master
WHERE type = 'table';

-- List columns of a table
PRAGMA table_info('Students');
