# Chapter 35: JOIN — Study Notes (Clean Version)

## 📌 What is a JOIN?

A JOIN combines rows from two or more tables into one result set, based on related column values.

- Can join multiple tables  
- Can join a table to itself (self-join)  
- Returns a unified set of columns  

---

## 🧱 JOIN Syntax (General Form)

```sql
SELECT columns
FROM tableA
JOIN tableB
ON tableA.key = tableB.key;
```

---

## ✨ JOIN Concepts Explained

### 🔹 INNER JOIN
Only keeps records where the join condition is true.  
Excludes unmatched rows.

```sql
SELECT Employees.FName, Departments.Name
FROM Employees
JOIN Departments
ON Employees.DepartmentId = Departments.Id;
```

**Definition:**  
Returns rows that have matching values in both tables.

---

### 🔹 LEFT OUTER JOIN
Returns all rows from the left table, even if there’s no match in the right table.  
Missing values are shown as `NULL`.

```sql
SELECT Departments.Name, Employees.FName
FROM Departments
LEFT JOIN Employees
ON Departments.Id = Employees.DepartmentId;
```

**Think:**  
“Return everything on the left, and matching right — otherwise NULL.”

---

### 🔹 RIGHT OUTER JOIN
Returns all rows from the right table and matching rows from the left.

```sql
SELECT Employees.FName, Departments.Name
FROM Employees
RIGHT JOIN Departments
ON Employees.DepartmentId = Departments.Id;
```

---

### 🔹 FULL OUTER JOIN
Returns all rows from both tables.  
Non-matching rows get `NULL`.

```sql
SELECT *
FROM Table1
FULL JOIN Table2
ON Table1.Id = Table2.Id;
```

⚠️ Not supported in MySQL (use UNION workaround).

---

### 🔹 CROSS JOIN
Cartesian product — every row from table A combined with every row from table B.

```sql
SELECT d.Name, e.FName
FROM Departments d
CROSS JOIN Employees e;
```

If:
- Departments = 3 rows
- Employees = 4 rows

Output = 12 rows (3 × 4)

---

### 🔹 SELF JOIN
A table joined with itself using aliases.

```sql
SELECT
    e.FName AS Employee,
    m.FName AS Manager
FROM Employees e
JOIN Employees m
ON e.ManagerId = m.Id;
```

Used for hierarchical relationships (manager/employee).

---

### 🔹 JOIN on a SUBQUERY
Used when joining aggregated or filtered data.

```sql
SELECT po.Id, po.PODate, po.VendorName, po.Status,
       item.ItemNo, item.Description, item.Cost, item.Price
FROM PurchaseOrders po
LEFT JOIN (
    SELECT l.PurchaseOrderId, l.ItemNo, l.Description,
           l.Cost, l.Price, MIN(l.Id) AS Id
    FROM PurchaseOrderLineItems l
    GROUP BY l.PurchaseOrderId, l.ItemNo, l.Description,
             l.Cost, l.Price
) AS item
ON item.PurchaseOrderId = po.Id;
```

---

### 🔹 LATERAL JOIN (PostgreSQL / SQLite)

```sql
SELECT *
FROM T_Contacts
LEFT JOIN LATERAL (
    SELECT MAP_CTCOU_CT_UID, MAP_CTCOU_COU_UID,
           MAP_CTCOU_DateFrom, MAP_CTCOU_DateTo
    FROM T_MAP_Contacts_Ref_OrganisationalUnit
    WHERE MAP_CTCOU_CT_UID = T_Contacts.CT_UID
    ORDER BY MAP_CTCOU_DateFrom
    LIMIT 1
) AS FirstOE ON TRUE;
```

---

### 🔹 SQL Server Equivalent (OUTER APPLY)

```sql
SELECT *
FROM T_Contacts
OUTER APPLY (
    SELECT TOP 1 MAP_CTCOU_CT_UID, MAP_CTCOU_COU_UID,
                 MAP_CTCOU_DateFrom, MAP_CTCOU_DateTo
    FROM T_MAP_Contacts_Ref_OrganisationalUnit
    WHERE MAP_CTCOU_CT_UID = T_Contacts.CT_UID
    ORDER BY MAP_CTCOU_DateFrom
) AS FirstOE;
```

- `CROSS APPLY` = INNER JOIN LATERAL  
- `OUTER APPLY` = LEFT JOIN LATERAL  

---

### 🔹 RECURSIVE JOIN (CTE)

```sql
WITH RECURSIVE MyDescendants AS (
    SELECT Name
    FROM People
    WHERE Name = 'John Doe'

    UNION ALL

    SELECT p.Name
    FROM People p
    JOIN MyDescendants d
        ON p.Parent = d.Name
)
SELECT * FROM MyDescendants;
```

Used to traverse hierarchical data (org charts, family trees).

---

## 🧠 Join Type Summary

| Join Type | What It Returns |
|------------|----------------|
| INNER JOIN | Only rows that match in both tables |
| LEFT OUTER JOIN | All rows from left + matches from right |
| RIGHT OUTER JOIN | All rows from right + matches from left |
| FULL OUTER JOIN | All rows from both tables |
| CROSS JOIN | Cartesian product |
| SELF JOIN | Table joined to itself |
| LATERAL / APPLY | Subquery evaluated per row |
| RECURSIVE JOIN | Hierarchical traversal |
