show databases;

CREATE DATABASE practice1;

USE practice1;
DROP TABLE CUSTOMER;
CREATE TABLE Customer (
    custid INT PRIMARY KEY,
    custname VARCHAR(10),
    custphone INT
);
DROP TABLE ORDERS;

CREATE TABLE Orders (
    orderid INT PRIMARY KEY,
    orderdate DATE,
    cid INT,
    FOREIGN KEY (cid) REFERENCES Customer(custid)
    ON delete CASCADE
    ON update cascade
);


INSERT INTO Customer (custid, custname, custphone)
VALUES
(101, 'Prabu', 234343242),
(102, 'Raju', 2344887),
(103, 'Afsd', 2532);

INSERT INTO Orders (orderid, orderdate, cid)
VALUES
(201, '2026-09-25', 101),
(202, '2026-09-26', 102),
(203, '2026-09-27', 103),
(204, '2026-09-28', 101),
(205, '2026-09-29', 102);

select * from customer;
select * from Orders;

DELETE FROM Customer
WHERE custid = 101;

UPDATE  CUSTOMER SET CUSTID =105 WHERE CUSTID =103;


ON DELETE SET NULL
ON DELETE RESTRICT




use practice;
create table SALES(
PRODNAME VARCHAR(30),
Quantity int CHECK(quantity >0),
prodprice decimal(10,2) check(prodprice >0),
totPrice decimal(10,2) AS (quantity * prodprice)
);
INSERT INTO SALES(ProdName, quantity, prodprice) Values ("Apple", 5,10);
select * FROM Sales;


select CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME="SALES";

DESC SALES;



use practice;

create table traill1(
		EID INT auto_incremenT primary KEY,
        ENAME VARCHAR(30) NOT NULL CHECK(ENAME regexp '^[A-Z][a-z]&'),
        DEPT VARCHAR(20) NOT NULL
        );
        
CREATE INDEX DeptInd on EMPLOYEE(Dept);
 insert trial2

 use practice;

create table traill1(
		EID INT auto_incremenT primary KEY,
        ENAME VARCHAR(30) NOT NULL CHECK(ENAME regexp '^[A-Z][a-z]&'),
        DEPT VARCHAR(20) NOT NULL
        );
        
CREATE INDEX DeptInd on EMPLOYEE(Dept);
