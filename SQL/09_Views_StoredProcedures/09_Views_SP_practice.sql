-- =============================================================
--          VIEWS & STORED PROCEDURES PRACTICE
-- =============================================================
-- Run each block step by step in MySQL Workbench.
-- =============================================================

CREATE DATABASE IF NOT EXISTS VIEWS_SP_PRACTICE;
USE VIEWS_SP_PRACTICE;

-- -------------------------------------------------------
-- Setup Tables
-- -------------------------------------------------------
DROP TABLE IF EXISTS ORDER_ITEMS;
DROP TABLE IF EXISTS EMPLOYEES;

CREATE TABLE EMPLOYEES (
    emp_id     INT PRIMARY KEY AUTO_INCREMENT,
    emp_name   VARCHAR(50) NOT NULL,
    department VARCHAR(30),
    salary     DECIMAL(10, 2),
    city       VARCHAR(30)
);

INSERT INTO EMPLOYEES (emp_name, department, salary, city) VALUES
('Rahul',    'IT',        55000, 'Mumbai'),
('Priya',    'HR',        48000, 'Delhi'),
('Abhishek', 'Finance',   62000, 'Pune'),
('Sneha',    'IT',        58000, 'Hyderabad'),
('Ravi',     'Marketing', 45000, 'Chennai'),
('Kiran',    'IT',        70000, 'Bangalore');

SELECT * FROM EMPLOYEES;

-- ======================
-- PART A: VIEWS
-- ======================

-- 1. Simple View - Show only IT department employees
CREATE OR REPLACE VIEW IT_EMPLOYEES AS
SELECT emp_name, salary, city
FROM EMPLOYEES
WHERE department = 'IT';

SELECT * FROM IT_EMPLOYEES;

-- 2. View with calculated column - Show name and annual salary
CREATE OR REPLACE VIEW ANNUAL_SALARY AS
SELECT emp_name, department, salary * 12 AS annual_salary
FROM EMPLOYEES;

SELECT * FROM ANNUAL_SALARY;

-- 3. View with aggregate - Average salary per department
CREATE OR REPLACE VIEW DEPT_AVG_SALARY AS
SELECT department, AVG(salary) AS avg_salary, COUNT(*) AS total_employees
FROM EMPLOYEES
GROUP BY department;

SELECT * FROM DEPT_AVG_SALARY;

-- 4. Updating data through a view (simple view is updatable)
UPDATE IT_EMPLOYEES
SET salary = 60000
WHERE emp_name = 'Rahul';

SELECT * FROM EMPLOYEES;

-- 5. Dropping a view
DROP VIEW IF EXISTS ANNUAL_SALARY;

-- ==============================
-- PART B: STORED PROCEDURES
-- ==============================

-- 6. Simple Stored Procedure - Get all employees
DELIMITER $$
CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM EMPLOYEES;
END $$
DELIMITER ;

CALL GetAllEmployees();

-- 7. Stored Procedure with IN parameter - Get employees by department
DELIMITER $$
CREATE PROCEDURE GetByDept(IN dept_name VARCHAR(30))
BEGIN
    SELECT emp_name, salary, city
    FROM EMPLOYEES
    WHERE department = dept_name;
END $$
DELIMITER ;

CALL GetByDept('IT');
CALL GetByDept('HR');

-- 8. Stored Procedure with OUT parameter - Get total employees in a dept
DELIMITER $$
CREATE PROCEDURE CountByDept(IN dept_name VARCHAR(30), OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total
    FROM EMPLOYEES
    WHERE department = dept_name;
END $$
DELIMITER ;

CALL CountByDept('IT', @total);
SELECT @total AS IT_Employee_Count;

-- 9. Stored Procedure with INOUT parameter
DELIMITER $$
CREATE PROCEDURE IncreaseSalary(INOUT emp_salary DECIMAL(10,2), IN increment DECIMAL(10,2))
BEGIN
    SET emp_salary = emp_salary + increment;
END $$
DELIMITER ;

SET @sal = 55000;
CALL IncreaseSalary(@sal, 5000);
SELECT @sal AS Updated_Salary;

-- 10. Stored Procedure with IF condition - Classify salary
DELIMITER $$
CREATE PROCEDURE ClassifySalary(IN emp INT)
BEGIN
    DECLARE emp_sal DECIMAL(10,2);

    SELECT salary INTO emp_sal FROM EMPLOYEES WHERE emp_id = emp;

    IF emp_sal >= 60000 THEN
        SELECT 'High Salary' AS category;
    ELSEIF emp_sal >= 50000 THEN
        SELECT 'Medium Salary' AS category;
    ELSE
        SELECT 'Low Salary' AS category;
    END IF;
END $$
DELIMITER ;

CALL ClassifySalary(1);
CALL ClassifySalary(3);

-- 11. Stored Procedure with CURSOR (advanced) - Assign salary grades
DELIMITER $$
CREATE PROCEDURE ShowSalaryGrades()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_name VARCHAR(50);
    DECLARE v_salary DECIMAL(10,2);

    DECLARE emp_cursor CURSOR FOR
        SELECT emp_name, salary FROM EMPLOYEES;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    CREATE TEMPORARY TABLE IF NOT EXISTS SALARY_GRADES (
        emp_name VARCHAR(50),
        grade    VARCHAR(20)
    );

    OPEN emp_cursor;
    read_loop: LOOP
        FETCH emp_cursor INTO v_name, v_salary;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF v_salary >= 60000 THEN
            INSERT INTO SALARY_GRADES VALUES (v_name, 'A');
        ELSEIF v_salary >= 50000 THEN
            INSERT INTO SALARY_GRADES VALUES (v_name, 'B');
        ELSE
            INSERT INTO SALARY_GRADES VALUES (v_name, 'C');
        END IF;
    END LOOP;
    CLOSE emp_cursor;

    SELECT * FROM SALARY_GRADES;
    DROP TEMPORARY TABLE IF EXISTS SALARY_GRADES;
END $$
DELIMITER ;

CALL ShowSalaryGrades();

-- 12. Drop stored procedures (cleanup)
DROP PROCEDURE IF EXISTS GetAllEmployees;
DROP PROCEDURE IF EXISTS GetByDept;
DROP PROCEDURE IF EXISTS CountByDept;
DROP PROCEDURE IF EXISTS IncreaseSalary;
DROP PROCEDURE IF EXISTS ClassifySalary;
DROP PROCEDURE IF EXISTS ShowSalaryGrades;

-- =============================================================
-- END OF PRACTICE FILE
-- =============================================================
