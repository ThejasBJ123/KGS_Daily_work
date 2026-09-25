# 📘 SQL – Complete Learning Guide

> A structured, topic-wise SQL reference using **MySQL**.  
> Each folder contains a `.sql` file with theory comments + working code examples.

---

## 📁 Folder Structure

```
SQL/
│
├── 📄 README.md                          ← You are here
│
├── 📂 01_DDL/
│   └── 01_DDL_theory.sql                 ← CREATE, DROP, ALTER, TRUNCATE
│
├── 📂 02_DML/
│   └── 02_DML_theory.sql                 ← INSERT, UPDATE, DELETE
│
├── 📂 03_DQL/
│   └── 03_DQL_theory.sql                 ← SELECT, WHERE, GROUP BY, HAVING ...
│
├── 📂 04_TCL/
│   └── 04_TCL_theory.sql                 ← COMMIT, ROLLBACK, SAVEPOINT
│
├── 📂 05_DCL/
│   └── 05_DCL_theory.sql                 ← GRANT, REVOKE
│
├── 📂 06_Datatypes/
│   └── 06_Datatypes_theory.sql           ← Numeric, String, Date, Boolean, Binary
│
├── 📂 07_Constraints/
│   └── 07_Constraints_theory.sql         ← NOT NULL, UNIQUE, PK, FK, CHECK, DEFAULT
│
├── 📂 08_Joins/
│   └── 08_Joins_theory.sql               ← INNER, LEFT, RIGHT, FULL, CROSS, SELF
│
├── 📂 09_Views_StoredProcedures/
│   └── 09_Views_StoredProcedures_theory.sql  ← CREATE VIEW, STORED PROCEDURES
│
└── 📂 (original files – untouched)
    ├── datatypes.sql
    ├── datatypes.md
    ├── test.sql
    └── theory.ipynb
```

---

## 🧠 What is SQL?

**SQL (Structured Query Language)** is a standard language used to interact with **Relational Database Management Systems (RDBMS)** such as MySQL, PostgreSQL, Oracle, and MS SQL Server.

- **DBMS** – A system application to create, update, and manage a database.
- **RDBMS** – A DBMS that follows the **Relational Model** (tables with rows & columns).
- **MySQL** – A free, open-source RDBMS widely used in the industry.

---

## 📌 SQL Command Categories

| # | Category | Full Form | Commands | Purpose |
|---|----------|-----------|----------|---------|
| 1 | **DDL** | Data Definition Language | `CREATE`, `DROP`, `ALTER`, `TRUNCATE`, `RENAME` | Define/modify structure |
| 2 | **DML** | Data Manipulation Language | `INSERT`, `UPDATE`, `DELETE` | Manipulate data |
| 3 | **DQL** | Data Query Language | `SELECT` | Retrieve/query data |
| 4 | **TCL** | Transaction Control Language | `COMMIT`, `ROLLBACK`, `SAVEPOINT` | Manage transactions |
| 5 | **DCL** | Data Control Language | `GRANT`, `REVOKE` | Control user access |

---

## 📂 Topic-Wise Notes

---

### 01 — DDL (Data Definition Language)
> 📄 [`01_DDL/01_DDL_theory.sql`](01_DDL/01_DDL_theory.sql)

DDL commands define and manage the **structure (schema)** of database objects.

| Command | Description |
|---------|-------------|
| `CREATE DATABASE` | Creates a new database |
| `CREATE TABLE` | Creates a new table with columns and types |
| `ALTER TABLE` | Add / modify / drop / rename columns |
| `TRUNCATE TABLE` | Deletes all rows but keeps structure |
| `DROP TABLE` | Completely removes the table |
| `DROP DATABASE` | Completely removes the database |

```sql
-- Create a database and a table
CREATE DATABASE SCHOOL;
USE SCHOOL;

CREATE TABLE STUDENTS (
    ID   INT,
    NAME VARCHAR(50),
    AGE  INT
);

-- Add a column
ALTER TABLE STUDENTS ADD CITY VARCHAR(30);

-- Remove a column
ALTER TABLE STUDENTS DROP COLUMN CITY;
```

---

### 02 — DML (Data Manipulation Language)
> 📄 [`02_DML/02_DML_theory.sql`](02_DML/02_DML_theory.sql)

DML commands perform **CRUD operations** (Create, Read, Update, Delete) on table data.

| Command | Description |
|---------|-------------|
| `INSERT INTO` | Add new rows to a table |
| `UPDATE` | Modify existing rows |
| `DELETE` | Remove specific rows |

```sql
-- Insert a row
INSERT INTO STUDENTS VALUES (1, 'Rahul', 20);

-- Update a value
UPDATE STUDENTS SET AGE = 21 WHERE ID = 1;

-- Delete a row
DELETE FROM STUDENTS WHERE ID = 1;
```

> ⚠️ Always use `WHERE` with `UPDATE` and `DELETE` to avoid modifying **all rows**.

---

### 03 — DQL (Data Query Language)
> 📄 [`03_DQL/03_DQL_theory.sql`](03_DQL/03_DQL_theory.sql)

