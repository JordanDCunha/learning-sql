# ✅ CHAPTER 47 — SKIP / TAKE (Pagination)

---

## 📘 What Is Pagination?

Pagination means retrieving a **portion of rows** from a result set instead of the entire dataset at once.

Used for:

✔ Website pages showing a few items at a time  
✔ Mobile apps scrolling through lists  
✔ Large tables for performance efficiency  

---

# 🔹 Skip Rows Only

### Concept

| Term | Meaning |
|------|---------|
| SKIP (OFFSET) | Skip a number of rows |
| TAKE (LIMIT / FETCH) | Return only a set amount of rows |

---

## ✅ ISO / ANSI SQL

```sql
SELECT Id, Col1
FROM TableName
ORDER BY Id
OFFSET 20 ROWS;
```

Skips the first 20 rows, returns the rest.

---

## ✅ MySQL

```sql
SELECT * 
FROM TableName 
LIMIT 20, 42424242424242;
```

- First number = OFFSET  
- Second number = limit  
- Use a very large number to simulate “return all remaining”

---

## ✅ Oracle

```sql
SELECT Id, Col1
FROM (
    SELECT Id, Col1,
           ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber
    FROM TableName
)
WHERE RowNumber > 20;
```

Uses `ROW_NUMBER()` method for pagination.

---

## ✅ PostgreSQL

```sql
SELECT * 
FROM TableName 
OFFSET 20;
```

---

## ✅ SQLite

```sql
SELECT * 
FROM TableName 
LIMIT -1 OFFSET 20;
```

`-1` means “no limit”, return all remaining rows.

---

# 🔹 Take Rows Only (Limit Results)

---

## ✅ ISO / ANSI SQL

```sql
SELECT *
FROM TableName
FETCH FIRST 20 ROWS ONLY;
```

---

## ✅ MySQL / PostgreSQL / SQLite

```sql
SELECT *
FROM TableName
LIMIT 20;
```

---

## ✅ Oracle

```sql
SELECT Id, Col1
FROM (
    SELECT Id, Col1,
           ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber
    FROM TableName
)
WHERE RowNumber <= 20;
```

---

## ✅ SQL Server

```sql
SELECT TOP 20 *
FROM TableName;
```

---

# 🔹 Skip + Take Together (Full Pagination)

This retrieves a page.

Example:  
Page 2, 20 rows per page → skip 20, take next 20.

---

## ✅ ISO / ANSI SQL

```sql
SELECT Id, Col1
FROM TableName
ORDER BY Id
OFFSET 20 ROWS
FETCH NEXT 20 ROWS ONLY;
```

---

## ✅ MySQL

```sql
SELECT * 
FROM TableName 
LIMIT 20, 20;  -- OFFSET 20, TAKE 20
```

---

## ✅ Oracle / SQL Server (ROW_NUMBER Method)

```sql
SELECT Id, Col1
FROM (
    SELECT Id, Col1,
           ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber
    FROM TableName
)
WHERE RowNumber BETWEEN 21 AND 40;
```

---
