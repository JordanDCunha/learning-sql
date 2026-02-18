# Chapter 4 – Cascading Delete

Database Used: SQLite

---

## Concept

`ON DELETE CASCADE` automatically deletes child rows when a referenced parent row is deleted.

This:

- Prevents foreign key violations
- Eliminates manual cleanup
- Simplifies application logic

---

## Example Scenario

We have:

- `T_Client` → stores clients
- `T_Room` → stores rooms belonging to clients

Each room references a client using a foreign key.

---

## Without Cascading Delete

If no cascade is defined:

```sql
DELETE FROM T_Client WHERE CLI_ID = 1;
```

❌ Error: Foreign key constraint violation

You must:

1. Delete all related rooms
2. Then delete the client

This becomes complex as databases grow.

---

## With ON DELETE CASCADE

```sql
CREATE TABLE T_Room (
    RM_ID INTEGER PRIMARY KEY,
    RM_CLI_ID INTEGER,
    RoomName TEXT,
    FOREIGN KEY (RM_CLI_ID)
        REFERENCES T_Client(CLI_ID)
        ON DELETE CASCADE
);
```

Now:

```sql
DELETE FROM T_Client WHERE CLI_ID = 1;
```

✅ All related rooms are automatically deleted.

---

## Important Warning ⚠️

When cascade is enabled:

Deleting a parent row
→ automatically deletes all child rows.

You cannot delete and reinsert parent data without losing related child data.

Use with caution.

---

## Recursive (Self-Referencing) Tables

Some databases allow cascading deletes on self-referencing tables.

SQLite allows it.

Other systems (like SQL Server) restrict cascading deletes
in recursive structures to prevent cycles and deadlocks.

Always verify behavior for your specific database system.
