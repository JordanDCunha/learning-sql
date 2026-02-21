# ✅ Chapter 59: TRY/CATCH

## Remarks

TRY/CATCH is a T-SQL (Transact-SQL) feature specific to Microsoft SQL Server used for structured error handling inside SQL scripts.

It behaves similarly to try-catch blocks in programming languages like C# — allowing SQL code to attempt operations and gracefully handle errors when they occur.

This construct is especially useful for:

- Managing runtime errors within stored procedures or transactions  
- Preventing partial commits of invalid data  
- Implementing custom rollback and error logging logic  

---

## Syntax Overview

```sql
BEGIN TRY
   -- SQL statements to execute
END TRY
BEGIN CATCH
   -- Error handling code
END CATCH
```

When an error occurs inside the TRY block:

- SQL Server immediately jumps to the CATCH block
- The remaining TRY statements are skipped
- You can retrieve error details using built-in functions

```sql
ERROR_MESSAGE();  -- Returns the error text
ERROR_NUMBER();   -- Returns the error code
ERROR_LINE();     -- Returns the line number
```

---

## 🧩 Example — Transaction with TRY/CATCH

```sql
BEGIN TRANSACTION
BEGIN TRY
    INSERT INTO dbo.Sale(Price, SaleDate, Quantity)
    VALUES (5.2, GETDATE(), 1);

    -- This will cause an error
    INSERT INTO dbo.Sale(Price, SaleDate, Quantity)
    VALUES (5.2, 'not a date', 1);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    THROW;
    ROLLBACK TRANSACTION;
END CATCH;
```

### What happens:

- The second insert fails (`'not a date'` is invalid).
- SQL jumps to the CATCH block.
- The transaction is rolled back.
- Both inserts are undone.

---

## ✅ Successful Transaction Example

```sql
BEGIN TRANSACTION
BEGIN TRY
    INSERT INTO dbo.Sale(Price, SaleDate, Quantity)
    VALUES (5.2, GETDATE(), 1);

    INSERT INTO dbo.Sale(Price, SaleDate, Quantity)
    VALUES (5.2, GETDATE(), 1);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    THROW;
    ROLLBACK TRANSACTION;
END CATCH;
```

### What happens:

- Both inserts succeed.
- COMMIT TRANSACTION executes.
- No rollback occurs.

---

## ⚙️ Best Practices

- Always pair `BEGIN TRANSACTION` with TRY/CATCH to ensure atomicity.
- Always include `ROLLBACK` inside the CATCH block.
- Use `THROW` to re-raise errors when appropriate.
- Consider logging error details into an error table.
- Use:
  - `ERROR_MESSAGE()`
  - `ERROR_NUMBER()`
  - `ERROR_LINE()`

---

## 💡 Key Takeaway

TRY/CATCH ensures **atomicity** — either all operations succeed, or none do.

This protects data integrity and prevents inconsistent database states.
