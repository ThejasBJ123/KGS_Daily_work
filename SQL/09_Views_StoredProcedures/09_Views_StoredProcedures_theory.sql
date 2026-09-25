-- ============================================================
-- STORED PROCEDURES & VIEWS – Complete Reference
-- ============================================================
--
-- STORED PROCEDURE:
--   A pre-defined, reusable collection of SQL statements saved
--   in the database that can be called by name.
--   Advantage: Reduces repetition, improves performance,
--              enhances security.
--
-- VIEW:
--   A virtual table created from a SELECT query.
--   Does NOT store data physically; it's a saved query.
--   Advantage: Simplifies complex queries, adds security layer.
-- ============================================================


CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;

DROP TABLE IF EXISTS STAFF;
CREATE TABLE STAFF (
    EMP_ID   INT         PRIMARY KEY,
    NAME     VARCHAR(50),
    DEPT     VARCHAR(30),
    SALARY   DECIMAL(10,2)
);

INSERT INTO STAFF VALUES
    (1, 'Rahul',  'IT',      55000),
    (2, 'Priya',  'HR',      48000),
    (3, 'Arjun',  'Finance', 62000),
    (4, 'Sneha',  'IT',      70000),
    (5, 'Vikram', 'HR',      45000),
    (6, 'Meera',  'Finance', 58000);


-- ============================================================
-- PART A: VIEWS
-- ============================================================

-- ------------------------------------------------------------
-- 1. CREATE VIEW – Save a SELECT query as a virtual table
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW IT_STAFF AS
SELECT EMP_ID, NAME, SALARY
FROM STAFF
WHERE DEPT = 'IT';

-- Use the view like a table
SELECT * FROM IT_STAFF;


-- CREATE VIEW for high earners
CREATE OR REPLACE VIEW HIGH_EARNERS AS
SELECT NAME, DEPT, SALARY
FROM STAFF
WHERE SALARY > 55000;

SELECT * FROM HIGH_EARNERS;


-- ------------------------------------------------------------
-- 2. UPDATE through a VIEW (if view is simple/updatable)
-- ------------------------------------------------------------
UPDATE IT_STAFF
SET SALARY = 72000
WHERE EMP_ID = 4;

SELECT * FROM STAFF WHERE EMP_ID = 4;   -- base table also updated


-- ------------------------------------------------------------
-- 3. DROP VIEW
-- ------------------------------------------------------------
DROP VIEW IF EXISTS IT_STAFF;
DROP VIEW IF EXISTS HIGH_EARNERS;


-- ============================================================
-- PART B: STORED PROCEDURES
-- ============================================================

-- Change delimiter so MySQL doesn't end on the first semicolon
DELIMITER $$

-- ------------------------------------------------------------
-- 4. Basic Stored Procedure – No parameters
-- ------------------------------------------------------------
DROP PROCEDURE IF EXISTS GetAllStaff;

CREATE PROCEDURE GetAllStaff()
BEGIN
    SELECT * FROM STAFF;
END $$

-- Call the procedure
CALL GetAllStaff(); $$


-- ------------------------------------------------------------
-- 5. Stored Procedure with IN parameter (input)
-- ------------------------------------------------------------
DROP PROCEDURE IF EXISTS GetByDept;

CREATE PROCEDURE GetByDept(IN dept_name VARCHAR(30))
BEGIN
    SELECT * FROM STAFF WHERE DEPT = dept_name;
END $$

CALL GetByDept('IT'); $$
CALL GetByDept('Finance'); $$


-- ------------------------------------------------------------
-- 6. Stored Procedure with OUT parameter (output)
-- ------------------------------------------------------------
DROP PROCEDURE IF EXISTS GetAvgSalary;

CREATE PROCEDURE GetAvgSalary(IN dept_name VARCHAR(30), OUT avg_sal DECIMAL(10,2))
BEGIN
    SELECT AVG(SALARY) INTO avg_sal
    FROM STAFF
    WHERE DEPT = dept_name;
END $$

CALL GetAvgSalary('IT', @result); $$
SELECT @result AS IT_Avg_Salary; $$


-- ------------------------------------------------------------
-- 7. Stored Procedure with INOUT parameter
-- ------------------------------------------------------------
DROP PROCEDURE IF EXISTS ApplyHike;

CREATE PROCEDURE ApplyHike(INOUT salary DECIMAL(10,2), IN percent DECIMAL(5,2))
BEGIN
    SET salary = salary + (salary * percent / 100);
END $$

SET @my_sal = 50000; $$
CALL ApplyHike(@my_sal, 10); $$
SELECT @my_sal AS Salary_After_Hike; $$

DELIMITER ;


-- ------------------------------------------------------------
-- 8. VIEW all stored procedures
-- ------------------------------------------------------------
SHOW PROCEDURE STATUS WHERE Db = 'PRACTICE';


-- ------------------------------------------------------------
-- 9. DROP a stored procedure
-- ------------------------------------------------------------
DROP PROCEDURE IF EXISTS GetAllStaff;
DROP PROCEDURE IF EXISTS GetByDept;
DROP PROCEDURE IF EXISTS GetAvgSalary;
DROP PROCEDURE IF EXISTS ApplyHike;
