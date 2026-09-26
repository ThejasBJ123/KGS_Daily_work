-- =============================================================
--       MYSQL DATA TYPES - MISSING TYPES PRACTICE
-- =============================================================
-- This file covers the data types NOT in datatypes.sql
-- Run each block step by step in MySQL Workbench.
-- =============================================================

CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;

-- =============================================================
-- PART 1 : DECIMAL / FLOAT / DOUBLE  (Exact & Approximate)
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

-- UNSIGNED modifier (no negatives, doubles positive range)
DROP TABLE IF EXISTS UNSIGNED_DEMO;
CREATE TABLE UNSIGNED_DEMO (
    age       TINYINT UNSIGNED,   -- 0 to 255  (normal: -128 to 127)
    views     INT UNSIGNED,       -- 0 to ~4.2 billion
    file_size BIGINT UNSIGNED
);
INSERT INTO UNSIGNED_DEMO VALUES (25, 1000000, 9876543210);
SELECT * FROM UNSIGNED_DEMO;


-- =============================================================
-- PART 2 : TEXT TYPES  (for large strings)
-- =============================================================
-- Use TEXT when content is too large for VARCHAR(65535)
-- TINYTEXT   → max 255 bytes
-- TEXT       → max 65,535 bytes     (~64 KB)
-- MEDIUMTEXT → max 16,777,215 bytes (~16 MB)  e.g. blog posts
-- LONGTEXT   → max 4,294,967,295 bytes (~4 GB) e.g. books/logs

DROP TABLE IF EXISTS TEXT_TYPES;
CREATE TABLE TEXT_TYPES (
    short_note   TINYTEXT,
    description  TEXT,
    article_body MEDIUMTEXT,
    book_content LONGTEXT
);

INSERT INTO TEXT_TYPES VALUES (
    'Short note here.',
    'This is a regular TEXT field, good for descriptions, comments or paragraphs up to 64KB.',
    'MEDIUMTEXT is used for large content like blog posts, articles, HTML pages etc.',
    'LONGTEXT can hold entire books or huge log files — up to 4 gigabytes of text data.'
);

SELECT short_note, LEFT(description, 50) AS description_preview FROM TEXT_TYPES;


-- =============================================================
-- PART 3 : BINARY / VARBINARY  (binary strings)
-- =============================================================
-- Similar to CHAR/VARCHAR but stores raw binary bytes.
-- Useful for: hash values, encrypted data, binary protocols.

DROP TABLE IF EXISTS BINARY_TYPES;
CREATE TABLE BINARY_TYPES (
    fixed_hash   BINARY(16),      -- fixed 16 bytes (e.g. MD5 hash)
    flex_data    VARBINARY(255)   -- variable binary
);

INSERT INTO BINARY_TYPES VALUES
(UNHEX('d41d8cd98f00b204e9800998ecf8427e'), 0x48656C6C6F),  -- 'Hello' in hex
(UNHEX('098f6bcd4621d373cade4e832627b4f6'), 0x576F726C64);  -- 'World' in hex

-- Read back as text
SELECT HEX(fixed_hash) AS md5_hash, CONVERT(flex_data USING utf8) AS text_value
FROM BINARY_TYPES;


-- =============================================================
-- PART 4 : BLOB TYPES  (binary large objects - for files)
-- =============================================================
-- TINYBLOB   → max 255 bytes
-- BLOB       → max 65,535 bytes   (~64 KB)
-- MEDIUMBLOB → max 16 MB          (images, PDFs)
-- LONGBLOB   → max 4 GB           (videos, large files)

DROP TABLE IF EXISTS BLOB_TYPES;
CREATE TABLE BLOB_TYPES (
    thumbnail  TINYBLOB,
    icon       BLOB,
    image      MEDIUMBLOB,
    video_clip LONGBLOB
);

-- Inserting sample binary data (normally you'd load a real file)
INSERT INTO BLOB_TYPES (thumbnail) VALUES (0xFFD8FFE0);  -- JPEG header bytes
SELECT LENGTH(thumbnail) AS thumbnail_bytes FROM BLOB_TYPES;


-- =============================================================
-- PART 5 : JSON TYPE  (structured data in a column)
-- =============================================================
-- MySQL 5.7+ supports native JSON columns.
-- Validates JSON on insert, allows path-based queries.

DROP TABLE IF EXISTS JSON_DEMO;
CREATE TABLE JSON_DEMO (
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(50),
    metadata JSON
);

INSERT INTO JSON_DEMO (name, metadata) VALUES
('Rahul',    '{"age": 25, "skills": ["SQL", "Python"], "city": "Mumbai"}'),
('Priya',    '{"age": 22, "skills": ["Java", "HTML"],  "city": "Delhi"}'),
('Abhishek', '{"age": 30, "skills": ["SQL", "Excel"],  "city": "Pune"}');

SELECT * FROM JSON_DEMO;

-- Extracting specific values from JSON
SELECT
    name,
    JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.age'))    AS age,
    JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.city'))   AS city,
    JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.skills[0]')) AS primary_skill
FROM JSON_DEMO;

-- Shorter arrow syntax (MySQL 5.7.9+)
SELECT
    name,
    metadata->>'$.age'       AS age,
    metadata->>'$.city'      AS city
FROM JSON_DEMO;

-- Update a JSON field
UPDATE JSON_DEMO
SET metadata = JSON_SET(metadata, '$.age', 26)
WHERE name = 'Rahul';

SELECT name, metadata->>'$.age' AS updated_age FROM JSON_DEMO WHERE name = 'Rahul';


-- =============================================================
-- PART 6 : ZEROFILL  (pad numbers with leading zeros)
-- =============================================================
-- ZEROFILL pads the number with zeros up to display width.
-- Automatically makes column UNSIGNED.

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
-- PART 7 : QUICK SUMMARY - ALL MYSQL DATA TYPES
-- =============================================================

-- NUMERIC TYPES
-- ─────────────────────────────────────────────────────────────
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

-- STRING TYPES
-- ─────────────────────────────────────────────────────────────
-- CHAR(n)       → fixed length,  max 255 chars
-- VARCHAR(n)    → variable length, max 65535 chars
-- TINYTEXT      → max 255 bytes
-- TEXT          → max 65 KB
-- MEDIUMTEXT    → max 16 MB
-- LONGTEXT      → max 4 GB
-- ENUM(a,b,...) → one value from a fixed list
-- SET(a,b,...)  → zero or more values from a list

-- BINARY / BLOB TYPES
-- ─────────────────────────────────────────────────────────────
-- BINARY(n)     → fixed binary,   max 255 bytes
-- VARBINARY(n)  → variable binary, max 65535 bytes
-- TINYBLOB      → max 255 bytes
-- BLOB          → max 65 KB
-- MEDIUMBLOB    → max 16 MB  (images, PDFs)
-- LONGBLOB      → max 4 GB   (videos, large files)

-- DATE & TIME TYPES
-- ─────────────────────────────────────────────────────────────
-- DATE          → YYYY-MM-DD
-- TIME          → HH:MM:SS
-- DATETIME      → YYYY-MM-DD HH:MM:SS  (no timezone)
-- TIMESTAMP     → YYYY-MM-DD HH:MM:SS  (UTC, auto-updates)
-- YEAR          → YYYY

-- SPECIAL TYPES
-- ─────────────────────────────────────────────────────────────
-- JSON          → structured key-value / array data

-- =============================================================
-- END OF FILE
-- =============================================================
