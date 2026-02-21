# Chapter 29 — GROUP BY

## 📌 What GROUP BY Does

GROUP BY lets you aggregate rows that share the same value in one or more columns.

Think:

“Group everyone by Great House, then count how many are in each.”

It works with aggregate functions:

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

---

## ✅ Core Syntax

```sql
SELECT column, AGG_FUNC(column)
FROM table
GROUP BY column;
```

---

## ✅ Basic Example

Table: Westerosians

| Name      | GreatHouseAllegience |
|-----------|----------------------|
| Arya      | Stark                |
| Cersei    | Lannister            |
| Myrcella  | Lannister            |
| Yara      | Greyjoy              |
| Catelyn   | Stark                |
| Sansa     | Stark                |

---

## ✅ Count People in Each House

```sql
SELECT GreatHouseAllegience AS House,
       COUNT(*) AS Number_of_Westerosians
FROM Westerosians
GROUP BY GreatHouseAllegience;
```

Result:

| House      | Number_of_Westerosians |
|------------|------------------------|
| Stark      | 3                      |
| Lannister  | 2                      |
| Greyjoy    | 1                      |

---

## Clause Execution Order

| Clause   | Filters | Runs Before / After Grouping |
|----------|---------|------------------------------|
| WHERE    | Rows    | ✅ Before GROUP BY |
| GROUP BY | Groups  | — |
| HAVING   | Groups  | ✅ After GROUP BY |
| ORDER BY | Sorting | Last |

---

## ✅ Add ORDER BY

```sql
SELECT GreatHouseAllegience AS House,
       COUNT(*) AS Number_of_Westerosians
FROM Westerosians
GROUP BY GreatHouseAllegience
ORDER BY Number_of_Westerosians DESC;
```

Makes largest groups appear first.

---

## ✅ GROUP BY + HAVING

```sql
SELECT a.Id, a.Name, COUNT(*) AS BooksWritten
FROM BooksAuthors ba
JOIN Authors a ON a.id = ba.authorid
GROUP BY a.Id, a.Name
HAVING COUNT(*) > 1;
```

Example: authors who wrote more than 1 book.

---

## Example: Books with More Than 3 Authors

```sql
SELECT b.Id, b.Title, COUNT(*) AS NumberOfAuthors
FROM BooksAuthors ba
JOIN Books b ON b.id = ba.bookid
GROUP BY b.Id, b.Title
HAVING COUNT(*) > 3;
```

---

## ✅ Think of it Like “For Each”

```sql
SELECT EmpID, SUM(MonthlySalary)
FROM Employee
GROUP BY EmpID;
```

Meaning:

“For each EmpID, add up MonthlySalary.”

Works great when employees appear multiple times.

---

# ⚙️ Advanced GROUPING (Analytics)

Used mainly in data warehousing and analytics systems.

---

## ✅ ROLLUP (Subtotals + Grand Total)

```sql
SELECT Food, Brand, SUM(Total_amount)
FROM Sales
GROUP BY ROLLUP (Food, Brand);
```

Result includes:

1️⃣ Each Food + Brand  
2️⃣ Subtotal per Food  
3️⃣ Grand total  

---

## ✅ CUBE (All Combinations)

```sql
SELECT Food, Brand, SUM(Total_amount)
FROM Sales
GROUP BY CUBE (Food, Brand);
```

Includes:

- Regular groups
- Brand totals
- Food totals
- Grand total

Full pivot-style summary.

---

## Feature Support by Database

| Feature | SQL Server | PostgreSQL | Oracle | MySQL | SQLite |
|----------|------------|------------|--------|--------|--------|
| GROUP BY | ✅ | ✅ | ✅ | ✅ | ✅ |
| HAVING | ✅ | ✅ | ✅ | ✅ | ✅ |
| ROLLUP | ✅ | ✅ | ✅ | ✅ | ❌ |
| CUBE | ✅ | ✅ | ✅ | ❌ | ❌ |
| GROUPING SETS | ✅ | ✅ | ✅ | ❌ | ❌ |

---

# 🧠 Mental Model

GROUP BY = “For each category…”

WHERE = Filter rows  
GROUP BY = Create categories  
HAVING = Filter categories  
ORDER BY = Sort results  

---

GRANT = Security  
GROUP BY = Aggregation  

Two very different but equally important parts of SQL.
