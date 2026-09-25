-- ============================================================
-- DCL - DATA CONTROL LANGUAGE
-- ============================================================
-- DCL commands are used to control user privileges and access
-- rights to the database objects.
--
-- Commands: GRANT, REVOKE
-- ============================================================


-- ⚠️  Run these commands as the ROOT / ADMIN user in MySQL.


-- ------------------------------------------------------------
-- 1. CREATE A USER (prerequisite)
-- ------------------------------------------------------------
-- Create a new MySQL user
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'StrongPass@123';


-- ------------------------------------------------------------
-- 2. GRANT – Give privileges to a user
-- ------------------------------------------------------------
-- Syntax:
--   GRANT privilege_list ON database.table TO 'user'@'host';

-- Grant SELECT only on a specific table
GRANT SELECT ON PRACTICE.EMPLOYEES TO 'student_user'@'localhost';

-- Grant multiple privileges on all tables in a database
GRANT SELECT, INSERT, UPDATE ON PRACTICE.* TO 'student_user'@'localhost';

-- Grant ALL privileges on everything (superuser – use with caution)
-- GRANT ALL PRIVILEGES ON *.* TO 'student_user'@'localhost';

-- Apply the privilege changes immediately
FLUSH PRIVILEGES;


-- ------------------------------------------------------------
-- 3. SHOW GRANTS – View current privileges
-- ------------------------------------------------------------
SHOW GRANTS FOR 'student_user'@'localhost';


-- ------------------------------------------------------------
-- 4. REVOKE – Remove privileges from a user
-- ------------------------------------------------------------
-- Syntax:
--   REVOKE privilege_list ON database.table FROM 'user'@'host';

-- Revoke INSERT and UPDATE, keep SELECT
REVOKE INSERT, UPDATE ON PRACTICE.* FROM 'student_user'@'localhost';

-- Revoke all privileges
REVOKE ALL PRIVILEGES ON PRACTICE.* FROM 'student_user'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'student_user'@'localhost';


-- ------------------------------------------------------------
-- 5. DROP USER – Remove a user
-- ------------------------------------------------------------
DROP USER IF EXISTS 'student_user'@'localhost';
