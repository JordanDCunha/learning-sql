/* =========================================================
   Chapter 24: Foreign Keys
   ========================================================= */

/* Example 1 */

CREATE TABLE HeroPowers
(
    ID int NOT NULL PRIMARY KEY,
    Name nvarchar(MAX) NOT NULL,
    HeroId int REFERENCES SuperHeros(ID)
);


/* Example 2 */

CREATE TABLE Department (
    Dept_Code CHAR(5) PRIMARY KEY,
    Dept_Name VARCHAR(20) UNIQUE
);

INSERT INTO Department 
VALUES ('CS205', 'Computer Science');


CREATE TABLE Programming_Courses (
    Dept_Code CHAR(5),
    Prg_Code CHAR(9) PRIMARY KEY,
    Prg_Name VARCHAR(50) UNIQUE,
    FOREIGN KEY (Dept_Code) REFERENCES Department(Dept_Code)
);


INSERT INTO Programming_Courses 
VALUES ('CS300', 'FDB-DB001', 'Database Systems');   -- will fail

INSERT INTO Programming_Courses 
VALUES ('CS205', 'FDB-DB001', 'Database Systems');

INSERT INTO Programming_Courses 
VALUES ('CS205', 'DB2-DB002', 'Database Systems II');
