# Chapter 10 – CREATE FUNCTION

---

# Concept Overview

The CREATE FUNCTION statement defines a User-Defined Function (UDF).

A UDF allows reusable SQL logic that:

- Accepts parameters
- Returns a value (scalar function)
- Can be used inside SELECT, INSERT, UPDATE, DELETE

---

# Standard SQL Server Syntax

CREATE FUNCTION function_name ([parameters])
RETURNS return_type
AS
BEGIN
    function_body
    RETURN value
END

---

# Example (SQL Server)

CREATE FUNCTION FirstWord (@input varchar(1000))
RETURNS varchar(1000)
AS
BEGIN
    DECLARE @output varchar(1000)

    SET @output = SUBSTRING(
        @input,
        1,
        CASE CHARINDEX(' ', @input)
            WHEN 0 THEN LEN(@input)
            ELSE CHARINDEX(' ', @input) - 1
        END
    )

    RETURN @output
END

This function:

- Accepts a string
- Returns the first word

---

# Important: SQLite Limitation

SQLite does NOT support CREATE FUNCTION in SQL.

Why?

SQLite only allows custom functions to be created in application code
(Python, C, Java, etc.)

Example in Python:

connection.create_function("FirstWord", 1, python_function)

---

# SQLite Equivalent

You must inline the logic using built-in functions:

- INSTR()
- SUBSTR()
- CASE

Example:

SELECT
    CASE
        WHEN INSTR(TextValue, ' ') = 0
            THEN TextValue
        ELSE SUBSTR(TextValue, 1, INSTR(TextValue, ' ') - 1)
    END
FROM Example;

---

# Mental Model

SQL Server:
CREATE FUNCTION → reusable stored logic

SQLite:
No SQL-level UDFs → logic must be inline or created in application code
