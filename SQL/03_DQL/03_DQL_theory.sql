-- ============================================================
-- DQL - DATA QUERY LANGUAGE
-- ============================================================
-- DQL is used to fetch / query data from one or more tables.
--
-- Command: SELECT
-- Clauses : WHERE, ORDER BY, GROUP BY, HAVING, LIMIT, DISTINCT
-- ============================================================


CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;

DROP TABLE IF EXISTS PRODUCTS;
CREATE TABLE PRODUCTS (
    PID      INT,
    PNAME    VARCHAR(50),
    CATEGORY VARCHAR(30),
    PRICE    DECIMAL(10,2),
    STOCK    INT
);

INSERT INTO PRODUCTS VALUES
    (1, 'Laptop',    'Electronics', 55000.00, 20),
    (2, 'Phone',     'Electronics', 15000.00, 50),
    (3, 'Desk',      'Furniture',   8000.00,  10),
    (4, 'Chair',     'Furniture',   3500.00,  25),
    (5, 'Tablet',    'Electronics', 25000.00, 15),
    (6, 'Bookshelf', 'Furniture',   4500.00,   8),
    (7, 'Headphones','Electronics', 2000.00,  40),
    (8, 'Lamp',      'Furniture',   1200.00,  30);


-- ------------------------------------------------------------
-- 1. SELECT – Retrieve all or specific columns
-- ------------------------------------------------------------
-- Retrieve all columns
SELECT * FROM PRODUCTS;

-- Retrieve specific columns
SELECT PNAME, PRICE FROM PRODUCTS;

-- Column aliases
SELECT PNAME AS 'Product Name', PRICE AS 'Cost' FROM PRODUCTS;


-- ------------------------------------------------------------
-- 2. DISTINCT – Remove duplicates
-- ------------------------------------------------------------
SELECT DISTINCT CATEGORY FROM PRODUCTS;


-- ------------------------------------------------------------
-- 3. WHERE – Filter rows based on a condition
-- ------------------------------------------------------------
SELECT * FROM PRODUCTS WHERE PRICE > 10000;
SELECT * FROM PRODUCTS WHERE CATEGORY = 'Furniture';
SELECT * FROM PRODUCTS WHERE PRICE BETWEEN 3000 AND 20000;
SELECT * FROM PRODUCTS WHERE PNAME LIKE 'L%';          -- starts with L
SELECT * FROM PRODUCTS WHERE PNAME LIKE '%e%';         -- contains 'e'
SELECT * FROM PRODUCTS WHERE CATEGORY IN ('Electronics', 'Furniture');
SELECT * FROM PRODUCTS WHERE STOCK IS NOT NULL;


-- ------------------------------------------------------------
-- 4. ORDER BY – Sort results
-- ------------------------------------------------------------
SELECT * FROM PRODUCTS ORDER BY PRICE ASC;              -- Low to High
SELECT * FROM PRODUCTS ORDER BY PRICE DESC;             -- High to Low
SELECT * FROM PRODUCTS ORDER BY CATEGORY ASC, PRICE DESC;


-- ------------------------------------------------------------
-- 5. LIMIT – Restrict number of rows returned
-- ------------------------------------------------------------
SELECT * FROM PRODUCTS LIMIT 3;                         -- first 3 rows
SELECT * FROM PRODUCTS LIMIT 2, 3;                      -- skip 2, take 3 (offset)


-- ------------------------------------------------------------
-- 6. Aggregate Functions
-- ------------------------------------------------------------
-- COUNT  – number of rows
-- SUM    – total of a numeric column
-- AVG    – average of a numeric column
-- MAX    – maximum value
-- MIN    – minimum value

SELECT COUNT(*)          AS Total_Products  FROM PRODUCTS;
SELECT SUM(STOCK)        AS Total_Stock     FROM PRODUCTS;
SELECT AVG(PRICE)        AS Avg_Price       FROM PRODUCTS;
SELECT MAX(PRICE)        AS Most_Expensive  FROM PRODUCTS;
SELECT MIN(PRICE)        AS Cheapest        FROM PRODUCTS;


-- ------------------------------------------------------------
-- 7. GROUP BY – Group rows by a column value
-- ------------------------------------------------------------
SELECT CATEGORY, COUNT(*) AS Item_Count, AVG(PRICE) AS Avg_Price
FROM PRODUCTS
GROUP BY CATEGORY;


-- ------------------------------------------------------------
-- 8. HAVING – Filter groups (like WHERE but for GROUP BY)
-- ------------------------------------------------------------
SELECT CATEGORY, SUM(STOCK) AS Total_Stock
FROM PRODUCTS
GROUP BY CATEGORY
HAVING Total_Stock > 30;


-- ------------------------------------------------------------
-- 9. Combining Clauses – Full SELECT example
-- ------------------------------------------------------------
SELECT CATEGORY,
       COUNT(*)       AS Items,
       ROUND(AVG(PRICE), 2) AS Avg_Price
FROM PRODUCTS
WHERE STOCK > 5
GROUP BY CATEGORY
HAVING AVG(PRICE) > 3000
ORDER BY Avg_Price DESC
LIMIT 5;
