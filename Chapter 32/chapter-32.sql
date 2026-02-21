-- =====================================================
-- Chapter 32 — Indexes
-- Multi-Database Reference
-- =====================================================
-- SQL Server | PostgreSQL | MySQL | Oracle | SQLite
-- =====================================================



-- =====================================================
-- 1️⃣ BASIC INDEX (ALL DATABASES)
-- =====================================================

CREATE INDEX ix_cars_employee_id
ON Cars (EmployeeID);

-- Speeds up:
-- SELECT * FROM Cars WHERE EmployeeID = 1;



-- =====================================================
-- 2️⃣ MULTI-COLUMN INDEX
-- =====================================================

CREATE INDEX ix_cars_e_c_o_ids
ON Cars (EmployeeID, CarID, OwnerID);

-- Works best when queries start with EmployeeID
-- Leading column rule applies



-- =====================================================
-- 3️⃣ UNIQUE INDEX (ALL DATABASES)
-- =====================================================

CREATE UNIQUE INDEX uq_customers_email
ON Customers (Email);

-- Prevents duplicate Email values



-- =====================================================
-- 4️⃣ SORTED INDEX
-- =====================================================
-- SQL Server / PostgreSQL / MySQL 8+ / Oracle / SQLite 3.30+

CREATE INDEX ix_scoreboard_score
ON scoreboard (score DESC);

-- Optimizes:
-- SELECT * FROM scoreboard ORDER BY score DESC;



-- =====================================================
-- 5️⃣ CLUSTERED INDEX (SQL SERVER)
-- =====================================================

CREATE CLUSTERED INDEX ix_employees_name
ON Employees (Employee_Surname);

-- Only ONE clustered index per table



-- =====================================================
-- 6️⃣ NONCLUSTERED INDEX (SQL SERVER)
-- =====================================================

CREATE NONCLUSTERED INDEX ix_employees_name_nc
ON Employees (Employee_Surname);



-- =====================================================
-- 7️⃣ POSTGRESQL (CLUSTER COMMAND)
-- =====================================================

-- PostgreSQL does not create clustered indexes directly.
-- Instead, you cluster a table based on an index:

CREATE INDEX ix_employees_name
ON Employees (Employee_Surname);

CLUSTER Employees USING ix_employees_name;



-- =====================================================
-- 8️⃣ MYSQL
-- =====================================================

-- In MySQL (InnoDB):
-- PRIMARY KEY is automatically clustered

ALTER TABLE Employees
ADD PRIMARY KEY (EmployeeID);

CREATE INDEX ix_employees_name
ON Employees (Employee_Surname);



-- =====================================================
-- 9️⃣ FILTERED / PARTIAL INDEX
-- =====================================================

-- SQL Server (Filtered Index)
CREATE INDEX Started_Orders
ON orders(product_id)
WHERE order_state_id = 1;


-- PostgreSQL (Partial Index)
CREATE INDEX Started_Orders
ON orders(product_id)
WHERE order_state_id = 1;


-- SQLite (Partial Index supported)
CREATE INDEX Started_Orders
ON orders(product_id)
WHERE order_state_id = 1;


-- MySQL: ❌ No partial index support



-- =====================================================
-- 🔧 INDEX MAINTENANCE
-- =====================================================

-- Drop index

-- SQL Server
DROP INDEX ix_cars_employee_id ON Cars;

-- PostgreSQL / MySQL / SQLite
DROP INDEX ix_cars_employee_id;


-- SQL Server: Disable index
ALTER INDEX ix_cars_employee_id ON Cars DISABLE;

-- SQL Server: Rebuild index
ALTER INDEX ix_cars_employee_id ON Cars REBUILD;

-- PostgreSQL: Rebuild (reindex)
REINDEX INDEX ix_cars_employee_id;

-- MySQL: Rebuild via ALTER TABLE
ALTER TABLE Cars ENGINE=InnoDB;
