-- =========================================
-- CHAPTER 46 — SEQUENCE
-- Includes: Oracle, SQL Server, PostgreSQL, SQLite notes
-- =========================================


-- =========================
-- 🔹 ORACLE
-- =========================

-- Create Sequence
CREATE SEQUENCE orders_seq
START WITH 1000
INCREMENT BY 1;

-- Get Next Value
SELECT orders_seq.NEXTVAL FROM dual;

-- Insert Using Sequence
INSERT INTO Orders (Order_UID, Customer)
VALUES (orders_seq.NEXTVAL, 1032);


-- Advanced Example
CREATE SEQUENCE invoice_seq
START WITH 500
INCREMENT BY 10
MINVALUE 500
MAXVALUE 10000
CYCLE
CACHE 20;



-- =========================
-- 🔹 SQL SERVER
-- =========================

CREATE SEQUENCE orders_seq
START WITH 1000
INCREMENT BY 1;

-- Get Next Value
SELECT NEXT VALUE FOR orders_seq;

-- Insert
INSERT INTO Orders (Order_UID, Customer)
VALUES (NEXT VALUE FOR orders_seq, 1032);



-- =========================
-- 🔹 POSTGRESQL
-- =========================

CREATE SEQUENCE orders_seq
START 1000
INCREMENT 1;

-- Get Next Value
SELECT nextval('orders_seq');

-- Insert
INSERT INTO Orders (Order_UID, Customer)
VALUES (nextval('orders_seq'), 1032);



-- =========================
-- 🔹 SQLITE
-- =========================
-- SQLite does NOT support standalone SEQUENCE objects.
-- Instead, use INTEGER PRIMARY KEY AUTOINCREMENT.

CREATE TABLE Orders (
    Order_UID INTEGER PRIMARY KEY AUTOINCREMENT,
    Customer INTEGER
);

-- Insert (auto-generates ID)
INSERT INTO Orders (Customer)
VALUES (1032);
