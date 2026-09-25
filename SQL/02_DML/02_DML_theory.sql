-- ============================================================
-- DML - DATA MANIPULATION LANGUAGE
-- ============================================================
-- DML commands are used to perform operations (CRUD) on data
-- stored inside the database tables.
--
-- Commands: INSERT, UPDATE, DELETE
-- ============================================================


-- Setup: create a sample table for practice
CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;

DROP TABLE IF EXISTS EMPLOYEES;
CREATE TABLE EMPLOYEES (
    ID     INT,
    NAME   VARCHAR(50),
    DEPT   VARCHAR(30),
    SALARY DECIMAL(10,2)
);


-- ------------------------------------------------------------
-- 1. INSERT – Add new rows
-- ------------------------------------------------------------
-- Syntax: INSERT INTO table_name VALUES (...);
--         INSERT INTO table_name (col1, col2) VALUES (...);

-- Insert all columns in order
INSERT INTO EMPLOYEES VALUES (1, 'Rahul',  'IT',      55000.00);
INSERT INTO EMPLOYEES VALUES (2, 'Priya',  'HR',      48000.00);
INSERT INTO EMPLOYEES VALUES (3, 'Arjun',  'Finance', 62000.00);
INSERT INTO EMPLOYEES VALUES (4, 'Sneha',  'IT',      70000.00);
INSERT INTO EMPLOYEES VALUES (5, 'Vikram', 'HR',      45000.00);

-- Insert specific columns (others get NULL / DEFAULT)
INSERT INTO EMPLOYEES (ID, NAME) VALUES (6, 'Anjali');

-- Insert multiple rows at once
INSERT INTO EMPLOYEES VALUES
    (7, 'Karan',  'IT',      58000.00),
    (8, 'Meera',  'Finance', 61000.00);

SELECT * FROM EMPLOYEES;


-- ------------------------------------------------------------
-- 2. UPDATE – Modify existing rows
-- ------------------------------------------------------------
-- Syntax: UPDATE table_name SET col = val WHERE condition;
-- ⚠️  Always use WHERE to avoid updating ALL rows.

-- Update single column
UPDATE EMPLOYEES
SET SALARY = 60000.00
WHERE ID = 2;

-- Update multiple columns
UPDATE EMPLOYEES
SET DEPT = 'Marketing', SALARY = 52000.00
WHERE NAME = 'Anjali';

-- Update all rows (no WHERE – use with caution)
-- UPDATE EMPLOYEES SET SALARY = SALARY * 1.10;   -- 10% hike

SELECT * FROM EMPLOYEES;


-- ------------------------------------------------------------
-- 3. DELETE – Remove rows
-- ------------------------------------------------------------
-- Syntax: DELETE FROM table_name WHERE condition;
-- ⚠️  Without WHERE it deletes ALL rows (like TRUNCATE but slower).

-- Delete a specific row
DELETE FROM EMPLOYEES
WHERE ID = 6;

-- Delete rows matching a condition
DELETE FROM EMPLOYEES
WHERE DEPT = 'HR';

-- Delete all rows (keeps table structure)
-- DELETE FROM EMPLOYEES;

SELECT * FROM EMPLOYEES;
