-- =============================================================
--          MYSQL DATE & TIME DATA TYPES
-- =============================================================
-- Topics: DATE, TIME, DATETIME, TIMESTAMP, YEAR
--         DATE_FORMAT, STR_TO_DATE, current_date/timestamp
-- Run each block step by step in MySQL Workbench.
-- =============================================================

CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;

-- =============================================================
-- PART 1 : BASIC DATE & TIME TYPES
-- =============================================================
-- DATE      → YYYY-MM-DD
-- TIME      → HH:MM:SS
-- DATETIME  → YYYY-MM-DD HH:MM:SS  (no timezone)
-- TIMESTAMP → YYYY-MM-DD HH:MM:SS  (UTC, auto-updates)
-- YEAR      → YYYY

DROP TABLE IF EXISTS TRIAL7;
CREATE TABLE TRIAL7 (
    EVENT_DATE      DATE,
    EVENT_TIMESTAMP TIMESTAMP,
    EVENT_TIME      TIME,
    EVENT_YEAR      YEAR
);

INSERT INTO TRIAL7 VALUES ('2026-10-20', '2026-10-20 10:25:02', '10:25:02', '2027');
INSERT INTO TRIAL7 VALUES (CURRENT_DATE(), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP(), CURRENT_DATE());

SELECT * FROM TRIAL7;


-- =============================================================
-- PART 2 : DEFAULT VALUES FOR DATE/TIME
-- =============================================================

DROP TABLE IF EXISTS TRIAL8;
CREATE TABLE TRIAL8 (
    EVENT_DATE      DATE      DEFAULT '2026-01-01',
    EVENT_TIMESTAMP TIMESTAMP DEFAULT '2026-01-01 00:00:00',
    EVENT_TIME      TIME      DEFAULT '00:00:00',
    EVENT_YEAR      YEAR      DEFAULT 2026
);

INSERT INTO TRIAL8 VALUES ();  -- all defaults
INSERT INTO TRIAL8 VALUES ('2026-10-20', '2026-10-20 10:25:02', '10:25:02', '2027');
INSERT INTO TRIAL8 VALUES (CURRENT_DATE(), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP(), CURRENT_DATE());

-- Convert string in custom format to DATE using STR_TO_DATE
INSERT INTO TRIAL8 (EVENT_DATE) VALUES (STR_TO_DATE('25-12-2026', '%d-%m-%Y'));

SELECT * FROM TRIAL8;


-- =============================================================
-- PART 3 : DATE_FORMAT  (format date output as a string)
-- =============================================================
-- DATE_FORMAT(date, format_string)
-- Common format specifiers:
--   %d  → day (01-31)
--   %m  → month number (01-12)
--   %M  → month name (January-December)
--   %b  → abbreviated month (Jan-Dec)
--   %y  → 2-digit year
--   %Y  → 4-digit year
--   %H  → hour (00-23)
--   %i  → minutes (00-59)
--   %s  → seconds (00-59)

DROP TABLE IF EXISTS TRAIAL5;
CREATE TABLE TRAIAL5 (
    Event_Date VARCHAR(30)
);

INSERT INTO TRAIAL5 VALUES (DATE_FORMAT(NOW(), '%d - %M - %y'));
INSERT INTO TRAIAL5 VALUES (DATE_FORMAT(NOW(), '%d - %m - %y'));
INSERT INTO TRAIAL5 VALUES (DATE_FORMAT(NOW(), '%d / %b / %y'));
INSERT INTO TRAIAL5 VALUES (DATE_FORMAT(NOW(), '%d / %M / %y'));
INSERT INTO TRAIAL5 VALUES (DATE_FORMAT(NOW(), '%d / %M / %y %H:%i:%s'));
INSERT INTO TRAIAL5 VALUES (DATE_FORMAT('2026-12-25', '%d - %M - %y'));

SELECT * FROM TRAIAL5;


-- =============================================================
-- QUICK SUMMARY - DATE & TIME TYPES
-- =============================================================
-- DATE          → YYYY-MM-DD
-- TIME          → HH:MM:SS
-- DATETIME      → YYYY-MM-DD HH:MM:SS  (no timezone)
-- TIMESTAMP     → YYYY-MM-DD HH:MM:SS  (UTC, auto-updates)
-- YEAR          → YYYY

-- Useful functions:
-- CURRENT_DATE()     → today's date
-- CURRENT_TIME()     → current time
-- CURRENT_TIMESTAMP() / NOW() → current date + time
-- DATE_FORMAT(date, fmt) → format date as string
-- STR_TO_DATE(str, fmt)  → parse string into DATE

-- =============================================================
-- END OF FILE
-- =============================================================
