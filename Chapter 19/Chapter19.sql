-- =========================================
-- Chapter 19: Execution Blocks
-- =========================================

-- Basic BEGIN...END Block
-- Groups multiple SQL statements together

BEGIN

    UPDATE Employees
    SET PhoneNumber = '5551234567'
    WHERE Id = 1;

    UPDATE Employees
    SET Salary = Salary + 100
    WHERE Id = 2;

END;


-- =========================================
-- Example with Transaction Control
-- =========================================

-- This ensures all statements succeed together
-- If one fails, you can ROLLBACK

BEGIN TRANSACTION;

BEGIN

    UPDATE Employees
    SET Salary = Salary + 200
    WHERE DepartmentId = 1;

    INSERT INTO Employees
    (FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate)
    VALUES
    ('Test', 'User', '5550001111', NULL, 1, 800, NOW());

END;

-- If everything is correct:
COMMIT;

-- If something goes wrong:
-- ROLLBACK;


-- =========================================
-- Example Inside Stored Procedure (SQL Server Style)
-- =========================================

/*
CREATE PROCEDURE UpdateEmployeePhone
AS
BEGIN
    UPDATE Employees
    SET PhoneNumber = '9998887777'
    WHERE Id = 3;
END;
*/


-- =========================================
-- Notes
-- =========================================
-- BEGIN...END groups statements.
-- Statements execute sequentially.
-- Often used inside:
--   - Stored procedures
--   - Triggers
--   - Transactions
-- Helps maintain logical organization and data consistency.
