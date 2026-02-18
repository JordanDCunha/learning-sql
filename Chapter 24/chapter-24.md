# Chapter 24: Foreign Keys

---

## 🧠 What Is a Foreign Key?

A **foreign key** is a constraint that links one table to another.

It enforces this rule:

> Every value in this column must exist in the referenced table.

This maintains **referential integrity** and prevents orphaned records.

Example of orphaned data:
- A course linked to a department that does not exist
- A hero power assigned to a hero not in the main table

---

# Example 1 — HeroPowers

```sql
CREATE TABLE HeroPowers
(
    ID int NOT NULL PRIMARY KEY,
    Name nvarchar(MAX) NOT NULL,
    HeroId int REFERENCES SuperHeros(ID)
);
