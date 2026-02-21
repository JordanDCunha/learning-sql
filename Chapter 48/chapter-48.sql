-- =========================================
-- CHAPTER 48 — SQL CURSOR
-- Includes SQL Server, Oracle, PostgreSQL, MySQL Notes
-- =========================================


-- =========================================
-- 🔹 SQL SERVER EXAMPLE
-- =========================================

DECLARE @Name NVARCHAR(100);

DECLARE employee_cursor CURSOR FOR
SELECT Name FROM Employees;

OPEN employee_cursor;

FETCH NEXT FROM employee_cursor INTO @Name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @Name;

    FETCH NEXT FROM employee_cursor INTO @Name;
END;

CLOSE employee_cursor;
DEALLOCATE employee_cursor;



-- =========================================
-- 🔹 ORACLE EXAMPLE
-- =========================================

DECLARE
    v_name Employees.Name%TYPE;

    CURSOR employee_cursor IS
        SELECT Name FROM Employees;
BEGIN
    OPEN employee_cursor;

    LOOP
        FETCH employee_cursor INTO v_name;
        EXIT WHEN employee_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_name);
    END LOOP;

    CLOSE employee_cursor;
END;
/



-- =========================================
-- 🔹 POSTGRESQL (Inside Function)
-- =========================================

DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT Name FROM Employees LOOP
        RAISE NOTICE '%', rec.Name;
    END LOOP;
END $$;



-- =========================================
-- 🔹 MYSQL
-- =========================================

DELIMITER //

CREATE PROCEDURE cursor_example()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_name VARCHAR(100);

    DECLARE employee_cursor CURSOR FOR
        SELECT Name FROM Employees;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN employee_cursor;

    read_loop: LOOP
        FETCH employee_cursor INTO v_name;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT v_name;
    END LOOP;

    CLOSE employee_cursor;
END //

DELIMITER ;
