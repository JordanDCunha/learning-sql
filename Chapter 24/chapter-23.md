# Chapter 24: Foreign Keys

## 🧠 What is a Foreign Key?

A foreign key is a constraint that links one table to another.

It enforces the rule:

"Every value in this column must exist in another table."

This maintains referential integrity and prevents orphaned records.

Example:
A course cannot belong to a department that does not exist.

---

## Example 1: Simple Foreign Key (HeroPowers)

This table links hero powers to heroes.

- ID → Primary key
- HeroId → Foreign key referencing SuperHeros(ID)

If you try to insert a HeroId that does not exist in SuperHeros, the database will reject it.

---

## Example 2: Parent and Child Tables

### Parent Table: Department

- Dept_Code → Primary key
- Dept_Name → Must be unique

This table stores departments.

### Insert Example

We insert one department:

- CS205 → Computer Science

---

### Child Table: Programming_Courses

- Prg_Code → Primary key
- Dept_Code → Foreign key referencing Department(Dept_Code)

This ensures every course belongs to a valid department.

---

## Foreign Key Violation Example

If we try to insert:

Dept_Code = 'CS300'

It fails because CS300 does not exist in Department.

---

## Valid Insert Example

If we insert courses using:

Dept_Code = 'CS205'

It succeeds because CS205 exists in the parent table.

---

## Summary

Primary Key:
Uniquely identifies a row.

Foreign Key:
References a primary key in another table.

Parent Table:
The referenced table.

Child Table:
The table containing the foreign key.

Referential Integrity:
Ensures related data remains valid.
