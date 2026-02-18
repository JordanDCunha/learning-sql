# Chapter 5 – CASE Expression

Database Used: SQLite

---

## Concept

The `CASE` expression allows conditional logic inside SQL queries.

It works like an IF–THEN–ELSE statement.

You can use it in:

- SELECT
- UPDATE
- ORDER BY
- GROUP BY
- HAVING

---

## Simple CASE

Matches one specific value.

```sql
CASE expression
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ELSE resultX
END
```

Example:

```sql
CASE Grade
    WHEN 'A' THEN 'Excellent'
END
```

---

## Searched CASE

Evaluates full logical conditions.

```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE resultX
END
```

Example:

```sql
CASE
    WHEN Score > 90 THEN 'Excellent'
END
```

---

## Key Difference

| Type | Behavior |
|------|----------|
| Simple CASE | Matches one value |
| Searched CASE | Evaluates conditions |

---

## Classifying Data

```sql
SELECT Id, Price,
CASE
    WHEN Price < 10 THEN 'CHEAP'
    WHEN Price < 20 THEN 'AFFORDABLE'
    ELSE 'EXPENSIVE'
END AS PriceRating
FROM ItemSales;
```

---

## Counting with CASE (Like COUNTIF)

```sql
SELECT
    COUNT(Id),
    SUM(CASE WHEN Price > 20 THEN 1 ELSE 0 END)
FROM ItemSales;
```

---

## CASE in ORDER BY

Custom sorting order:

```sql
ORDER BY
CASE DEPARTMENT
    WHEN 'MARKETING' THEN 1
    WHEN 'SALES' THEN 2
    WHEN 'RESEARCH' THEN 3
    WHEN 'INNOVATION' THEN 4
    ELSE 5
END;
```

---

## Sorting NULL Values Last

```sql
ORDER BY
CASE WHEN REGION IS NULL THEN 1 ELSE 0 END,
REGION;
```

---

## CASE in UPDATE

```sql
UPDATE ItemPrice
SET Price = Price *
CASE ItemId
    WHEN 1 THEN 1.05
    WHEN 2 THEN 1.10
    WHEN 3 THEN 1.15
END;
```

---

## Comparing Two Columns

```sql
ORDER BY CASE
    WHEN COALESCE(Date1, '0001-01-01') < COALESCE(Date2, '0001-01-01')
    THEN Date1
    ELSE Date2
END;
```
