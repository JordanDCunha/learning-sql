# ✅ Chapter 57 — Triggers

## 🧠 Remarks

A **trigger** is a special type of stored procedure that automatically executes when a specific database event occurs.

Common trigger events:

- `INSERT`
- `UPDATE`
- `DELETE`

Triggers are commonly used for:

- Enforcing business rules
- Creating audit logs
- Preventing invalid data changes
- Implementing features like a recycle bin
- Synchronizing related tables

---

## 🔎 Special Logical Tables (SQL Server)

Inside SQL Server triggers, two special pseudo-tables are available:

| Table | Contains |
|--------|----------|
| `inserted` | New rows affected by `INSERT` or `UPDATE` |
| `deleted` | Old rows affected by `DELETE` or `UPDATE` |

These are temporary in-memory tables available only during trigger execution.

---

# 🧩 Examples

---

## 1️⃣ CREATE TRIGGER (Audit Example)

```sql
CREATE TRIGGER MyTrigger
ON MyTable
AFTER INSERT
AS
BEGIN
    -- Insert audit record into MyAudit table
    INSERT INTO MyAudit (MyTableId, [User])
    SELECT MyTableId, CURRENT_USER
    FROM inserted;
END;
```

### Explanation

- `AFTER INSERT` → Trigger fires after a successful insert.
- The `inserted` table contains the new rows.
- The trigger copies new row IDs into `MyAudit`.
- `CURRENT_USER` records who made the change.

This creates an automatic audit trail.

---

## 2️⃣ Trigger as a "Recycle Bin" (AFTER DELETE)

```sql
CREATE TRIGGER BooksDeleteTrigger
ON MyBooksDB.Books
AFTER DELETE
AS
BEGIN
    INSERT INTO BooksRecycleBin
    SELECT *
    FROM deleted;
END;
GO
```

### Explanation

- Fires after rows are deleted from `Books`.
- The `deleted` table contains removed rows.
- Those rows are inserted into `BooksRecycleBin`.
- This preserves deleted data for recovery.

This acts like a simple recycle bin system.

---

# ⚙️ Trigger Types (SQL Server)

| Type | When It Fires |
|-------|---------------|
| `AFTER` | After the event completes successfully |
| `INSTEAD OF` | Replaces the triggering operation |

Example:

```sql
CREATE TRIGGER ExampleInsteadOf
ON MyTable
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Delete prevented.';
END;
```

---

# ⚠️ Important Notes

- Triggers run automatically — users don’t call them directly.
- They execute within the same transaction as the triggering statement.
- Poorly written triggers can slow down performance.
- Avoid complex logic inside triggers.
- Always test triggers carefully.

---

# 🧱 Summary

| Concept | Description |
|----------|------------|
| **Trigger** | Automatic stored procedure tied to table events |
| **inserted** | Contains new rows |
| **deleted** | Contains old rows |
| **AFTER Trigger** | Runs after event completes |
| **INSTEAD OF Trigger** | Replaces the event |
| **Common Uses** | Auditing, validation, soft deletes |

---

Triggers are powerful tools for enforcing rules and automating database behavior — but they should be used carefully to avoid hidden side effects.

---
