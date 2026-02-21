# ✅ Chapter 61: UPDATE

## 📘 Syntax

```sql
UPDATE table
SET column_name = value,
    column_name2 = value_2,
    ...
    column_name_n = value_n
WHERE condition;
```

The `UPDATE` statement modifies existing records in a table.

⚠️ If you omit the `WHERE` clause, **all rows** in the table will be updated.

---

# 🧩 Examples

---

## 1️⃣ Updating All Rows  
**Example Table: Cars**

```sql
UPDATE Cars
SET Status = 'READY';
```

### Explanation

- Sets `Status` to `'READY'` for **all rows** in the `Cars` table.
- No `WHERE` clause = affects the entire table.

---

## 2️⃣ Updating Specific Rows  
**Example Table: Cars**

```sql
UPDATE Cars
SET Status = 'READY'
WHERE Id = 4;
```

### Explanation

- Updates only the row where `Id = 4`.
- Rows not matching the condition remain unchanged.

💡 The `WHERE` clause filters which rows are affected.

---

## 3️⃣ Modifying Existing Values  
**Example Table: Cars**

```sql
UPDATE Cars
SET TotalCost = TotalCost + 100
WHERE Id = 3 OR Id = 4;
```

### Explanation

- Uses current values in a calculation.
- Increases `TotalCost` by 100 for cars with IDs 3 and 4.

📈 Example change results:

- Car #3: `100 → 200`
- Car #4: `1254 → 1354`

---

# 4️⃣ UPDATE Using Data From Another Table

You can pull data from a different table into the one being updated.

**Example Tables:** `Employees` and `Customers`

---

## (a) Standard SQL — Using a Correlated Subquery

```sql
UPDATE Employees
SET PhoneNumber = (
    SELECT c.PhoneNumber
    FROM Customers c
    WHERE c.FName = Employees.FName
      AND c.LName = Employees.LName
)
WHERE Employees.PhoneNumber IS NULL;
```

### Explanation

- Finds employees who are also customers.
- Updates their phone number from the `Customers` table.
- Only updates rows where `PhoneNumber` is currently `NULL`.

---

## (b) SQL:2003 — Using MERGE

```sql
MERGE INTO Employees e
USING Customers c
ON e.FName = c.FName
AND e.LName = c.LName
AND e.PhoneNumber IS NULL
WHEN MATCHED THEN
UPDATE SET PhoneNumber = c.PhoneNumber;
```

### Explanation

- Combines insert/update logic in one statement.
- Updates matching rows in `Employees` with data from `Customers`.

---

## (c) SQL Server — Using INNER JOIN

```sql
UPDATE e
SET e.PhoneNumber = c.PhoneNumber
FROM Employees e
INNER JOIN Customers c
    ON e.FName = c.FName
   AND e.LName = c.LName
WHERE e.PhoneNumber IS NULL;
```

### Explanation

- Uses SQL Server’s `FROM ... JOIN` syntax.
- Updates only employees missing phone numbers.
- Often more readable and efficient in SQL Server.

---

# 5️⃣ Capturing Updated Records (SQL Server)

You can capture which rows were updated using the `OUTPUT` clause.

```sql
CREATE TABLE #TempUpdated (ID INT);

UPDATE TableName
SET Col1 = 42
OUTPUT inserted.ID INTO #TempUpdated
WHERE Id > 50;
```

### Explanation

- Creates a temporary table `#TempUpdated`.
- Inserts into it the IDs of rows that were just updated.
- Useful for auditing, logging, or further processing.

---

# ⚙️ Key Takeaways

✅ Always use a `WHERE` clause unless you truly intend to update all rows.  
✅ You can update values using calculations.  
✅ You can update from other tables using subqueries, `MERGE`, or `JOIN`.  
✅ SQL Server allows capturing updated rows using `OUTPUT`.  

🚨 Mistakes in `UPDATE` statements can affect large amounts of data — always test carefully.
