# ✅ Chapter 59: TRY/CATCH

## Remarks

TRY/CATCH is a T-SQL (Transact-SQL) feature specific to Microsoft SQL Server used for structured error handling inside SQL scripts.

It behaves similarly to try-catch blocks in languages like C# — allowing SQL code to attempt operations and handle errors gracefully.

Useful for:

- Managing runtime errors in stored procedures
- Preventing partial commits
- Implementing rollback logic
- Logging errors for auditing

---

## Syntax Overview

BEGIN TRY
   -- SQL statements
END TRY
BEGIN CATCH
   -- Error handling code
END CATCH

When an error occurs:

- SQL Server jumps immediately to the CATCH block
- Remaining TRY statements are skipped
- Built-in functions can retrieve error details

ERROR_MESSAGE()
ERROR_NUMBER()
ERROR_LINE()

---

## Example — Transaction with TRY/CATCH

If one statement fails, the entire transaction rolls back.

---

## Best Practices

- Always wrap transactions in TRY/CATCH
- Always rollback inside CATCH
- Consider logging errors to a table
- Use THROW to re-raise errors when needed