DQL is used to **retrieve** data from tables using the `SELECT` command.

| Clause | Description |
|--------|-------------|
| `SELECT` | Choose which columns to display |
| `DISTINCT` | Remove duplicate rows |
| `WHERE` | Filter rows by condition |
| `ORDER BY` | Sort results (ASC / DESC) |
| `LIMIT` | Restrict number of rows |
| `GROUP BY` | Group rows by column value |
| `HAVING` | Filter groups (like WHERE for GROUP BY) |

**Aggregate Functions:**

| Function | Description |
|----------|-------------|
| `COUNT(*)` | Total number of rows |
| `SUM(col)` | Total sum of a column |
| `AVG(col)` | Average value |
| `MAX(col)` | Maximum value |
| `MIN(col)` | Minimum value |

```sql
-- Full example
SELECT DEPT, COUNT(*) AS Count, AVG(SALARY) AS Avg_Sal
FROM EMPLOYEES
WHERE SALARY > 30000
GROUP BY DEPT
HAVING AVG(SALARY) > 50000
ORDER BY Avg_Sal DESC
LIMIT 5;
```

**Query Execution Order (logical):**
```
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
```

---

### 04 — TCL (Transaction Control Language)
> 📄 [`04_TCL/04_TCL_theory.sql`](04_TCL/04_TCL_theory.sql)

A **transaction** is a group of SQL statements that succeed or fail **together** as a unit.

| Command | Description |
|---------|-------------|
| `COMMIT` | Permanently save all changes |
| `ROLLBACK` | Undo all changes since last commit |
| `SAVEPOINT name` | Mark a partial rollback point |
| `ROLLBACK TO SAVEPOINT name` | Undo only to the savepoint |

```sql
SET autocommit = 0;

UPDATE ACCOUNTS SET BALANCE = BALANCE - 1000 WHERE ID = 1;
UPDATE ACCOUNTS SET BALANCE = BALANCE + 1000 WHERE ID = 2;

COMMIT;    -- save both changes together
```

---

### 05 — DCL (Data Control Language)
> 📄 [`05_DCL/05_DCL_theory.sql`](05_DCL/05_DCL_theory.sql)

DCL controls **who can access what** in the database.

| Command | Description |
|---------|-------------|
| `GRANT` | Give privileges to a user |
| `REVOKE` | Remove privileges from a user |
| `FLUSH PRIVILEGES` | Apply privilege changes immediately |

```sql
-- Create a user
CREATE USER 'dev_user'@'localhost' IDENTIFIED BY 'Password@123';

-- Give SELECT access on one table
GRANT SELECT ON PRACTICE.EMPLOYEES TO 'dev_user'@'localhost';

-- Remove access
REVOKE SELECT ON PRACTICE.EMPLOYEES FROM 'dev_user'@'localhost';
```

---

### 06 — Datatypes
> 📄 [`06_Datatypes/06_Datatypes_theory.sql`](06_Datatypes/06_Datatypes_theory.sql)

A **datatype** specifies the kind and size of data a column can hold.

#### Numeric Types

| Type | Size | Range (Signed) |
|------|------|----------------|
| `TINYINT` | 1 byte | -128 to 127 |
| `SMALLINT` | 2 bytes | -32768 to 32767 |
| `MEDIUMINT` | 3 bytes | -8388608 to 8388607 |
| `INT` | 4 bytes | -2.1B to 2.1B |
| `BIGINT` | 8 bytes | Very large |
| `FLOAT(p,s)` | 4 bytes | Approximate decimal |
| `DOUBLE(p,s)` | 8 bytes | Precise decimal |
| `DECIMAL(p,s)` | Variable | Exact (use for money) |

#### String Types

| Type | Max Size | Notes |
|------|----------|-------|
| `CHAR(n)` | 255 chars | Fixed length |
| `VARCHAR(n)` | 65535 chars | Variable length |
| `TEXT` | 65535 chars | Long text |
| `ENUM(...)` | 65535 values | Store ONE value from list |
| `SET(...)` | 64 members | Store MULTIPLE values from list |

#### Date & Time Types

| Type | Format | Example |
|------|--------|---------|
| `DATE` | YYYY-MM-DD | 2026-10-20 |
| `TIME` | HH:MM:SS | 10:25:02 |
| `DATETIME` | YYYY-MM-DD HH:MM:SS | 2026-10-20 10:25:02 |
| `TIMESTAMP` | YYYY-MM-DD HH:MM:SS | Auto UTC-based |
| `YEAR` | YYYY | 2026 |

#### Boolean
- `BOOLEAN` is an alias for `TINYINT(1)`. `TRUE=1`, `FALSE=0`.

#### Binary
| Type | Max Size | Use Case |
|------|----------|----------|
| `BLOB` | 65 KB | Images, files |
| `MEDIUMBLOB` | 16 MB | Medium files |
| `LONGBLOB` | 4 GB | Large files |

---

### 07 — Constraints
> 📄 [`07_Constraints/07_Constraints_theory.sql`](07_Constraints/07_Constraints_theory.sql)

Constraints are **rules** on columns that validate data before storing.

