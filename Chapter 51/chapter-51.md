# ✅ Chapter 51 — Stored Procedures — Study Guide

---

# 💡 Definition

A **Stored Procedure** is a precompiled collection of one or more SQL statements stored and executed directly by the database.

It acts like a reusable function or subroutine inside the database itself.

---

# 🧱 Purpose

- Encapsulates complex or frequently used SQL logic  
- Centralizes database operations — improves maintainability and security  
- Precompiled and cached for faster execution  
- Allows parameterization, reducing SQL injection risk  
- Can return result sets, output parameters, or status codes  

---

# 📊 Benefits

| Benefit | Explanation |
|----------|------------|
| Performance | Query plan caching reduces parsing and optimization overhead |
| Security | Grant EXECUTE permission instead of table access |
| Reusability | Multiple applications can call the same procedure |
| Maintainability | Business logic lives in one centralized place |
| Reduced SQL Injection Risk | Parameters handled by DB engine |

---

# ✅ Creating a Stored Procedure (SQL Server Example)

```sql
CREATE PROCEDURE Northwind.getEmployee
    @LastName nvarchar(50),
    @FirstName nvarchar(50)
AS
BEGIN
    SELECT FirstName, LastName, Department
    FROM Northwind.vEmployeeDepartment
    WHERE FirstName = @FirstName
      AND LastName = @LastName
      AND EndDate IS NULL;
END;
GO
```

### 🧠 Explanation

- `CREATE PROCEDURE` defines a new stored procedure  
- `@LastName` and `@FirstName` are input parameters  
- `BEGIN...END` contains the SQL logic  
- `GO` ends the batch (SQL Server tools like SSMS)  

---

# ⚙️ Calling (Executing) the Procedure

## 🔹 Positional Arguments

```sql
EXECUTE Northwind.getEmployee N'Ackerman', N'Pilar';
GO
```

## 🔹 Named Arguments

```sql
EXEC Northwind.getEmployee 
    @LastName = N'Ackerman', 
    @FirstName = N'Pilar';
GO
```

## 🔹 Reversed Order (Named Parameters)

```sql
EXECUTE Northwind.getEmployee 
    @FirstName = N'Pilar', 
    @LastName = N'Ackerman';
GO
```

### 🧠 Notes

- `EXEC` and `EXECUTE` are synonyms  
- Named parameters avoid ordering issues  
- `N'...'` indicates a Unicode string literal (`nvarchar`)  

---

# 🔁 Using Output Parameters

```sql
CREATE PROCEDURE GetOrderCount
    @CustomerID INT,
    @OrderCount INT OUTPUT
AS
BEGIN
    SELECT @OrderCount = COUNT(*)
    FROM Orders
    WHERE CustomerID = @CustomerID;
END;
GO
```

---

# 🔄 Transaction Control Inside Procedures

Stored procedures can include:

```sql
BEGIN TRANSACTION;

-- SQL operations

COMMIT;
-- or
ROLLBACK;
```

Useful for multi-step business operations.

---

# 🧱 When to Use Stored Procedures

- Frequently executed queries  
- Complex multi-statement transactions  
- Business logic close to the data layer  
- Restricting direct table access  
- Integration APIs (C#, Python, etc.)  

---

# ⚠️ Common Pitfalls

- Overusing procedures for business logic can hurt version control  
- Returning multiple unstructured result sets can confuse apps  
- Vendor-specific syntax reduces portability  

---

# 📊 Stored Procedure vs Dynamic SQL

| Feature | Stored Procedure | Dynamic SQL |
|----------|-----------------|-------------|
| Compiled once | ✅ Yes | ❌ No |
| Parameterized | ✅ Yes | ❌ Often concatenated |
| Safer against SQL injection | ✅ Yes | ❌ No |
| Centralized logic | ✅ Yes | ❌ No |
| Flexibility | Medium | High |
| Best for | Reusable, consistent logic | Ad-hoc or rare queries |

---

# 🛡️ Security & Maintenance Tips

✔ Use parameters only — never build SQL with concatenated user input  
✔ Keep permissions minimal (EXECUTE only)  
✔ Store procedure definitions in version control  
✔ Review and document procedures regularly  
