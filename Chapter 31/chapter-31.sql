-- =====================================================
-- Chapter 31 — IN Clause
-- Multi-Database Reference
-- =====================================================
-- Works in:
-- SQL Server | PostgreSQL | MySQL | Oracle | SQLite
-- =====================================================



-- =====================================================
-- 1️⃣ SIMPLE IN CLAUSE
-- =====================================================

SELECT *
FROM products
WHERE id IN (1, 8, 3);

-- Returns rows where id = 1 OR 8 OR 3



-- Equivalent OR version (less clean)

SELECT *
FROM products
WHERE id = 1
   OR id = 8
   OR id = 3;



-- =====================================================
-- 2️⃣ IN WITH STRINGS
-- =====================================================

SELECT *
FROM orders
WHERE status IN ('New', 'Active', 'Paused');



-- =====================================================
-- 3️⃣ IN WITH SUBQUERY
-- =====================================================

-- Customers who placed at least one order

SELECT *
FROM customers
WHERE id IN (
    SELECT DISTINCT customer_id
    FROM orders
);



-- =====================================================
-- 4️⃣ RELATIONAL FILTERING EXAMPLE
-- =====================================================

-- Products that appear in order_items

SELECT *
FROM products
WHERE id IN (
    SELECT product_id
    FROM order_items
);



-- =====================================================
-- 5️⃣ PERFORMANCE NOTE
-- =====================================================

-- For very large value lists:
-- Consider JOIN instead

SELECT DISTINCT c.*
FROM customers c
JOIN orders o
ON c.id = o.customer_id;



-- =====================================================
-- 6️⃣ IMPORTANT BEHAVIOR
-- =====================================================

-- NOT IN example

SELECT *
FROM products
WHERE id NOT IN (1, 8, 3);

-- ⚠️ WARNING:
-- If subquery returns NULL,
-- NOT IN may return unexpected results.
-- EXISTS is often safer in that case.
