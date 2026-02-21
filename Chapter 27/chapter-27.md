# Chapter 27 – Scalar (Single-Row) Functions

Scalar functions operate on a single row
and return a single value.

---

# 1️⃣ CAST

Converts one data type to another.

```sql
SELECT CAST(HireDate AS varchar(20)) AS HireDateText
FROM Employee;
```

Converts a date to text.

Use when:
- Converting int → text
- Converting string → date
- Simple type changes

---

# 2️⃣ CONVERT (SQL Server)

Converts data type with formatting styles.

```sql
SELECT CONVERT(varchar, HireDate, 3) AS HireDateUK
FROM Employee;
```

Style 3 → dd/mm/yy

Use when format matters.

---

# 3️⃣ PARSE (SQL Server)

Converts formatted string using language culture.

```sql
SELECT PARSE('Monday, 13 August 2012'
       AS datetime2 USING 'en-US');
```

Reads formatted English date string.

⚠ Less reliable than CAST/CONVERT.
Fails if text format is invalid.

---

# 4️⃣ GETDATE()

Returns current system date & time.

```sql
SELECT GETDATE() AS SystemDate;
```

Example output:
2025-10-23 14:22:10.527

Used for:
- Logs
- Timestamps
- Auditing

---

# 5️⃣ DATENAME

Extracts text part of date.

```sql
SELECT DATENAME(weekday, '2017-01-14') AS DayName;
```

Output:
Saturday

Useful for:
- Reports
- Grouping by weekday
- Date formatting

---

# 6️⃣ DATEDIFF

Calculates difference between dates.

```sql
SELECT DATEDIFF(day, OrderDate, ShipDate) AS ProcessingTime
FROM SalesOrderHeader;
```

Used for:
- Age calculations
- Duration tracking
- Delivery times

---

# 7️⃣ DATEADD

Adds time to a date.

```sql
SELECT DATEADD(day, 20, '2017-01-14') AS NewDate;
```

Result:
2017-02-03

Used for:
- Due dates
- Expiry dates
- Forecasting

---

# 8️⃣ CHOOSE

Selects value by index position.

```sql
SELECT CHOOSE(2, 'HR', 'Sales', 'Admin');
```

Result:
'Sales'

Good for:
- Dropdown logic
- Mapping small value lists

---

# 9️⃣ IIF

Inline IF-ELSE logic.

```sql
SELECT BusinessEntityID,
       SalesYTD,
       IIF(SalesYTD > 200000, 'Bonus', 'No Bonus') AS BonusStatus
FROM SalesPerson;
```

Used for:
- Conditional labels
- Simple decision logic

---

# 🔟 SIGN

Returns:
- 1 if positive
- 0 if zero
- -1 if negative

```sql
SELECT SIGN(-20) AS SignResult;
```

Output:
-1

Common in:
- Finance
- Math logic

---

# POWER

Raises number to exponent.

```sql
SELECT POWER(50, 3) AS Result;
```

Output:
125000

Used for:
- Growth modeling
- Compound interest
- Scientific calculations

---

# Function Categories

Conversion:
CAST, CONVERT, PARSE

Date/Time:
GETDATE, DATENAME, DATEDIFF, DATEADD

Logical:
IIF, CHOOSE

Math:
SIGN, POWER

---

# Mental Model

Scalar Function = One Row In → One Value Out

No grouping.
No collapsing.
Just transformation.
