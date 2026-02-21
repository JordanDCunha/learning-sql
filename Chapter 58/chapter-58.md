# ✅ Chapter 58: TRUNCATE

## Introduction

`TRUNCATE TABLE table_name;`

The TRUNCATE statement is used to remove all records from a table, similar to DELETE without a WHERE clause — but it works much faster and at a lower level within the database engine.

---

## Remarks

TRUNCATE is a **DDL (Data Definition Language)** command, unlike DELETE, which is **DML (Data Manipulation Language)**.  
Because of this, TRUNCATE behaves differently and has key implications for performance, permissions, and triggers.

| Aspect                | TRUNCATE                                  | DELETE                                           |
|----------------------|--------------------------------------------|--------------------------------------------------|
| Command Type          | DDL (Data Definition Language)            | DML (Data Manipulation Language)                 |
| Speed                 | Much faster for large datasets            | Slower (row-by-row deletion)                     |
| Triggers              | `ON DELETE` triggers do **not** fire      | `ON DELETE` triggers fire                        |
| Disk Space            | Frees and **releases** used space         | Space may remain allocated                       |
| Identity Columns      | Resets identity seed (starts from 1)      | Identity continues from last value               |
| WHERE Clause          | Not allowed                               | Allowed — can delete specific rows               |
| Permissions           | Often requires higher privileges          | Usually allowed for table owner                  |
| Referential Integrity | Fails if table has foreign key references | Allowed if referential constraints are respected |

💡 Because TRUNCATE is a data page operation, it reinitializes the table structure, making it ideal for resetting or clearing entire tables quickly — but not for selective deletions.

---

## Examples

### Remove All Rows from a Table

`TRUNCATE TABLE Employee;`

This command:

- Instantly removes all data from the Employee table.
- Resets any auto-increment (IDENTITY) values back to 1.
- Does not trigger any ON DELETE triggers.
- Frees up all disk space used by the deleted data.

---

### Performance Comparison

`DELETE FROM Employee;`
- Deletes each row individually.
- Fires triggers.
- Maintains logs for each row.

`TRUNCATE TABLE Employee;`
- Reallocates data pages in bulk.
- Skips indexes and triggers.
- ✅ Much faster for large tables.

---

## Important Notes

- You cannot truncate specific rows — it’s all or nothing.
- You cannot truncate a table that is referenced by a foreign key constraint.
- After truncation, the auto-increment counter resets to 1.
- Ensure you have the correct permissions before running TRUNCATE (some systems restrict it).
