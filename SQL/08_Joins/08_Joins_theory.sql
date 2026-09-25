-- ============================================================
-- SQL JOINS – Complete Reference
-- ============================================================
-- A JOIN combines rows from two or more tables based on a
-- related column (usually a Foreign Key ↔ Primary Key link).
--
-- Types of JOINs:
--   1. INNER JOIN   – Only matching rows from both tables
--   2. LEFT JOIN    – All rows from left + matching from right
--   3. RIGHT JOIN   – All rows from right + matching from left
--   4. FULL JOIN    – All rows from both (MySQL: UNION workaround)
--   5. CROSS JOIN   – Every combination (cartesian product)
--   6. SELF JOIN    – Join a table with itself
-- ============================================================


CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;

-- Setup: two related tables
DROP TABLE IF EXISTS ORDERS_J;
DROP TABLE IF EXISTS CUSTOMERS_J;

CREATE TABLE CUSTOMERS_J (
    C_ID   INT         PRIMARY KEY,
    C_NAME VARCHAR(50)
);

CREATE TABLE ORDERS_J (
    O_ID    INT PRIMARY KEY,
    C_ID    INT,
    PRODUCT VARCHAR(50),
    AMOUNT  DECIMAL(10,2)
);

INSERT INTO CUSTOMERS_J VALUES
    (1, 'Rahul'),
    (2, 'Priya'),
    (3, 'Arjun'),      -- no orders
    (4, 'Sneha');      -- no orders

INSERT INTO ORDERS_J VALUES
    (101, 1, 'Laptop',   55000),
    (102, 1, 'Mouse',     800),
    (103, 2, 'Phone',   15000),
    (104, 5, 'Keyboard',  1500); -- customer 5 doesn't exist


-- ------------------------------------------------------------
-- 1. INNER JOIN – Returns only matching rows from BOTH tables
-- ------------------------------------------------------------
SELECT C.C_NAME, O.PRODUCT, O.AMOUNT
FROM CUSTOMERS_J AS C
INNER JOIN ORDERS_J AS O
    ON C.C_ID = O.C_ID;
-- Result: Rahul, Priya (Arjun & Sneha excluded – no orders)


-- ------------------------------------------------------------
-- 2. LEFT JOIN – All rows from LEFT table + matching from RIGHT
--                NULLs where no match in right table
-- ------------------------------------------------------------
SELECT C.C_NAME, O.PRODUCT, O.AMOUNT
FROM CUSTOMERS_J AS C
LEFT JOIN ORDERS_J AS O
    ON C.C_ID = O.C_ID;
-- Result: All customers shown; Arjun & Sneha have NULL for order columns


-- ------------------------------------------------------------
-- 3. RIGHT JOIN – All rows from RIGHT table + matching from LEFT
--                 NULLs where no match in left table
-- ------------------------------------------------------------
SELECT C.C_NAME, O.PRODUCT, O.AMOUNT
FROM CUSTOMERS_J AS C
RIGHT JOIN ORDERS_J AS O
    ON C.C_ID = O.C_ID;
-- Result: All orders shown; the orphan order (C_ID=5) has NULL for C_NAME


-- ------------------------------------------------------------
-- 4. FULL OUTER JOIN (MySQL workaround using UNION)
-- ------------------------------------------------------------
-- MySQL doesn't support FULL JOIN directly.
-- Combine LEFT JOIN + RIGHT JOIN with UNION.
SELECT C.C_NAME, O.PRODUCT, O.AMOUNT
FROM CUSTOMERS_J AS C
LEFT JOIN ORDERS_J AS O ON C.C_ID = O.C_ID

UNION

SELECT C.C_NAME, O.PRODUCT, O.AMOUNT
FROM CUSTOMERS_J AS C
RIGHT JOIN ORDERS_J AS O ON C.C_ID = O.C_ID;


-- ------------------------------------------------------------
-- 5. CROSS JOIN – Every possible combination (no ON condition)
-- ------------------------------------------------------------
DROP TABLE IF EXISTS SIZES;
DROP TABLE IF EXISTS COLORS;

CREATE TABLE SIZES  (SIZE VARCHAR(10));
CREATE TABLE COLORS (COLOR VARCHAR(10));

INSERT INTO SIZES  VALUES ('S'),('M'),('L');
INSERT INTO COLORS VALUES ('Red'),('Blue');

-- Cartesian product: 3 sizes × 2 colors = 6 rows
SELECT * FROM SIZES CROSS JOIN COLORS;


-- ------------------------------------------------------------
-- 6. SELF JOIN – Join a table with itself
-- ------------------------------------------------------------
DROP TABLE IF EXISTS EMPLOYEES_J;
CREATE TABLE EMPLOYEES_J (
    EMP_ID    INT         PRIMARY KEY,
    EMP_NAME  VARCHAR(50),
    MANAGER_ID INT        -- references EMP_ID in the same table
);

INSERT INTO EMPLOYEES_J VALUES
    (1, 'CEO',    NULL),
    (2, 'Rahul',  1),
    (3, 'Priya',  1),
    (4, 'Arjun',  2);

-- Find each employee and their manager's name
SELECT E.EMP_NAME AS Employee, M.EMP_NAME AS Manager
FROM EMPLOYEES_J AS E
LEFT JOIN EMPLOYEES_J AS M
    ON E.MANAGER_ID = M.EMP_ID;
