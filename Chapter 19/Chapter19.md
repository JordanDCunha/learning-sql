# Chapter 19: Execution Blocks

## What It Does

An execution block groups multiple SQL statements so they run together as a single logical unit.

This is done using:

BEGIN
    -- SQL statements
END

Everything inside executes in order.

---

## Why Use Execution Blocks?

- Organize multiple SQL statements
- Improve readability
- Maintain data consistency
- Required in stored procedures and triggers
- Used with transactions

---

## Basic Example

```sql
BEGIN

    UPDATE Employees
    SET PhoneNumber = '5551234567'
    WHERE Id = 1;

    UPDATE Employees
    SET Salary = Salary + 100
    WHERE Id = 2;

END;