| Constraint | Description |
|------------|-------------|
| `NOT NULL` | Column must have a value |
| `UNIQUE` | No duplicate values allowed |
| `PRIMARY KEY` | NOT NULL + UNIQUE; identifies each row |
| `FOREIGN KEY` | Links to a PRIMARY KEY in another table |
| `CHECK` | Restricts value based on a condition |
| `DEFAULT` | Provides a default value when none is given |
| `INDEX` | Speeds up searching; auto-created for PK & UNIQUE |

```sql
CREATE TABLE PERSON (
    ID      INT          PRIMARY KEY,
    NAME    VARCHAR(50)  NOT NULL,
    EMAIL   VARCHAR(100) UNIQUE,
    AGE     INT          CHECK (AGE >= 0),
    COUNTRY VARCHAR(30)  DEFAULT 'India'
);
```

---

### 08 — Joins
> 📄 [`08_Joins/08_Joins_theory.sql`](08_Joins/08_Joins_theory.sql)

A **JOIN** combines rows from two or more tables using a related column.

| Join Type | Returns |
|-----------|---------|
| `INNER JOIN` | Only matching rows from both tables |
| `LEFT JOIN` | All rows from LEFT + matching from RIGHT (NULL if no match) |
| `RIGHT JOIN` | All rows from RIGHT + matching from LEFT (NULL if no match) |
| `FULL JOIN` | All rows from both tables (MySQL: use UNION workaround) |
| `CROSS JOIN` | Every combination of rows (Cartesian product) |
| `SELF JOIN` | Table joined with itself |

```sql
-- INNER JOIN example
SELECT C.NAME, O.PRODUCT
FROM CUSTOMERS C
INNER JOIN ORDERS O ON C.ID = O.C_ID;
```

**Visual Summary:**
```
INNER JOIN:   [A ∩ B]
LEFT JOIN:    [A + A∩B]
RIGHT JOIN:   [B + A∩B]
FULL JOIN:    [A ∪ B]
CROSS JOIN:   [A × B]
```

---

### 09 — Views & Stored Procedures
> 📄 [`09_Views_StoredProcedures/09_Views_StoredProcedures_theory.sql`](09_Views_StoredProcedures/09_Views_StoredProcedures_theory.sql)

#### Views
A **VIEW** is a virtual table based on a saved SELECT query.

```sql
CREATE VIEW IT_EMPLOYEES AS
SELECT ID, NAME, SALARY FROM STAFF WHERE DEPT = 'IT';

SELECT * FROM IT_EMPLOYEES;   -- use it like a table
```

#### Stored Procedures
A **Stored Procedure** is a saved, reusable block of SQL statements.

| Parameter Type | Direction | Description |
|----------------|-----------|-------------|
| `IN` | Input | Pass a value into the procedure |
| `OUT` | Output | Get a value back from the procedure |
| `INOUT` | Both | Pass in and get back a value |

```sql
DELIMITER $$

CREATE PROCEDURE GetByDept(IN dept_name VARCHAR(30))
BEGIN
    SELECT * FROM STAFF WHERE DEPT = dept_name;
END $$

DELIMITER ;

CALL GetByDept('IT');
```

---

## 📏 SQL Query Rules

1. SQL is **case-insensitive** (`SELECT` = `select`)
2. Every query must end with a **semicolon** `;`
3. **Naming Rules:**
   - Max **30 characters**
   - Must start with an **alphabet**
   - Can include alphabets, digits, and underscores `_`

---

## 🏗️ Relational Model – E.F. Codd's Rules (Key Ones)

| Rule | Description |
|------|-------------|
| Information Rule | All data/metadata stored as values in a table |
| Guaranteed Access Rule | Access any value via: table name + column name + primary key |
| Null Values | Systematic treatment of NULL |
| Active Catalog | Schema stored in the same structure as data |
| Physical Independence | Changing storage doesn't affect queries |
| Logical Independence | Changing table structure doesn't break queries |

---

## 🔧 Common SQL Commands – Quick Reference

```sql
-- Database
SHOW DATABASES;
CREATE DATABASE db_name;
USE db_name;
DROP DATABASE db_name;

-- Table
SHOW TABLES;
DESC table_name;
CREATE TABLE t (col1 INT, col2 VARCHAR(50));
DROP TABLE IF EXISTS t;
TRUNCATE TABLE t;

-- Data
INSERT INTO t VALUES (...);
SELECT * FROM t WHERE col = val;
UPDATE t SET col = val WHERE condition;
DELETE FROM t WHERE condition;

-- Useful Functions
NOW()            -- current date and time
CURRENT_DATE()   -- today's date
CURRENT_TIME()   -- current time
DATE_FORMAT(date, '%d-%M-%Y')
STR_TO_DATE('25-12-2026', '%d-%m-%Y')
```

---

## 📖 Resources

- [MySQL Official Documentation](https://dev.mysql.com/doc/)
- [W3Schools SQL Tutorial](https://www.w3schools.com/sql/)
- [SQLZoo Practice](https://sqlzoo.net/)

---

*Happy Learning SQL! 🚀*
