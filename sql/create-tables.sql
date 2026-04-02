-- --------------------------------------------------------------------------
-- Project : A Relational Database for Radiation Protection in Uranium Mining
-- Created : 2026-02-24
-- Author  : Derek Harnett
-- Version : 0.1.0
-- --------------------------------------------------------------------------

DROP TABLE IF EXISTS job_category;
CREATE TABLE job_category (
    job_code INT AUTO_INCREMENT,
    job_title VARCHAR(80) NOT NULL UNIQUE,
    job_desc TEXT,
    PRIMARY KEY (job_code)
);

DROP TABLE IF EXISTS worker;
CREATE TABLE worker (
    worker_id INT AUTO_INCREMENT,
    worker_fname VARCHAR(40) NOT NULL,
    worker_initials VARCHAR(5),
    worker_lname VARCHAR(40) NOT NULL,
    worker_sin CHAR(9) NOT NULL UNIQUE,
    worker_phone CHAR(10) NOT NULL,
    worker_email VARCHAR(80) NOT NULL,
    job_code INT NOT NULL,
    PRIMARY KEY (worker_id),
    FOREIGN KEY (job_code) REFERENCES job_category (job_code) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS site;
CREATE TABLE site (
    site_num INT AUTO_INCREMENT,
    site_name VARCHAR(80) NOT NULL,
    site_desc TEXT,
    site_lat DECIMAL(5, 3) NOT NULL CHECK (site_lat BETWEEN -90.0000 AND 90.0000),
    site_long DECIMAL (6, 3) NOT NULL CHECK (site_long BETWEEN -180.0000 AND 180.0000),
    site_region VARCHAR(80) NOT NULL,
    site_country VARCHAR(80) NOT NULL,
    PRIMARY KEY (site_num),
    CONSTRAINT unique_location UNIQUE (site_lat, site_long)
);

DROP TABLE IF EXISTS building;
CREATE TABLE building (
    bldg_num INT NOT NULL,
    bldg_name VARCHAR(80) NOT NULL,
    bldg_desc TEXT,
    site_num INT NOT NULL,
    PRIMARY KEY (site_num, bldg_num),
    FOREIGN KEY (site_num) REFERENCES site (site_num) ON UPDATE CASCADE
); 

DROP TABLE IF EXISTS zone;
CREATE TABLE zone (
    zone_id INT AUTO_INCREMENT,
    zone_num INT NOT NULL,
    zone_desc TEXT,
    bldg_num INT NOT NULL,
    site_num INT NOT NULL,
    PRIMARY KEY (zone_id),
    CONSTRAINT unique_site_bldg_zone UNIQUE (site_num, bldg_num, zone_num),
    FOREIGN KEY (site_num, bldg_num) REFERENCES building (site_num, bldg_num) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS lab;
CREATE TABLE lab (
    lab_id INT AUTO_INCREMENT,
    lab_name VARCHAR(80) NOT NULL,
    lab_street_address VARCHAR(120) NOT NULL,
    lab_city VARCHAR(80) NOT NULL,
    lab_region VARCHAR(50) NOT NULL,
    lab_country VARCHAR(30) NOT NULL,
    lab_postal_code CHAR(7) NOT NULL,
    lab_phone CHAR(10) NOT NULL,
    lab_email VARCHAR(100) NOT NULL,
    PRIMARY KEY (lab_id),
    CONSTRAINT unique_phone_email UNIQUE (lab_phone, lab_email)
);

DROP TABLE IF EXISTS equipment_category;
CREATE TABLE equipment_category (
    eq_cat_code INT AUTO_INCREMENT,
    eq_cat_name VARCHAR(80) NOT NULL,
    eq_cat_cal_freq_d INT NOT NULL,
    PRIMARY KEY (eq_cat_code)
);