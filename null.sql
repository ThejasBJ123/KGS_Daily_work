use practice;
CREATE TABLE NULLTRAIL(
    col1 INT,
    Col2 INT
);

INSERT INTO NULLTRAIL VALUES(NULL, NULL);

SELECT *FROM NULLTRAIL
WHERE col1 = col2


USE Practice;
CREATE TABLE STUDENTS(
sid int NOT NULL,
sname varchar(30) NOT NULL,
semailId varchar(30)
);

DESC STUDENTS;

INSERT INTO STUDENTS VALUES(101, "paurul","parul@gmail.com");
INSERT INTO STUDENTS VALUES(102,"abhi", "raghu@gmail.com");
INSERT INTO STUDENTS VALUES(102,"chandu", NULL);

SELECT *FROM STUDENTS;







USE Practice;
drop table students;
CREATE TABLE STUDENTS(
sid int NOT NULL,
sname varchar(30) NOT NULL,
semailId varchar(30) unique
);

DESC STUDENTS;

INSERT INTO STUDENTS VALUES(101, "paurul","parul@gmail.com");
INSERT INTO STUDENTS VALUES(102,"abhi", "raghu@gmail.com");
INSERT INTO STUDENTS VALUES(102,"chandu", NULL);
-- INSERT INTO STUDENTS VALUES(102,NULL, NULL);

INSERT INTO STUDENTS VALUES(103,"chandu", "chandu1@gmail.com");
INSERT INTO STUDENTS VALUES(104,"chandu", "chandu1@gmail.com");

SELECT *FROM STUDENTS;






DROP TABLE STUDENTS;
CREATE TABLE STUDENTS(
sid int PRIMARY KEY,
sname varchar(30) NOT NULL,
semailId varchar(30) NOT NULL UNIQUE
);

DESC STUDENTS;
SHOW INDEX FROM STUDNETS;
 
 
INSERT INTO STUDENTS VALUES(101, "Parul", "parulgmail.com");
INSERT INTO STUDENTS VALUES(102, "Raghu", "raghu@gamil.com");
INSERT INTO STUDENTS VALUES(103, "raju", "raju@gamil.com");
INSERT INTO STUDENTS VALUES(104, "Rajeev", "rajeev@gamil.com");
INSERT INTO STUDENTS VALUES(105, "Rajeev", "rajeev.@gamil.com");


SELECT * FROM STUDENTS;

CREATE TABLE LIBARY(
sid int,
libib int,
sname varchar(30),
primary key(sid, libib));


INSERT INTO LIBARY VALUES (101, 1, 'Thejas');
INSERT INTO LIBARY VALUES (101, 2, 'Thejas');
INSERT INTO LIBARY VALUES (102, 1, 'Rahul');


SELECT * FROM LIBARY;

DROP TABLE TRIAL;
CREATE TABLE TRIAL(
col1 int primary key,
col2 int primary key
);

