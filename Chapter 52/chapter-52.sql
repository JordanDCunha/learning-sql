-- ==========================================
-- Chapter 52 — String Functions Examples
-- ==========================================

-- 1. Trim
SELECT LTRIM(' Hello');
SELECT RTRIM('Hello ');
SELECT TRIM(' Hello ');

-- 2. Concatenation
SELECT 'Hello' || 'World' || '!';
SELECT CONCAT('Hello', 'World', '!');
SELECT 'Foo' + CAST(42 AS VARCHAR(5)) + 'Bar';

-- 3. Case Conversion
SELECT UPPER('HelloWorld');
SELECT LOWER('HelloWorld');

-- 4. Substring
SELECT SUBSTRING('Hello', 1, 2);
SELECT SUBSTRING('Hello', 3, 3);

DECLARE @str VARCHAR(10) = 'FooBar';
SELECT SUBSTRING(@str, LEN(@str) - 2, 3);

-- 5. STRING_SPLIT
SELECT value
FROM STRING_SPLIT('Lorem,ipsum,dolor', ',');

-- 6. STUFF
SELECT STUFF('FooBarBaz', 4, 3, 'Hello');

-- 7. Length Functions
SELECT LEN('Hello');
SELECT LEN('Hello ');
SELECT DATALENGTH('Hello ');

-- 8. Replace
SELECT REPLACE('Peter Steve Tom', 'Steve', 'Billy');

-- 9. LEFT / RIGHT
SELECT LEFT('Hello', 2);
SELECT RIGHT('Hello', 2);

-- 10. Reverse
SELECT REVERSE('Hello');

-- 11. Replicate
SELECT REPLICATE('Hello', 4);

-- 12. REGEXP (MySQL)
SELECT 'bedded' REGEXP '[a-f]';
SELECT 'beam' REGEXP '[a-f]';

-- 13. PARSENAME (SQL Server)
SELECT PARSENAME('Server.Database.Schema.Table', 1);

-- 14. INSTR (Oracle/MySQL)
SELECT INSTR('FooBarBar', 'Bar');
