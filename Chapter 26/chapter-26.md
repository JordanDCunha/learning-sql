# Chapter 26 – Analytic (Window) Functions

Database Used: SQLite 3.25+

---

# What Are Analytic Functions?

Analytic functions (also called Window Functions):

✔ Keep all rows  
✔ Add calculated insights  
✔ Do NOT collapse rows like GROUP BY  

They operate using:

```sql
<function>() OVER (
    [PARTITION BY column]
    ORDER BY column
    [ROWS / RANGE clause]
)
```

If PARTITION BY is missing,  
the entire dataset is treated as one group.

---

# FIRST_VALUE()

Gets the first value in the ordered window.

```sql
SELECT BusinessEntityID,
       FIRST_VALUE(SalesYTD) OVER (
           ORDER BY SalesYTD ASC
       ) AS LowestSales
FROM employees;
```

Every row gets the lowest value repeated.

Use case:
Find first value within a group.

---

# LAST_VALUE()

Gets the last value in the ordered window.

⚠ Important: You MUST define the window frame.

```sql
SELECT BusinessEntityID,
       LAST_VALUE(SalesYTD) OVER (
           ORDER BY SalesYTD
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND UNBOUNDED FOLLOWING
       ) AS HighestSales
FROM employees;
```

Without the ROWS clause,
LAST_VALUE can give misleading results.

---

# LAG() – Look Backwards

```sql
SELECT BusinessEntityID,
       LAG(SalesYTD, 1, 0) OVER (
           ORDER BY BusinessEntityID
       ) AS PreviousSales
FROM employees;
```

Used to compare current row to previous row.

Common for:
- Trends
- Month-over-month comparisons
- Growth analysis

---

# LEAD() – Look Forward

```sql
SELECT BusinessEntityID,
       LEAD(SalesYTD, 1, 0) OVER (
           ORDER BY BusinessEntityID
       ) AS NextSales
FROM employees;
```

Used for:
- Future comparisons
- Upcoming transactions
- Forecast alignment

---

# PERCENT_RANK()

Shows relative ranking between 0 and 1.

Formula:

(Rank - 1) / (TotalRows - 1)

```sql
SELECT BusinessEntityID,
       PERCENT_RANK() OVER (
           PARTITION BY JobTitle
           ORDER BY SickLeaveHours DESC
       ) AS PercentRank
FROM employees;
```

✔ Lowest value → 0  
✔ Highest value → 1  

---

# CUME_DIST()

Cumulative distribution.

Formula:

(Number of rows ≤ current row) / TotalRows

```sql
SELECT BusinessEntityID,
       CUME_DIST() OVER (
           PARTITION BY JobTitle
           ORDER BY SickLeaveHours DESC
       ) AS CumeDistribution
FROM employees;
```

Shows percentage of rows at or below the current value.

---

# Difference: Aggregate vs Analytic

Aggregate:

```sql
SELECT JobTitle, SUM(SalesYTD)
FROM employees
GROUP BY JobTitle;
```

Collapses rows.

Analytic:

```sql
SELECT BusinessEntityID,
       SUM(SalesYTD) OVER (PARTITION BY JobTitle)
FROM employees;
```

Keeps rows + adds totals.

---

# Mental Model

GROUP BY → Shrinks data  

OVER() → Adds intelligence without shrinking  

LAG / LEAD → Compare neighbors  
FIRST / LAST → Boundary values  
PERCENT_RANK / CUME_DIST → Distribution insight  

Window functions = advanced analytics inside SQL.
