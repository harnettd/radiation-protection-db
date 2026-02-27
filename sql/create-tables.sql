-- --------------------------------------------------------------------------
-- Project : A Relational Database for Radiation Protection in Uranium Mining
-- Created : 2026-02-24
-- Author  : Derek Harnett
-- Version : 0.1.0
-- --------------------------------------------------------------------------

DROP TABLE IF EXISTS test;

CREATE TABLE test (
    col_1 INT,
    col_2 VARCHAR(30),
    col_3 DATETIME,
    col_4 DECIMAL(7, 2)
);
