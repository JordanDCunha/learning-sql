-- =========================================
-- CHAPTER 64 — XML
-- SQL Server Focused (XML Data Type + XQuery)
-- =========================================



-- =========================================
-- 🔹 DECLARE XML VARIABLE
-- =========================================

DECLARE @xmlIN XML = '
<TableData>
    <aaa Main="First">
        <row name="a" value="1" />
        <row name="b" value="2" />
        <row name="c" value="3" />
    </aaa>
    <aaa Main="Second">
        <row name="a" value="3" />
        <row name="b" value="4" />
        <row name="c" value="5" />
    </aaa>
    <aaa Main="Third">
        <row name="a" value="10" />
        <row name="b" value="20" />
        <row name="c" value="30" />
    </aaa>
</TableData>';



-- =========================================
-- 🔹 SHRED XML INTO ROWS
-- =========================================

SELECT 
    t.col.value('../@Main', 'VARCHAR(10)') AS Header,
    t.col.value('@name', 'VARCHAR(25)') AS Name,
    t.col.value('@value', 'VARCHAR(25)') AS Value
FROM 
    @xmlIN.nodes('//TableData/aaa/row') AS t(col);



-- =========================================
-- 🔹 USING .query()
-- =========================================

SELECT @xmlIN.query('/TableData/aaa[@Main="Second"]');



-- =========================================
-- 🔹 STORING XML IN A TABLE
-- =========================================

CREATE TABLE XmlStorage (
    Id INT PRIMARY KEY,
    XmlData XML
);

INSERT INTO XmlStorage (Id, XmlData)
VALUES (1, @xmlIN);



-- =========================================
-- 🔹 CREATING XML INDEX (SQL Server)
-- =========================================

-- Primary XML Index
-- CREATE PRIMARY XML INDEX PXML_XmlStorage
-- ON XmlStorage(XmlData);
