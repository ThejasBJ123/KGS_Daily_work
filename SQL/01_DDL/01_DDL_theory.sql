-- ============================================================
-- DDL - DATA DEFINITION LANGUAGE
-- ============================================================
-- DDL commands are used to define and manage the structure
-- (schema) of database objects like databases and tables.
--
-- Commands: CREATE, DROP, ALTER, TRUNCATE, RENAME
-- ============================================================


-- ------------------------------------------------------------
-- 1. CREATE DATABASE
-- ------------------------------------------------------------
-- Syntax: CREATE DATABASE db_name;

CREATE DATABASE PRACTICE;

-- Switch/use the database
USE PRACTICE;

-- Show all databases
SHOW DATABASES;

-- Show all tables in current database
SHOW TABLES;


-- ------------------------------------------------------------
-- 2. CREATE TABLE
-- ------------------------------------------------------------
-- Syntax:
--   CREATE TABLE table_name (
--       col_name  datatype  [constraints],
--       ...
--   );

CREATE TABLE STUDENTS (
    ID    INT,
    NAME  VARCHAR(50),
    AGE   INT
);

-- View table structure
DESC STUDENTS;


-- ------------------------------------------------------------
-- 3. ALTER TABLE
-- ------------------------------------------------------------
-- Used to modify an existing table structure.

-- ADD a new column
ALTER TABLE STUDENTS
ADD CITY VARCHAR(30);

-- MODIFY column datatype / size
ALTER TABLE STUDENTS
MODIFY CITY VARCHAR(50);

-- RENAME a column
ALTER TABLE STUDENTS
RENAME COLUMN CITY TO LOCATION;

-- DROP a column
ALTER TABLE STUDENTS
DROP COLUMN LOCATION;


-- ------------------------------------------------------------
-- 4. TRUNCATE TABLE
-- ------------------------------------------------------------
-- Removes all rows but keeps the table structure.
-- Faster than DELETE (no row-by-row logging).

TRUNCATE TABLE STUDENTS;


-- ------------------------------------------------------------
-- 5. DROP TABLE / DROP DATABASE
-- ------------------------------------------------------------
-- Completely removes the table or database.

DROP TABLE IF EXISTS STUDENTS;

DROP DATABASE IF EXISTS PRACTICE;
