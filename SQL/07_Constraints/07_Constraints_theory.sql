-- ============================================================
-- SQL CONSTRAINTS – Complete Reference
-- ============================================================
-- Constraints are rules applied to columns to validate and
-- control the data that can be inserted into a table.
--
-- Advantage:
--   ✔ Ensures Data Accuracy
--   ✔ Ensures Data Consistency
--   ✔ Ensures Data Integrity
--
-- 7 Types of Constraints:
--   1. NOT NULL
--   2. UNIQUE
--   3. PRIMARY KEY
--   4. FOREIGN KEY
--   5. CHECK
--   6. DEFAULT
--   7. INDEX (auto-created with PRIMARY KEY / UNIQUE)
-- ============================================================


CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;


-- ------------------------------------------------------------
-- 1. NOT NULL – Column must have a value (cannot be empty)
-- ------------------------------------------------------------
DROP TABLE IF EXISTS NOT_NULL_DEMO;
CREATE TABLE NOT_NULL_DEMO (
    ID    INT         NOT NULL,
    NAME  VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(100)           -- allows NULL
);

INSERT INTO NOT_NULL_DEMO VALUES (1, 'Rahul', 'rahul@email.com');
INSERT INTO NOT_NULL_DEMO VALUES (2, 'Priya', NULL);           -- OK (email allows null)
-- INSERT INTO NOT_NULL_DEMO VALUES (3, NULL, 'x@x.com');      -- ❌ Error: NAME is NOT NULL

SELECT * FROM NOT_NULL_DEMO;


-- ------------------------------------------------------------
-- 2. UNIQUE – No duplicate values allowed in the column
-- ------------------------------------------------------------
DROP TABLE IF EXISTS UNIQUE_DEMO;
CREATE TABLE UNIQUE_DEMO (
    ID    INT         NOT NULL,
    EMAIL VARCHAR(100) UNIQUE     -- each email must be different
);

INSERT INTO UNIQUE_DEMO VALUES (1, 'alice@email.com');
INSERT INTO UNIQUE_DEMO VALUES (2, 'bob@email.com');
-- INSERT INTO UNIQUE_DEMO VALUES (3, 'alice@email.com');   -- ❌ Duplicate error

SELECT * FROM UNIQUE_DEMO;


-- ------------------------------------------------------------
-- 3. PRIMARY KEY – Uniquely identifies each row
--                  (NOT NULL + UNIQUE combined)
-- ------------------------------------------------------------
DROP TABLE IF EXISTS PK_DEMO;
CREATE TABLE PK_DEMO (
    STU_ID   INT         PRIMARY KEY,   -- unique + not null
    STU_NAME VARCHAR(50) NOT NULL
);

INSERT INTO PK_DEMO VALUES (101, 'Alice');
INSERT INTO PK_DEMO VALUES (102, 'Bob');
-- INSERT INTO PK_DEMO VALUES (101, 'Charlie');  -- ❌ Duplicate PK error

-- Composite Primary Key (two columns together form the PK)
DROP TABLE IF EXISTS COMPOSITE_PK;
CREATE TABLE COMPOSITE_PK (
    ORDER_ID   INT,
    PRODUCT_ID INT,
    QTY        INT,
    PRIMARY KEY (ORDER_ID, PRODUCT_ID)
);


-- ------------------------------------------------------------
-- 4. FOREIGN KEY – Links two tables (referential integrity)
-- ------------------------------------------------------------
DROP TABLE IF EXISTS ORDERS_DEMO;
DROP TABLE IF EXISTS CUSTOMERS_DEMO;

CREATE TABLE CUSTOMERS_DEMO (
    CUST_ID   INT         PRIMARY KEY,
    CUST_NAME VARCHAR(50) NOT NULL
);

CREATE TABLE ORDERS_DEMO (
    ORDER_ID  INT         PRIMARY KEY,
    CUST_ID   INT,
    AMOUNT    DECIMAL(10,2),
    FOREIGN KEY (CUST_ID) REFERENCES CUSTOMERS_DEMO(CUST_ID)
    ON DELETE CASCADE       -- delete orders if customer is deleted
    ON UPDATE CASCADE       -- update order's cust_id if customer id changes
);

INSERT INTO CUSTOMERS_DEMO VALUES (1, 'Rahul');
INSERT INTO CUSTOMERS_DEMO VALUES (2, 'Priya');

INSERT INTO ORDERS_DEMO VALUES (1001, 1, 5000.00);
INSERT INTO ORDERS_DEMO VALUES (1002, 2, 3200.00);
-- INSERT INTO ORDERS_DEMO VALUES (1003, 99, 100.00);  -- ❌ No customer with ID=99

SELECT * FROM CUSTOMERS_DEMO;
SELECT * FROM ORDERS_DEMO;


-- ------------------------------------------------------------
-- 5. CHECK – Restricts column value based on a condition
-- ------------------------------------------------------------
DROP TABLE IF EXISTS CHECK_DEMO;
CREATE TABLE CHECK_DEMO (
    ID     INT         PRIMARY KEY,
    NAME   VARCHAR(50) NOT NULL,
    AGE    INT         CHECK (AGE >= 18 AND AGE <= 65),  -- valid age range
    SALARY DECIMAL(10,2) CHECK (SALARY > 0)              -- salary must be positive
);

INSERT INTO CHECK_DEMO VALUES (1, 'Rahul', 25, 50000);
-- INSERT INTO CHECK_DEMO VALUES (2, 'Anon',  15, 50000);   -- ❌ Age check fails

SELECT * FROM CHECK_DEMO;


-- ------------------------------------------------------------
-- 6. DEFAULT – Automatically fills a value if none is given
-- ------------------------------------------------------------
DROP TABLE IF EXISTS DEFAULT_DEMO;
CREATE TABLE DEFAULT_DEMO (
    ID         INT         PRIMARY KEY,
    NAME       VARCHAR(50),
    COUNTRY    VARCHAR(30)  DEFAULT 'India',
    CREATED_AT TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO DEFAULT_DEMO (ID, NAME) VALUES (1, 'Ravi');         -- uses default country
INSERT INTO DEFAULT_DEMO VALUES (2, 'Meera', 'USA', NOW());     -- override default

SELECT * FROM DEFAULT_DEMO;


-- ------------------------------------------------------------
-- 7. INDEX – Speeds up searching/querying on a column
-- ------------------------------------------------------------
-- Automatically created for PRIMARY KEY and UNIQUE columns.
-- You can also create a manual index.

DROP TABLE IF EXISTS INDEX_DEMO;
CREATE TABLE INDEX_DEMO (
    ID    INT         PRIMARY KEY,
    NAME  VARCHAR(50),
    EMAIL VARCHAR(100)
);

-- Create a manual index on the NAME column
CREATE INDEX idx_name ON INDEX_DEMO(NAME);

-- Drop an index
DROP INDEX idx_name ON INDEX_DEMO;

-- View all indexes on a table
SHOW INDEX FROM INDEX_DEMO;
