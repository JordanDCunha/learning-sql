# Chapter 3 – AND & OR Operators

Database Used: SQLite

---

## Syntax

### Using AND

```sql
SELECT * 
FROM table
WHERE condition1 AND condition2;
```

### Using OR

```sql
SELECT * 
FROM table
WHERE condition1 OR condition2;
```

---

## Sample Data

| Name | Age | City   |
|------|-----|--------|
| Bob  | 10  | Paris  |
| Mat  | 20  | Berlin |
| Mary | 24  | Prague |

---

## Using AND

```sql
SELECT Name
FROM People
WHERE Age > 10 AND City = 'Prague';
```

### Explanation

The `AND` operator returns results **only when both conditions are true**.

Conditions:
- Age > 10  
- City = 'Prague'  

### Result

Mary

---

## Using OR

```sql
SELECT Name
FROM People
WHERE Age = 10 OR City = 'Prague';
```

### Explanation

The `OR` operator returns results when **at least one condition is true**.

Conditions:
- Age = 10  
- City = 'Prague'  

### Result

Bob  
Mary
