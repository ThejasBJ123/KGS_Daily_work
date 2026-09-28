-- =============================================================
--          MYSQL STRING / TEXT DATA TYPES
-- =============================================================
-- Topics: CHAR, VARCHAR, TINYTEXT, TEXT, MEDIUMTEXT, LONGTEXT
--         ENUM, SET
-- Run each block step by step in MySQL Workbench.
-- =============================================================

CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;

-- =============================================================
-- PART 1 : CHAR vs VARCHAR
-- =============================================================
-- CHAR(n)    → FIXED length,    max 255 chars  (pads with spaces)
-- VARCHAR(n) → VARIABLE length, max 65535 chars (no padding)

-- CHAR example
DROP TABLE IF EXISTS TRAILE2;
CREATE TABLE TRAILE2 (
    name CHAR(6) DEFAULT 'SAMPLE'
);

INSERT INTO TRAILE2 VALUES ('APPLE');
INSERT INTO TRAILE2 VALUES ('APPL');
-- INSERT INTO TRAILE2 VALUES ('APPLESAPPLE');  -- Error: too long
INSERT INTO TRAILE2 VALUES ('APPL1');
INSERT INTO TRAILE2 VALUES (DEFAULT);

SELECT * FROM TRAILE2;

-- VARCHAR example
DROP TABLE IF EXISTS TRIALE3;
CREATE TABLE TRIALE3 (
    COLM1 VARCHAR(10),
    COLM2 VARCHAR(3),
    COLM3 CHAR
);

INSERT INTO TRIALE3 VALUES ('APPLES', 'CHA', '4');
INSERT INTO TRIALE3 VALUES ('AP',     'CHN', 'A');

SELECT * FROM TRIALE3;

ALTER TABLE TRIALE3 DROP COLUMN COLM1;


-- =============================================================
-- PART 2 : ENUM and SET
-- =============================================================
-- ENUM(a,b,...) → stores ONE value from a predefined list
-- SET(a,b,...)  → stores ZERO or MORE values from a list

DROP TABLE IF EXISTS TASK3;
CREATE TABLE TASK3 (
    GENDER     ENUM('MALE', 'FEMALE', 'OTHERS') DEFAULT 'OTHERS',
    FAV_COLORS SET('GREEN', 'RED', 'YELLOW')
);

INSERT INTO TASK3 VALUES (1, 2);                -- index-based
INSERT INTO TASK3 VALUES (1, 'RED');            -- string-based
INSERT INTO TASK3 VALUES (2, (1 | 4));          -- bitmask
INSERT INTO TASK3 VALUES (DEFAULT, NULL);

SELECT * FROM TASK3;

ALTER TABLE TASK3 DROP COLUMN GENDER;


-- =============================================================
-- PART 3 : TEXT TYPES  (for large strings)
-- =============================================================
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
-- QUICK SUMMARY - STRING TYPES
-- =============================================================
-- CHAR(n)       → fixed length,  max 255 chars
-- VARCHAR(n)    → variable length, max 65535 chars
-- TINYTEXT      → max 255 bytes
-- TEXT          → max 65 KB
-- MEDIUMTEXT    → max 16 MB
-- LONGTEXT      → max 4 GB
-- ENUM(a,b,...) → one value from a fixed list
-- SET(a,b,...)  → zero or more values from a list

-- =============================================================
-- END OF FILE
-- =============================================================
