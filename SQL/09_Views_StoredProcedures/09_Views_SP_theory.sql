-- =============================================================
--      VIEWS & STORED PROCEDURES - THEORY NOTES
-- =============================================================
-- Topic  : Views and Stored Procedures in MySQL
-- Author : KGS Daily Work
-- =============================================================


-- ┌─────────────────────────────────────────────────────────┐
-- │                   PART A : VIEWS                        │
-- └─────────────────────────────────────────────────────────┘

-- WHAT IS A VIEW?
-- ---------------
-- A VIEW is a virtual table based on a SELECT query.
-- It does NOT store data itself — it fetches data from the
-- underlying real table(s) every time it is used.
-- Think of it as a "saved SELECT statement" with a name.

-- WHY USE VIEWS?
-- --------------
-- 1. Simplicity   : Hide complex queries behind a simple name.
-- 2. Security     : Show only specific columns/rows to users.
-- 3. Reusability  : Write query once, use it many times.
-- 4. Abstraction  : Users don't need to know table structure.

-- SYNTAX
-- ------
-- CREATE [OR REPLACE] VIEW view_name AS
--     SELECT column1, column2, ...
--     FROM table_name
--     [WHERE condition];

-- TYPES OF VIEWS
-- --------------
-- 1. Simple View
--    • Based on a single table.
--    • No GROUP BY, DISTINCT, aggregate functions.
--    • Can be used to INSERT / UPDATE / DELETE (updatable).

-- 2. Complex View
--    • Based on multiple tables (JOINs) or uses aggregates.
--    • Generally NOT updatable (read-only).

-- IMPORTANT RULES
-- ---------------
-- • OR REPLACE  → updates the view if it already exists.
-- • DROP VIEW   → removes the view (original table is safe).
-- • Updating via a view changes the ACTUAL table data.
-- • Views with GROUP BY, DISTINCT, aggregate functions,
--   subqueries, or JOINs are NOT directly updatable.

-- QUICK REFERENCE
-- ---------------
-- Create view   : CREATE OR REPLACE VIEW vw_name AS SELECT ...;
-- Use view      : SELECT * FROM vw_name;
-- Drop view     : DROP VIEW IF EXISTS vw_name;
-- Show views    : SHOW FULL TABLES WHERE Table_type = 'VIEW';


-- ┌─────────────────────────────────────────────────────────┐
-- │             PART B : STORED PROCEDURES                  │
-- └─────────────────────────────────────────────────────────┘

-- WHAT IS A STORED PROCEDURE?
-- ---------------------------
-- A Stored Procedure is a set of SQL statements saved in the
-- database with a name. You can CALL it whenever needed.
-- It is like a function but lives inside the database.

-- WHY USE STORED PROCEDURES?
-- --------------------------
-- 1. Reusability   : Write once, call many times.
-- 2. Performance   : Pre-compiled, runs faster.
-- 3. Security      : Grant EXECUTE permission only (hide SQL).
-- 4. Less traffic  : Send one CALL instead of many queries.
-- 5. Modularity    : Break big logic into small procedures.

-- SYNTAX
-- ------
-- DELIMITER $$
-- CREATE PROCEDURE procedure_name(parameters)
-- BEGIN
--     -- SQL statements here
-- END $$
-- DELIMITER ;

-- NOTE: DELIMITER is changed so MySQL doesn't treat the
--       semicolons INSIDE the procedure as the end of statement.

-- PARAMETER TYPES
-- ---------------
-- IN    → caller passes a value IN  (default, read-only inside)
-- OUT   → procedure sends a value OUT to the caller
-- INOUT → caller passes a value IN, procedure can modify and
--         send it back OUT

-- EXAMPLE PARAMETER SYNTAX
-- ------------------------
-- CREATE PROCEDURE myProc(IN  p1 INT,
--                         OUT p2 VARCHAR(20),
--                         INOUT p3 DECIMAL(10,2))

-- CONTROL FLOW INSIDE PROCEDURES
-- --------------------------------
-- IF / ELSEIF / ELSE … END IF
-- CASE … END CASE
-- LOOP … END LOOP  (use LEAVE to break out)
-- WHILE … END WHILE
-- REPEAT … UNTIL … END REPEAT

-- CURSORS (for row-by-row processing)
-- ------------------------------------
-- DECLARE cursor_name CURSOR FOR SELECT ...;
-- OPEN cursor_name;
-- FETCH cursor_name INTO var1, var2;
-- CLOSE cursor_name;
-- (Use a CONTINUE HANDLER FOR NOT FOUND to detect end of rows)

-- QUICK REFERENCE
-- ---------------
-- Create   : CREATE PROCEDURE name(params) BEGIN ... END
-- Call     : CALL procedure_name(args);
-- Drop     : DROP PROCEDURE IF EXISTS procedure_name;
-- List all : SHOW PROCEDURE STATUS WHERE Db = 'your_db';
-- View def : SHOW CREATE PROCEDURE procedure_name;

-- VARIABLES IN PROCEDURES
-- -----------------------
-- Local variable    : DECLARE var_name datatype [DEFAULT value];
-- Set value         : SET var_name = expression;
-- Store query result: SELECT col INTO var_name FROM table ...;
-- Session variable  : @variable_name  (no DECLARE needed)

-- VIEWS vs STORED PROCEDURES
-- --------------------------
-- ┌───────────────────┬──────────────────┬───────────────────┐
-- │ Feature           │ VIEW             │ STORED PROCEDURE  │
-- ├───────────────────┼──────────────────┼───────────────────┤
-- │ What it stores    │ SELECT query     │ SQL logic/block   │
-- │ Called with       │ SELECT * FROM    │ CALL proc()       │
-- │ Takes parameters  │ No               │ Yes (IN/OUT/INOUT)│
-- │ Can have logic    │ No               │ Yes (IF/LOOP etc) │
-- │ Returns           │ Virtual table    │ Result set/value  │
-- │ Can update data   │ Simple views yes │ Yes               │
-- └───────────────────┴──────────────────┴───────────────────┘

-- =============================================================
-- END OF THEORY FILE
-- =============================================================
