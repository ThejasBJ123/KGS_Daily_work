DML  --> DATA MANIPULATION LANGUAGE
--------------------------------

* it helps to perform manipulation operations on the recods of the table 
* it does not affect the structure of the table.
* types : INSERT, UPDATE, DELETE


INSERT:
------
* It helps to add a record to the exisiting table 
    syn: to insert a record to all the cols one by one into a table.
     INSERT INTO TBL_NAME VALUES(VAL1, VAL2,.......VALN)

    syn: TO insert a record to specific cols ne by one into a table .
     INSERT INTO TBL_NAME(col3, col4, col5) VALUES(val3, val4, val5);


    syn: to insert multiple records to all the cols of the table

    INSERT INTO TBL_NAME VALUES
    (Val1, val2,..... valn),
    (Val1, val2,..... valn),
    (Val1, val2,..... valn),
    (Val1, val2,..... valn),
    (Val1, val2,..... valn),
    ........
    (Val1, val2,..... valn),

    syn: To insert multiple recourd to specific cols of table

    INSERT INTO TBL_NAME(COL3, COL4) VALUES
    (Val3, Val4),
    (Val3, Val4),
    (Val3, Val4),
    .......
    (Val3, Val4);

    DROP TABLE IF EXISTS STUDENTS;

CREATE TABLE STUDENTS(
SID VARCHAR(5) PRIMARY KEY,
SNAME VARCHAR(20) CHECK(SNAME REGEXP '^[A-Z][a-z]+$'),
LNAME VARCHAR(20) CHECK(LNAME REGEXP '^[A-Z][a-z]+$'),
SSUB VARCHAR(20) CHECK(SSUB REGEXP '^[A-Z][a-z]+$')
);

INSERT INTO STUDENTS VALUES('S101', 'Priya', 'Kr', 'Maths');
INSERT INTO STUDENTS(SID,SNAME,SSUB) VALUES('S102', 'Mathew', 'Maths');

INSERT INTO STUDENTS VALUES
('S103', 'Priya', 'Kr', 'Maths'),
('S104', 'Rya', 'Kr', 'Social'),
('S105', 'Prasdiya', 'Kr', 'Maths');

INSERT INTO STUDENTS(SID,SNAME,SSUB) VALUES
('S106', 'Mathew', 'Maths'),
('S107', 'Matasdf', 'Maths'),
('S108', 'Matasdfw', 'Science');

SELECT * FROM STUDENTS;


CREATE TABLE STUDENTS_BACKUP(
SID VARCHAR(5) PRIMARY KEY,
SNAME VARCHAR(20) CHECK(SNAME REGEXP '^[A-Z][a-z]+$'),
LNAME VARCHAR(20) CHECK(LNAME REGEXP '^[A-Z][a-z]+$'),
SSUB VARCHAR(20) CHECK(SSUB REGEXP '^[A-Z][a-z]+$')
);

INSERT INTO STUDENTS_BACKUP SELECT * FROM STUDENTS;
SELECT * FROM STUDENTS_BACKUP;


CREATE TABLE STUDENTS_BACKUP_MATHS(
SID VARCHAR(5) PRIMARY KEY,
SNAME VARCHAR(20) CHECK(SNAME REGEXP '^[A-Z][a-z]+$'),
LNAME VARCHAR(20) CHECK(LNAME REGEXP '^[A-Z][a-z]+$'),
SSUB VARCHAR(20) CHECK(SSUB REGEXP '^[A-Z][a-z]+$')
);

INSERT INTO STUDENTS_BACKUP_MATHS
SELECT * FROM STUDENTS WHERE SSUB='Maths';

SELECT * FROM STUDENTS_BACKUP_MATHS;


CREATE TABLE STUDENTS_SUBJECTS(
SID VARCHAR(5) PRIMARY KEY,
SSUB VARCHAR(20) CHECK(SSUB REGEXP '^[A-Z][a-z]+$')
);

INSERT INTO STUDENTS_SUBJECTS
SELECT SID, SSUB FROM STUDENTS;

SELECT * FROM STUDENTS_SUBJECTS;


CREATE TABLE STUDENTS_NAME(
SID INT AUTO_INCREMENT PRIMARY KEY,
SNAME VARCHAR(20)
);

INSERT INTO STUDENTS_NAME(SNAME)
SELECT SNAME FROM STUDENTS;

SELECT * FROM STUDENTS_NAME;


UPDATE STUDENTS_BACKUP
SET LNAME = 'Mr'
WHERE SID = 'S106';

UPDATE STUDENTS_BACKUP
SET SNAME = 'Rya',
    LNAME = 'Mmmr'
WHERE SID = 'S106';

UPDATE STUDENTS_BACKUP
SET LNAME = 'Dr'
WHERE SSUB LIKE 'Mat%';


DELETE FROM STUDENTS_BACKUP_MATHS
WHERE SID='S104';

DELETE FROM STUDENTS_BACKUP_MATHS;





### DROP: 
* It is a DDL cmd
* While executed the entire table is deleted permanently 
* The Table structure is lost
* "WHERE" Clause cannot be used 
* Execution is fast 
* ROLLBACK is not possible 
* It affect the DB.

### TRUNCATE: 
* It is a DDL cmd
* While executed the all the records is deleted
* the table structure is intact
* "WHERE" clause cannot be used.
* Execution is medium

### DELETE:
* It is a DML cmd
* While executed the all the recourds is deleted
* The tbl structure is intact
* "WHERE" Clause cannot be used 
* Execution is fast
* ROLLBACK is possible until the transaction 
