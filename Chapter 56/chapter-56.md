# ✅ Chapter 56 — Transactions

## 🧠 Remarks

A **transaction** is a logical unit of work that includes one or more database operations.

Each operation inside the transaction must complete successfully for the entire transaction to be saved.

If any step fails:

- The transaction is **rolled back**
- All changes are undone
- The database returns to its previous state

This guarantees:

- ✅ **Data Integrity**
- ✅ **Consistency**
- ✅ **Reliability**

Transactions follow the **ACID principles**:

| Principle | Meaning |
|------------|----------|
| **Atomicity** | All operations succeed or none do |
| **Consistency** | Database remains in a valid state |
| **Isolation** | Transactions don’t interfere improperly |
| **Durability** | Committed data is permanently saved |

---

# 🧩 Examples

---

## 1️⃣ Simple Transaction

```sql
BEGIN TRANSACTION

INSERT INTO DeletedEmployees (EmployeeID, DateDeleted, User)
SELECT 123, GETDATE(), CURRENT_USER;

DELETE FROM Employees 
WHERE EmployeeID = 123;

COMMIT TRANSACTION;
```

### Explanation

- `BEGIN TRANSACTION` starts the transaction.
- A record is inserted into `DeletedEmployees`.
- The employee is deleted from `Employees`.
- If both commands succeed → `COMMIT` permanently saves the changes.
- If an error occurs before commit → changes can be rolled back.

This ensures both actions happen together.

---

## 2️⃣ Rollback Transaction with Error Handling

```sql
BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO Users (ID, Name, Age)
    VALUES (1, 'Bob', 24);

    DELETE FROM Users 
    WHERE Name = 'Todd';

    COMMIT TRANSACTION;
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;
END CATCH;
```

### Explanation

- The code runs inside a `TRY...CATCH` block.
- If all statements inside `TRY` succeed → `COMMIT`.
- If any error occurs:
  - Control moves to `CATCH`
  - `ROLLBACK TRANSACTION` undoes everything.

This ensures **atomicity** — either all operations succeed or none do.

---

# ⚙️ Core Transaction Commands

| Command | Purpose |
|----------|----------|
| `BEGIN TRANSACTION` | Starts a transaction |
| `COMMIT` | Saves changes permanently |
| `ROLLBACK` | Undoes changes |
| `SAVEPOINT` | Creates a rollback checkpoint (advanced) |

---

# 💡 Why Transactions Matter

Without transactions:

- Partial updates can occur
- Data can become inconsistent
- Business logic can break
- Financial or inventory systems can become inaccurate

Transactions are essential in:

- Banking systems
- E-commerce platforms
- Payroll systems
- Inventory management
- Any multi-step data process

---

# 🧱 Summary

| Concept | Description |
|----------|------------|
| **Transaction** | A group of SQL operations treated as one unit |
| **Commit** | Makes changes permanent |
| **Rollback** | Reverts all changes |
| **ACID** | Guarantees reliability and consistency |
| **Best Practice** | Use TRY/CATCH with rollback handling |

---

Transactions are fundamental to safe database operations.  
They ensure that complex processes either complete fully — or not at all.

---
