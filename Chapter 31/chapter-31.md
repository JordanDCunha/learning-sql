# Chapter 31 — IN Clause

## ✅ Simple IN Clause

```sql
SELECT *
FROM products
WHERE id IN (1, 8, 3);
```

### ✅ What It Does

Returns rows where id equals:

1  
8  
3  

---

## Equivalent OR Conditions

```sql
SELECT *
FROM products
WHERE id = 1
   OR id = 8
   OR id = 3;
```

### Why IN is Better

✔ Shorter  
✔ Easier to maintain  
✔ Cleaner logic  

---

## Common Use Case

Checking against a short list:

```sql
WHERE status IN ('New','Active','Paused')
```

---

# IN Clause With a Subquery

```sql
SELECT *
FROM customers
WHERE id IN (
    SELECT DISTINCT customer_id
    FROM orders
);
```

## ✅ What It Does

Finds only customers who placed at least one order.

How it works:

Outer query → Checks customers  
Inner query → Pulls valid customer IDs from orders  
IN → Keeps only matching IDs  

---

## Why It’s Powerful

✔ Useful for relational filtering  
✔ Works perfectly with foreign key relationships  
✔ Often replaces complicated joins  

---

# Example: Products That Were Ordered

```sql
SELECT *
FROM products
WHERE id IN (
    SELECT product_id
    FROM order_items
);
```

---

# ⭐ Helpful Tip: Performance

For small lists → IN is perfect.

For very large lookup lists (thousands of values):

- A JOIN may be faster
- Or a temporary table

Example JOIN alternative:

```sql
SELECT DISTINCT c.*
FROM customers c
JOIN orders o
ON c.id = o.customer_id;
```

---

# ⚠️ Important: NOT IN and NULL

```sql
SELECT *
FROM products
WHERE id NOT IN (1, 8, 3);
```

Be careful:

If a subquery returns NULL values,  
NOT IN may behave unexpectedly.

Safer alternative in those cases:

Use EXISTS instead (covered in next chapter).

---

# 🧠 Mental Model

IN = “Is this value inside this list?”

Think:

"Keep rows where this column matches one of these values."

Simple.
Readable.
Very common in exams and real-world SQL.
