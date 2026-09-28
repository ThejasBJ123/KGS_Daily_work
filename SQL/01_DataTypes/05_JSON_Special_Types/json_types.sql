-- =============================================================
--          MYSQL JSON & SPECIAL DATA TYPES
-- =============================================================
-- Topics: JSON type, JSON functions (JSON_EXTRACT, JSON_SET,
--         JSON_UNQUOTE, arrow operator ->>)
-- Run each block step by step in MySQL Workbench.
-- =============================================================

CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;

-- =============================================================
-- PART 1 : JSON TYPE  (structured data in a column)
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


-- =============================================================
-- PART 2 : EXTRACTING VALUES FROM JSON
-- =============================================================

-- Method 1: JSON_EXTRACT() + JSON_UNQUOTE()
SELECT
    name,
    JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.age'))       AS age,
    JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.city'))      AS city,
    JSON_UNQUOTE(JSON_EXTRACT(metadata, '$.skills[0]')) AS primary_skill
FROM JSON_DEMO;

-- Method 2: Arrow operator ->>(shorthand, MySQL 5.7.9+)
SELECT
    name,
    metadata->>'$.age'    AS age,
    metadata->>'$.city'   AS city,
    metadata->>'$.skills[0]' AS primary_skill
FROM JSON_DEMO;


-- =============================================================
-- PART 3 : UPDATING JSON DATA
-- =============================================================

-- JSON_SET() → update a specific field inside JSON
UPDATE JSON_DEMO
SET metadata = JSON_SET(metadata, '$.age', 26)
WHERE name = 'Rahul';

SELECT name, metadata->>'$.age' AS updated_age FROM JSON_DEMO WHERE name = 'Rahul';

-- JSON_INSERT() → add a new key (won't overwrite existing)
UPDATE JSON_DEMO
SET metadata = JSON_INSERT(metadata, '$.country', 'India')
WHERE name = 'Priya';

-- JSON_REMOVE() → remove a key
UPDATE JSON_DEMO
SET metadata = JSON_REMOVE(metadata, '$.country')
WHERE name = 'Priya';

SELECT * FROM JSON_DEMO;


-- =============================================================
-- PART 4 : SEARCHING INSIDE JSON
-- =============================================================

-- Find employees from Mumbai (using JSON path)
SELECT name FROM JSON_DEMO
WHERE metadata->>'$.city' = 'Mumbai';

-- Find employees who know SQL (search inside array)
SELECT name FROM JSON_DEMO
WHERE JSON_SEARCH(metadata, 'one', 'SQL', NULL, '$.skills') IS NOT NULL;


-- =============================================================
-- QUICK SUMMARY - JSON TYPE
-- =============================================================
-- JSON               → structured key-value / array data
--                      Validated on insert (MySQL 5.7+)

-- Useful functions:
-- JSON_EXTRACT(col, '$.key')       → get value at path
-- JSON_UNQUOTE(...)                → remove surrounding quotes
-- col->>'$.key'                    → shorthand for EXTRACT+UNQUOTE
-- JSON_SET(col, '$.key', value)    → update/add a field
-- JSON_INSERT(col, '$.key', value) → add field (no overwrite)
-- JSON_REMOVE(col, '$.key')        → delete a field
-- JSON_SEARCH(col, 'one'/'all', value) → find value in JSON

-- =============================================================
-- END OF FILE
-- =============================================================
