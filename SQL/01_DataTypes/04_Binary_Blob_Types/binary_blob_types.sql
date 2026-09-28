-- =============================================================
--          MYSQL BINARY & BLOB DATA TYPES
-- =============================================================
-- Topics: BINARY, VARBINARY, TINYBLOB, BLOB, MEDIUMBLOB, LONGBLOB
-- Run each block step by step in MySQL Workbench.
-- =============================================================

CREATE DATABASE IF NOT EXISTS PRACTICE;
USE PRACTICE;

-- =============================================================
-- PART 1 : BINARY / VARBINARY  (binary strings)
-- =============================================================
-- Similar to CHAR/VARCHAR but stores raw binary bytes.
-- Useful for: hash values, encrypted data, binary protocols.
-- BINARY(n)    → fixed binary,   max 255 bytes
-- VARBINARY(n) → variable binary, max 65535 bytes

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
-- PART 2 : BLOB TYPES  (binary large objects - for files)
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
-- PART 3 : BLOB via file path (demo reference)
-- =============================================================
-- In practice, you can load binary files like this:
-- (The file must exist at the given path on the MySQL server)

DROP TABLE IF EXISTS TRAIL01;
CREATE TABLE TRAIL01 (
    COL1 BLOB
);

-- Load binary data from file (requires FILE privilege):
-- INSERT INTO TRAIL01 VALUES (LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Data/practice/blob_64KB.bin'));

-- For demo, insert a small binary string:
INSERT INTO TRAIL01 VALUES (0xFFD8FFE000104A464946);
SELECT LENGTH(COL1) AS blob_bytes FROM TRAIL01;


-- =============================================================
-- QUICK SUMMARY - BINARY & BLOB TYPES
-- =============================================================
-- BINARY(n)     → fixed binary,   max 255 bytes
-- VARBINARY(n)  → variable binary, max 65535 bytes
-- TINYBLOB      → max 255 bytes
-- BLOB          → max 65 KB
-- MEDIUMBLOB    → max 16 MB  (images, PDFs)
-- LONGBLOB      → max 4 GB   (videos, large files)

-- Useful functions:
-- HEX(col)             → show binary as hex string
-- UNHEX('hexstring')   → convert hex string to binary
-- LOAD_FILE('path')    → load file from server filesystem
-- LENGTH(col)          → byte length of the value

-- =============================================================
-- END OF FILE
-- =============================================================
