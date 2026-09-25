-- ============================================================
-- SQL DATATYPES – Complete Reference
-- ============================================================
-- A datatype defines the type and size of data that a column
-- can hold. MySQL supports 5 major categories of datatypes.
--
-- Categories:
--   1. Numeric   (INT, TINYINT, BIGINT, DECIMAL, FLOAT ...)
--   2. String    (CHAR, VARCHAR, TEXT, ENUM, SET ...)
--   3. Date/Time (DATE, TIME, DATETIME, TIMESTAMP, YEAR)
--   4. Boolean   (BOOLEAN / TINYINT(1))
--   5. Binary    (BLOB, BINARY, VARBINARY ...)
-- ============================================================


CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;


-- ============================================================
-- CATEGORY 1: NUMERIC DATATYPES
-- ============================================================
-- Type        | Storage | Signed Range             | Unsigned Range
-- ------------|---------|--------------------------|----------------
-- TINYINT     | 1 byte  | -128 to 127              | 0 to 255
-- SMALLINT    | 2 bytes | -32768 to 32767          | 0 to 65535
-- MEDIUMINT   | 3 bytes | -8388608 to 8388607      | 0 to 16777215
-- INT         | 4 bytes | -2147483648 to 2147483647| 0 to 4294967295
-- BIGINT      | 8 bytes | Very large range         |
-- FLOAT       | 4 bytes | Approximate decimal      |
-- DOUBLE      | 8 bytes | More precision than FLOAT|
-- DECIMAL(p,s)| Variable| Exact decimal values     |

DROP TABLE IF EXISTS NUMERIC_DEMO;
CREATE TABLE NUMERIC_DEMO (
    COL_TINYINT    TINYINT,       -- -128 to 127
    COL_SMALLINT   SMALLINT,      -- -32768 to 32767
    COL_MEDIUMINT  MEDIUMINT,     -- -8388608 to 8388607
    COL_INT        INT,           -- general integer
    COL_BIGINT     BIGINT,        -- very large numbers
    COL_FLOAT      FLOAT(7,2),    -- approx decimal
    COL_DOUBLE     DOUBLE(15,5),  -- more precise decimal
    COL_DECIMAL    DECIMAL(10,2)  -- exact decimal (money)
);

INSERT INTO NUMERIC_DEMO VALUES (
    127,
    32767,
    8388607,
    2147483647,
    9223372036854775807,
    99999.99,
    9999999999.99999,
    12345678.99
);

SELECT * FROM NUMERIC_DEMO;


-- ============================================================
-- CATEGORY 2: STRING / CHARACTER DATATYPES
-- ============================================================
-- Type       | Max Size    | Notes
-- -----------|-------------|----------------------------------
-- CHAR(n)    | 255 chars   | Fixed length, padded with spaces
-- VARCHAR(n) | 65535 chars | Variable length (stores actual size)
-- TEXT       | 65535 chars | Long text, no default value
-- TINYTEXT   | 255 chars   | Very short text
-- MEDIUMTEXT | 16MB        | Medium length text
-- LONGTEXT   | 4GB         | Very long text
-- ENUM       | 65535 values| Stores ONE value from a list
-- SET        | 64 members  | Stores MULTIPLE values from a list

-- CHAR vs VARCHAR
DROP TABLE IF EXISTS STRING_DEMO;
CREATE TABLE STRING_DEMO (
    FIXED_NAME   CHAR(10)      DEFAULT 'UNKNOWN',   -- always 10 chars
    FLEX_NAME    VARCHAR(50),                         -- up to 50 chars
    BIO          TEXT,                                -- long text
    GENDER       ENUM('Male','Female','Other'),        -- one of these
    FAV_COLORS   SET('Red','Green','Blue','Yellow')   -- multiple from list
);

INSERT INTO STRING_DEMO VALUES ('Alice',  'Alice Wonderland', 'Loves coding.', 'Female', 'Red,Blue');
INSERT INTO STRING_DEMO VALUES ('Bob',    'Bob Builder',      'Builds stuff.', 'Male',   'Green');
INSERT INTO STRING_DEMO VALUES (DEFAULT,  'Anon',             NULL,            'Other',  'Red,Green,Blue');

