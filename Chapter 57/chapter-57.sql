-- ==========================================
-- Chapter 57 — Triggers Examples
-- ==========================================

-- 1. Audit Trigger (AFTER INSERT)
CREATE TRIGGER MyTrigger
ON MyTable
AFTER INSERT
AS
BEGIN
    INSERT INTO MyAudit (MyTableId, [User])
    SELECT MyTableId, CURRENT_USER
    FROM inserted;
END;
GO



-- 2. Recycle Bin Trigger (AFTER DELETE)
CREATE TRIGGER BooksDeleteTrigger
ON MyBooksDB.Books
AFTER DELETE
AS
BEGIN
    INSERT INTO BooksRecycleBin
    SELECT *
    FROM deleted;
END;
GO



-- 3. INSTEAD OF DELETE Trigger Example
CREATE TRIGGER PreventDeleteTrigger
ON MyTable
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Delete operation prevented.';
END;
GO



-- 4. Example: UPDATE Trigger Using inserted & deleted
CREATE TRIGGER UpdateAuditTrigger
ON MyTable
AFTER UPDATE
AS
BEGIN
    INSERT INTO MyAudit (MyTableId, OldValue, NewValue, ModifiedBy)
    SELECT 
        d.MyTableId,
        d.SomeColumn AS OldValue,
        i.SomeColumn AS NewValue,
        CURRENT_USER
    FROM deleted d
    JOIN inserted i 
        ON d.MyTableId = i.MyTableId;
END;
GO
