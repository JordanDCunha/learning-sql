-- =========================================
-- Example 1: HeroPowers with Foreign Key
-- =========================================

CREATE TABLE SuperHeros (
    ID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);

CREATE TABLE HeroPowers (
    ID INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    HeroId INT REFERENCES SuperHeros(ID)
);


-- =========================================
-- Example 2: Parent Table
-- =========================================

CREATE TABLE Department (
    Dept_Code CHAR(5) PRIMARY KEY,
    Dept_Name VARCHAR(20) UNIQUE
);

INSERT INTO Department VALUES ('CS205', 'Computer Science');


-- =========================================
-- Child Table with Foreign Key
-- =========================================

CREATE TABLE Programming_Courses (
    Dept_Code CHAR(5),
    Prg_Code CHAR(9) PRIMARY KEY,
    Prg_Name VARCHAR(50) UNIQUE,
    FOREIGN KEY (Dept_Code) REFERENCES Department(Dept_Code)
);


-- =========================================
-- Foreign Key Violation (Will Fail)
-- =========================================

INSERT INTO Programming_Courses 
VALUES ('CS300', 'FDB-DB001', 'Database Systems');


-- =========================================
-- Valid Inserts (Will Work)
-- =========================================

INSERT INTO Programming_Courses 
VALUES ('CS205', 'FDB-DB001', 'Database Systems');

INSERT INTO Programming_Courses 
VALUES ('CS205', 'DB2-DB002', 'Database Systems II');
