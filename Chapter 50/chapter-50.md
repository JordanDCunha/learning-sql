# ✅ Chapter 50 — SQL Injection — Study Guide

---

# 🎯 Purpose / Definition

**SQL Injection (SQLi)** is a class of vulnerability where untrusted input is incorporated into SQL statements in a way that allows an attacker to change the intended query.

Successful exploitation can:

- Disclose data  
- Modify or delete data  
- Escalate privileges  

---

# ❓ Why It Happens

- Queries are constructed by concatenating user input into SQL strings.
- The database executes whatever SQL it receives.
- Injected SQL becomes executable.
- Naïve escaping is brittle and error-prone.
- Parameters / prepared statements are the correct defense.

---

# 🚨 Basic Consequences

- Bypass authentication (log in as someone else)
- Read sensitive data (passwords, PII)
- Modify or delete data
- Execute administrative commands (depending on DB permissions)
- Pivot to other systems if DB credentials are obtained

---

# 🌐 Attack Surface

Any field that reaches SQL:

- Login forms  
- Search boxes  
- URL parameters  
- Cookies  
- Headers  
- File uploads  
- Web apps  
- APIs  
- Reporting tools  
- Admin consoles  

---

# 🛡 Core Defensive Principles

✔ Use **parameterized queries / prepared statements**  
✔ Never concatenate user input into SQL  
✔ Apply **least privilege** to database accounts  
✔ Validate and normalize input (whitelisting)  
✔ Use ORMs or safe DB libraries that default to parameterization  
✔ Escape only when necessary using DB-specific safe APIs  
✔ Avoid returning sensitive data in application errors  
✔ Log securely  
✔ Use Web Application Firewalls (WAFs) as an additional layer  
✔ Perform audits, code reviews, static analysis, and security testing  

---

# 🧾 Code & Examples (Defensive Focus)

---

## ❌ Vulnerable Pattern (DO NOT USE)

```sql
-- Vulnerable: concatenating raw input into SQL
txtSQL = "SELECT * FROM Users WHERE username = '" + strUserName +
         "' AND password = '" + strPassword + "'";
db.execute(txtSQL);
```

Why vulnerable:  
An attacker-controlled `strUserName` or `strPassword` can break out of the string literal and append SQL.

---

# ✅ Safe Pattern — Parameterized / Prepared Statements (Recommended)

---

## ✅ Example: C# / ADO.NET

```csharp
using(var cmd = new SqlCommand(
    "SELECT * FROM Users WHERE username = @username AND password = @password", conn))
{
    cmd.Parameters.AddWithValue("@username", strUserName);
    cmd.Parameters.AddWithValue("@password", strPassword);

    using(var rdr = cmd.ExecuteReader())
    {
        // Process results
    }
}
```

---

## ✅ Example: Python (DB-API / psycopg2)

```python
cur.execute(
  "SELECT * FROM users WHERE username = %s AND password = %s",
  (username, password)
)
```

---

## ✅ Example: MySQL (Prepared Statement)

```sql
PREPARE stmt FROM
  'SELECT * FROM Users WHERE username = ? AND password = ?';

SET @username = 'user_input';
SET @password = 'user_input';

EXECUTE stmt USING @username, @password;

DEALLOCATE PREPARE stmt;
```

---

# 🧠 Key Takeaway

If you remember only one rule:

👉 **Never build SQL by string concatenation with user input.**

Always use parameterized queries.
