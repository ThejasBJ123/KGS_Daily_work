-- =============================================================
--          MYSQL NUMERIC DATA TYPES
-- =============================================================
-- Topics: TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT
--         FLOAT, DOUBLE, DECIMAL, BOOLEAN
--         UNSIGNED, ZEROFILL modifiers
-- Run each block step by step in MySQL Workbench.
-- =============================================================

CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;

-- =============================================================
-- PART 1 : INTEGER TYPES
-- =============================================================
-- TINYINT    → -128 to 127         (1 byte)
-- SMALLINT   → -32768 to 32767     (2 bytes)
-- MEDIUMINT  → -8388608 to 8388607 (3 bytes)
-- INT        → -2B to 2B           (4 bytes)
-- BIGINT     → very large          (8 bytes)

DROP TABLE IF EXISTS TRIAL1;
CREATE TABLE TRIAL1(
    NUM1 TINYINT,
    NUM2 SMALLINT,
    NUM3 MEDIUMINT,
    NUM4 INT,
    NUM5 BIGINT
);

DESC TRIAL1;

INSERT INTO TRIAL1 VALUES(
    127,
    32767,
    838607,
    21,
    123456789
);

SELECT * FROM TRIAL1;

DROP TABLE IF EXISTS TRIAL1;


-- =============================================================
-- PART 2 : DECIMAL / FLOAT / DOUBLE  (Exact & Approximate)
-- =============================================================
-- DECIMAL(p, s) → exact, p = total digits, s = decimal places
--                 best for MONEY / PRICE / MARKS
-- FLOAT         → approximate, 4 bytes, ~7 decimal digits
-- DOUBLE        → approximate, 8 bytes, ~15 decimal digits

DROP TABLE IF EXISTS NUMERIC_TYPES;
CREATE TABLE NUMERIC_TYPES (
    product_price   DECIMAL(10, 2),   -- e.g.  99999999.99
    bank_balance    DECIMAL(15, 4),   -- high precision money
    temperature     FLOAT,            -- sensor readings
    pi_value        DOUBLE            -- scientific calculation
);

INSERT INTO NUMERIC_TYPES VALUES
(1299.99,  50000.7500, 36.6,   3.14159265358979),
(499.00,   12345.1234, -12.5,  2.71828182845904),
(0.99,     999999.9999, 100.0, 1.41421356237310);

SELECT * FROM NUMERIC_TYPES;

-- Difference demo: DECIMAL is exact, FLOAT can lose precision
DROP TABLE IF EXISTS PRECISION_DEMO;
CREATE TABLE PRECISION_DEMO (
    exact_val   DECIMAL(20, 10),
    approx_val  FLOAT
);
INSERT INTO PRECISION_DEMO VALUES (1234567.1234567890, 1234567.1234567890);
SELECT * FROM PRECISION_DEMO;  -- notice FLOAT truncates!


-- =============================================================
-- PART 3 : UNSIGNED  (no negatives, doubles positive range)
-- =============================================================
-- TINYINT UNSIGNED  → 0 to 255  (normal: -128 to 127)
-- INT UNSIGNED      → 0 to ~4.2 billion
-- BIGINT UNSIGNED   → 0 to ~18.4 quintillion

DROP TABLE IF EXISTS UNSIGNED_DEMO;
CREATE TABLE UNSIGNED_DEMO (
    age       TINYINT UNSIGNED,   -- 0 to 255
    views     INT UNSIGNED,       -- 0 to ~4.2 billion
    file_size BIGINT UNSIGNED
);

INSERT INTO UNSIGNED_DEMO VALUES (25, 1000000, 9876543210);
SELECT * FROM UNSIGNED_DEMO;


-- =============================================================
-- PART 4 : ZEROFILL  (pad numbers with leading zeros)
-- =============================================================
-- ZEROFILL pads the number with zeros up to display width.
-- Automatically makes the column UNSIGNED.

DROP TABLE IF EXISTS ZEROFILL_DEMO;
CREATE TABLE ZEROFILL_DEMO (
    roll_no   INT(5) ZEROFILL,    -- displays as 00001
    pin_code  INT(6) ZEROFILL     -- displays as 400001
);

INSERT INTO ZEROFILL_DEMO VALUES (1, 400001);
INSERT INTO ZEROFILL_DEMO VALUES (42, 11001);
INSERT INTO ZEROFILL_DEMO VALUES (999, 560001);

SELECT * FROM ZEROFILL_DEMO;


-- =============================================================
-- PART 5 : BOOLEAN  (alias of TINYINT(1))
-- =============================================================
-- TRUE  = 1,  FALSE = 0
-- Any non-zero value is treated as TRUE

DROP TABLE IF EXISTS TRIAL9;
CREATE TABLE TRIAL9 (
    isAgree BOOLEAN
);

INSERT INTO TRIAL9 VALUES (TRUE);
INSERT INTO TRIAL9 VALUES (FALSE);
INSERT INTO TRIAL9 VALUES (10);
INSERT INTO TRIAL9 VALUES (1);
INSERT INTO TRIAL9 VALUES (0);
INSERT INTO TRIAL9 VALUES (-5);
INSERT INTO TRIAL9 VALUES (127);
INSERT INTO TRIAL9 VALUES (NULL);
INSERT INTO TRIAL9 VALUES (10 + 10);

SELECT * FROM TRIAL9;


-- =============================================================
-- QUICK SUMMARY - NUMERIC TYPES
-- =============================================================
-- TINYINT    → -128 to 127         (1 byte)
-- SMALLINT   → -32768 to 32767     (2 bytes)
-- MEDIUMINT  → -8388608 to 8388607 (3 bytes)
-- INT        → -2B to 2B           (4 bytes)
-- BIGINT     → very large          (8 bytes)
-- FLOAT      → approx 7 digits     (4 bytes)
-- DOUBLE     → approx 15 digits    (8 bytes)
-- DECIMAL(p,s) → exact precision   (varies)
-- BOOLEAN    → 0 or 1 (alias of TINYINT)
-- UNSIGNED   → no negatives, doubles max positive value
-- ZEROFILL   → pads with leading zeros

-- =============================================================
-- END OF FILE
-- =============================================================