SELECT * FROM STRING_DEMO;


-- ============================================================
-- CATEGORY 3: DATE & TIME DATATYPES
-- ============================================================
-- Type       | Format                  | Range
-- -----------|-------------------------|----------------------------
-- DATE       | YYYY-MM-DD              | 1000-01-01 to 9999-12-31
-- TIME       | HH:MM:SS                | -838:59:59 to 838:59:59
-- DATETIME   | YYYY-MM-DD HH:MM:SS     | 1000-01-01 to 9999-12-31
-- TIMESTAMP  | YYYY-MM-DD HH:MM:SS     | 1970-01-01 to 2038-01-19
-- YEAR       | YYYY                    | 1901 to 2155

DROP TABLE IF EXISTS DATETIME_DEMO;
CREATE TABLE DATETIME_DEMO (
    EV_DATE      DATE,
    EV_TIME      TIME,
    EV_DATETIME  DATETIME,
    EV_TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    EV_YEAR      YEAR
);

INSERT INTO DATETIME_DEMO (EV_DATE, EV_TIME, EV_DATETIME, EV_YEAR)
VALUES ('2026-10-20', '10:25:02', '2026-10-20 10:25:02', 2026);

INSERT INTO DATETIME_DEMO (EV_DATE, EV_TIME, EV_DATETIME, EV_YEAR)
VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW(), YEAR(NOW()));

-- STR_TO_DATE: convert custom string to DATE
INSERT INTO DATETIME_DEMO (EV_DATE)
VALUES (STR_TO_DATE('25-12-2026', '%d-%m-%Y'));

-- DATE_FORMAT: display date in custom format
SELECT DATE_FORMAT(EV_DATE, '%d - %M - %Y') AS Formatted_Date
FROM DATETIME_DEMO;

SELECT * FROM DATETIME_DEMO;


-- ============================================================
-- CATEGORY 4: BOOLEAN DATATYPE
-- ============================================================
-- MySQL does NOT have a true BOOLEAN type.
-- BOOLEAN is an alias for TINYINT(1).
-- TRUE = 1, FALSE = 0. Any non-zero = TRUE.

DROP TABLE IF EXISTS BOOL_DEMO;
CREATE TABLE BOOL_DEMO (
    IS_ACTIVE BOOLEAN
);

INSERT INTO BOOL_DEMO VALUES (TRUE);
INSERT INTO BOOL_DEMO VALUES (FALSE);
INSERT INTO BOOL_DEMO VALUES (1);       -- same as TRUE
INSERT INTO BOOL_DEMO VALUES (0);       -- same as FALSE
INSERT INTO BOOL_DEMO VALUES (-5);      -- non-zero = TRUE
INSERT INTO BOOL_DEMO VALUES (NULL);    -- NULL means unknown

SELECT * FROM BOOL_DEMO;


-- ============================================================
-- CATEGORY 5: BINARY / BLOB DATATYPES
-- ============================================================
-- Type       | Max Size | Notes
-- -----------|----------|--------------------------------------
-- BINARY(n)  | 255 bytes| Fixed-length binary
-- VARBINARY  | 65535    | Variable-length binary
-- TINYBLOB   | 255 bytes| Small binary object
-- BLOB       | 65535 KB | Binary Large Object (images, files)
-- MEDIUMBLOB | 16 MB    | Medium binary object
-- LONGBLOB   | 4 GB     | Large binary object

DROP TABLE IF EXISTS BLOB_DEMO;
CREATE TABLE BLOB_DEMO (
    FILE_NAME  VARCHAR(100),
    FILE_DATA  BLOB
);

-- Store a file path (actual binary content loaded via application)
INSERT INTO BLOB_DEMO (FILE_NAME) VALUES ('profile_picture.jpg');

SELECT FILE_NAME FROM BLOB_DEMO;
