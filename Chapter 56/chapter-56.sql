-- ==========================================
-- Chapter 56 — Transactions Examples
-- ==========================================

-- 1. Simple Transaction
BEGIN TRANSACTION;

INSERT INTO DeletedEmployees (EmployeeID, DateDeleted, [User])
SELECT 123, GETDATE(), CURRENT_USER;

DELETE FROM Employees
WHERE EmployeeID = 123;

COMMIT TRANSACTION;



-- 2. Transaction with TRY...CATCH (Rollback on Error)
BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO Users (ID, Name, Age)
    VALUES (1, 'Bob', 24);

    DELETE FROM Users
    WHERE Name = 'Todd';

    COMMIT TRANSACTION;
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;

    -- Optional: return error information
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;



-- 3. Example Using SAVEPOINT (Advanced)
BEGIN TRANSACTION;

INSERT INTO Users (ID, Name, Age)
VALUES (2, 'Alice', 30);

SAVE TRANSACTION SavePoint1;

INSERT INTO Users (ID, Name, Age)
VALUES (3, 'Charlie', 28);

-- Roll back only to the savepoint
ROLLBACK TRANSACTION SavePoint1;

COMMIT TRANSACTION;
