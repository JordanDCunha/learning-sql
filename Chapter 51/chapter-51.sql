-- =========================================
-- CHAPTER 51 — STORED PROCEDURES
-- Includes SQL Server, PostgreSQL, Oracle, MySQL examples
-- =========================================


-- =========================================
-- 🔹 SQL SERVER EXAMPLE
-- =========================================

CREATE PROCEDURE getEmployee
    @LastName nvarchar(50),
    @FirstName nvarchar(50)
AS
BEGIN
    SELECT FirstName, LastName, Department
    FROM vEmployeeDepartment
    WHERE FirstName = @FirstName
      AND LastName = @LastName
      AND EndDate IS NULL;
END;
GO


-- Execute
EXEC getEmployee @LastName = N'Ackerman', @FirstName = N'Pilar';
GO



-- =========================================
-- 🔹 OUTPUT PARAMETER EXAMPLE (SQL SERVER)
-- =========================================

CREATE PROCEDURE GetOrderCount
    @CustomerID INT,
    @OrderCount INT OUTPUT
AS
BEGIN
    SELECT @OrderCount = COUNT(*)
    FROM Orders
    WHERE CustomerID = @CustomerID;
END;
GO



-- =========================================
-- 🔹 POSTGRESQL FUNCTION (Equivalent Concept)
-- =========================================

CREATE OR REPLACE FUNCTION get_employee(p_lastname TEXT, p_firstname TEXT)
RETURNS TABLE (FirstName TEXT, LastName TEXT, Department TEXT)
AS $$
BEGIN
    RETURN QUERY
    SELECT FirstName, LastName, Department
    FROM vEmployeeDepartment
    WHERE FirstName = p_firstname
      AND LastName = p_lastname;
END;
$$ LANGUAGE plpgsql;



-- =========================================
-- 🔹 ORACLE PROCEDURE
-- =========================================

CREATE OR REPLACE PROCEDURE getEmployee (
    p_LastName IN VARCHAR2,
    p_FirstName IN VARCHAR2
)
AS
BEGIN
    FOR rec IN (
        SELECT FirstName, LastName, Department
        FROM vEmployeeDepartment
        WHERE FirstName = p_FirstName
          AND LastName = p_LastName
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.FirstName || ' ' || rec.LastName);
    END LOOP;
END;
/



-- =========================================
-- 🔹 MYSQL PROCEDURE
-- =========================================

DELIMITER //

CREATE PROCEDURE getEmployee (
    IN p_LastName VARCHAR(50),
    IN p_FirstName VARCHAR(50)
)
BEGIN
    SELECT FirstName, LastName, Department
    FROM vEmployeeDepartment
    WHERE FirstName = p_FirstName
      AND LastName = p_LastName;
END //

DELIMITER ;
