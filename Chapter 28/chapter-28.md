# Chapter 28 – GRANT & REVOKE

GRANT and REVOKE are SQL security commands.

They control who can access or modify database objects.

---

# GRANT – Syntax

```sql
GRANT privilege1, privilege2
ON table_name
TO user1, user2
[WITH GRANT OPTION];
```

What it does:

Gives permissions such as:
- SELECT
- INSERT
- UPDATE
- DELETE

WITH GRANT OPTION:
Allows the user to pass that permission to others.

Think of it like:
"You may share this permission with friends."

---

# REVOKE – Syntax

```sql
REVOKE privilege1, privilege2
ON table_name
FROM user1, user2;
```

What it does:

Removes previously granted permissions.

---

# Example – GRANT

```sql
GRANT SELECT, UPDATE
ON Employees
TO User1, User2;
```

Result:

User1 and User2 can:
- Read employee data
- Modify employee data

---

# Example – REVOKE

```sql
REVOKE SELECT, UPDATE
ON Employees
FROM User1, User2;
```

Result:

User1 and User2 can no longer:
- Read data
- Update data

---

# WITH GRANT OPTION

```sql
GRANT SELECT
ON Employees
TO Manager
WITH GRANT OPTION;
```

Manager can now:
- SELECT from Employees
- Grant SELECT to others

Higher-level access control.

---

# Security Impact

Privileges affect only specific tables.

This allows:

Fine-grained access control.

Example:
- User can SELECT from Employees
- But cannot DELETE from Employees
- And cannot access Payroll table at all

---

# SQL Security vs Real Life

SQL Command            | Real Life Example
-----------------------|------------------------------
GRANT permission       | Giving someone a key
WITH GRANT OPTION      | Giving a key + permission to copy it
REVOKE                 | Taking the key away

---

# Important Notes

GRANT = Give access  
REVOKE = Remove access  

These commands are common in:

- SQL Server
- PostgreSQL
- MySQL

SQLite does not support user-based permissions.

---

# Mental Model

Database security works like building access:

No key → No entry  
Key → Access  
Key + Copy rights → Administrative power  

GRANT increases access.  
REVOKE locks it down.
