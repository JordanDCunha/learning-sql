-- =========================================
-- CHAPTER 59 — TRY/CATCH
-- Includes SQL Server, PostgreSQL, Oracle, MySQL examples
-- =========================================



-- =========================================
-- 🔹 SQL SERVER — TRY/CATCH WITH TRANSACTION
-- =========================================

CREATE TABLE dbo.Sale (
    SaleID INT IDENTITY PRIMARY KEY,
    Price DECIMAL(5,2),
    SaleDate DATETIME,
    Quantity INT
);
GO

BEGIN TRANSACTION
BEGIN TRY
    INSERT INTO dbo.Sale (Price, SaleDate, Quantity)
    VALUES (5.2, GETDATE(), 1);

    -- This will cause an error
    INSERT INTO dbo.Sale (Price, SaleDate, Quantity)
    VALUES (5.2, 'not a date', 1);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
    ROLLBACK TRANSACTION;
END CATCH;
GO



-- =========================================
-- 🔹 SQL SERVER — SUCCESSFUL TRANSACTION
-- =========================================

BEGIN TRANSACTION
BEGIN TRY
    INSERT INTO dbo.Sale (Price, SaleDate, Quantity)
    VALUES (5.2, GETDATE(), 1);

    INSERT INTO dbo.Sale (Price, SaleDate, Quantity)
    VALUES (5.2, GETDATE(), 1);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
    ROLLBACK TRANSACTION;
END CATCH;
GO



-- =========================================
-- 🔹 POSTGRESQL — EXCEPTION HANDLING
-- =========================================

DO $$
BEGIN
    BEGIN
        INSERT INTO sale(price, saledate, quantity)
        VALUES (5.2, CURRENT_TIMESTAMP, 1);

        -- Force error
        INSERT INTO sale(price, saledate, quantity)
        VALUES (5.2, 'invalid date', 1);

    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE 'Error: %', SQLERRM;
            ROLLBACK;
    END;
END;
$$;



-- =========================================
-- 🔹 ORACLE — EXCEPTION BLOCK
-- =========================================

BEGIN
    INSERT INTO Sale (Price, SaleDate, Quantity)
    VALUES (5.2, SYSDATE, 1);

    -- Force error
    INSERT INTO Sale (Price, SaleDate, Quantity)
    VALUES (5.2, TO_DATE('invalid','YYYY'), 1);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        ROLLBACK;
END;
/



-- =========================================
-- 🔹 MYSQL — HANDLER (Equivalent Concept)
-- =========================================

DELIMITER //

CREATE PROCEDURE test_transaction()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error occurred — rolled back';
    END;

    START TRANSACTION;

    INSERT INTO Sale (Price, SaleDate, Quantity)
    VALUES (5.2, NOW(), 1);

    -- Force error
    INSERT INTO Sale (Price, SaleDate, Quantity)
    VALUES (5.2, 'invalid date', 1);

    COMMIT;
END //

DELIMITER ;
