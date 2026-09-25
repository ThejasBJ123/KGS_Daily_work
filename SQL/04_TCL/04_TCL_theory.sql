-- ============================================================
-- TCL - TRANSACTION CONTROL LANGUAGE
-- ============================================================
-- TCL commands are used to manage transactions in a database.
-- A transaction is a collection of SQL statements that are
-- treated as a single unit – all succeed or all fail.
--
-- Commands: COMMIT, ROLLBACK, SAVEPOINT
-- ============================================================


CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;

DROP TABLE IF EXISTS BANK_ACCOUNTS;
CREATE TABLE BANK_ACCOUNTS (
    ACC_ID  INT,
    NAME    VARCHAR(50),
    BALANCE DECIMAL(10,2)
);

INSERT INTO BANK_ACCOUNTS VALUES
    (101, 'Rahul', 10000.00),
    (102, 'Priya',  5000.00);

SELECT * FROM BANK_ACCOUNTS;


-- ------------------------------------------------------------
-- 1. COMMIT – Save all changes permanently
-- ------------------------------------------------------------
-- By default MySQL runs in auto-commit mode.
-- To use manual transactions, disable auto-commit.

SET autocommit = 0;          -- disable auto-commit

-- Make a transfer: Debit Rahul, Credit Priya
UPDATE BANK_ACCOUNTS SET BALANCE = BALANCE - 2000 WHERE ACC_ID = 101;
UPDATE BANK_ACCOUNTS SET BALANCE = BALANCE + 2000 WHERE ACC_ID = 102;

SELECT * FROM BANK_ACCOUNTS;   -- balances updated (not yet saved)

COMMIT;                        -- save permanently

SELECT * FROM BANK_ACCOUNTS;   -- changes are now permanent


-- ------------------------------------------------------------
-- 2. ROLLBACK – Undo changes since last COMMIT / SAVEPOINT
-- ------------------------------------------------------------
SET autocommit = 0;

-- Make a wrong transfer
UPDATE BANK_ACCOUNTS SET BALANCE = BALANCE - 9999 WHERE ACC_ID = 101;
SELECT * FROM BANK_ACCOUNTS;   -- wrong deduction visible

ROLLBACK;                      -- undo changes

SELECT * FROM BANK_ACCOUNTS;   -- restored to previous COMMIT state


-- ------------------------------------------------------------
-- 3. SAVEPOINT – Partial rollback to a specific point
-- ------------------------------------------------------------
SET autocommit = 0;

UPDATE BANK_ACCOUNTS SET BALANCE = BALANCE + 500 WHERE ACC_ID = 101;

SAVEPOINT sp1;                 -- mark a savepoint

UPDATE BANK_ACCOUNTS SET BALANCE = BALANCE - 9999 WHERE ACC_ID = 102;

SELECT * FROM BANK_ACCOUNTS;   -- both changes visible

ROLLBACK TO SAVEPOINT sp1;    -- undo only changes AFTER sp1

SELECT * FROM BANK_ACCOUNTS;   -- only +500 to Rahul remains

COMMIT;                        -- commit the +500 change

RELEASE SAVEPOINT sp1;         -- optional: release savepoint (cleanup)

-- Re-enable auto-commit
SET autocommit = 1;
