-- --------------------------------------------------------------------------
-- Project : A Relational Database for Radiation Protection in Uranium Mining
-- Created : 2026-02-24
-- Author  : Derek Harnett
-- Version : 0.1.0
-- --------------------------------------------------------------------------


-- Drop all tables

DROP TABLE IF EXISTS person_osld_result;
DROP TABLE IF EXISTS person_pad_result;
DROP TABLE IF EXISTS person_drd_result;
DROP TABLE IF EXISTS area_gamma_result;
DROP TABLE IF EXISTS area_alpha_result;
DROP TABLE IF EXISTS area_radon_result;
DROP TABLE IF EXISTS equipment_sample;
DROP TABLE IF EXISTS sample;
DROP TABLE IF EXISTS sample_category;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS equipment_category;
DROP TABLE IF EXISTS lab;
DROP TABLE IF EXISTS zone;
DROP TABLE IF EXISTS building;
DROP TABLE IF EXISTS site;
DROP TABLE IF EXISTS worker;
DROP TABLE IF EXISTS job_category;


-- Create all tables

CREATE TABLE job_category (
    job_code INT AUTO_INCREMENT,
    job_title VARCHAR(80) NOT NULL UNIQUE,
    job_desc TEXT,
    PRIMARY KEY (job_code)
);

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

CREATE TABLE building (
    bldg_num INT NOT NULL,
    bldg_name VARCHAR(80) NOT NULL,
    bldg_desc TEXT,
    site_num INT NOT NULL,
    PRIMARY KEY (site_num, bldg_num),
    FOREIGN KEY (site_num) REFERENCES site (site_num) ON UPDATE CASCADE
); 

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

CREATE TABLE equipment_category (
    eq_cat_code INT AUTO_INCREMENT,
    eq_cat_name VARCHAR(80) NOT NULL,
    eq_cat_cal_freq_d INT NOT NULL,
    PRIMARY KEY (eq_cat_code)
);

CREATE TABLE equipment (
    eq_ser_num VARCHAR(80),
    eq_make VARCHAR(80) NOT NULL,
    eq_model VARCHAR(80) NOT NULL,
    eq_status VARCHAR(25) NOT NULL CHECK (eq_status IN ('ready', 'deployed', 'out of service', 'retired')),
    eq_last_cal_date DATE NOT NULL,
    eq_next_cal_date DATE NOT NULL,
    eq_cat_code INT NOT NULL,
    PRIMARY KEY (eq_ser_num),
    FOREIGN KEY (eq_cat_code) REFERENCES equipment_category (eq_cat_code) ON UPDATE CASCADE
);

CREATE TABLE sample_category (
    samp_cat_code INT AUTO_INCREMENT,
    samp_cat_name VARCHAR(50) NOT NULL UNIQUE,
    samp_cat_desc TEXT,
    PRIMARY KEY (samp_cat_code)
);

CREATE TABLE sample (
    sample_id INT AUTO_INCREMENT,
    sample_start DATETIME NOT NULL,
    sample_end DATETIME NOT NULL,
    sample_is_void BOOLEAN NOT NULL DEFAULT FALSE,
    sample_void_comment TEXT,
    samp_cat_code INT NOT NULL,
    worker_id INT NOT NULL,
    PRIMARY KEY (sample_id),
    FOREIGN KEY (samp_cat_code) REFERENCES sample_category (samp_cat_code) ON UPDATE CASCADE,
    FOREIGN KEY (worker_id) REFERENCES worker (worker_id) ON UPDATE CASCADE
);

CREATE TABLE equipment_sample (
    es_id INT AUTO_INCREMENT,
    eq_ser_num VARCHAR(80) NOT NULL,
    sample_id INT NOT NULL,
    PRIMARY KEY (es_id),
    FOREIGN KEY (eq_ser_num) REFERENCES equipment (eq_ser_num) ON UPDATE CASCADE,
    FOREIGN KEY (sample_id) REFERENCES sample (sample_id) ON UPDATE CASCADE 
);

CREATE TABLE area_radon_result (
    sample_id INT,
    arr_concentration_bq_m3 DECIMAL(10, 6) NOT NULL CHECK (arr_concentration_bq_m3 >= 0),
    worker_id INT NOT NULL,
    zone_id INT NOT NULL,
    PRIMARY KEY (sample_id),
    FOREIGN KEY (sample_id) REFERENCES sample (sample_id) ON UPDATE CASCADE,
    FOREIGN KEY (worker_id) REFERENCES worker (worker_id) ON UPDATE CASCADE,
    FOREIGN KEY (zone_id) REFERENCES zone (zone_id) ON UPDATE CASCADE
);

CREATE TABLE area_alpha_result (
    sample_id INT,
    aar_concentration_bq_m3 DECIMAL(10, 6) NOT NULL CHECK (aar_concentration_bq_m3 >= 0),
    worker_id INT NOT NULL,
    zone_id INT NOT NULL,
    PRIMARY KEY (sample_id),
    FOREIGN KEY (sample_id) REFERENCES sample (sample_id) ON UPDATE CASCADE,
    FOREIGN KEY (worker_id) REFERENCES worker (worker_id) ON UPDATE CASCADE,
    FOREIGN KEY (zone_id) REFERENCES zone (zone_id) ON UPDATE CASCADE
);

CREATE TABLE area_gamma_result (
    sample_id INT,
    agr_dose_rate_usv_hr DECIMAL(10, 6) NOT NULL CHECK (agr_dose_rate_usv_hr >= 0),
    worker_id INT NOT NULL,
    zone_id INT NOT NULL,
    PRIMARY KEY (sample_id),
    FOREIGN KEY (sample_id) REFERENCES sample (sample_id) ON UPDATE CASCADE,
    FOREIGN KEY (worker_id) REFERENCES worker (worker_id) ON UPDATE CASCADE,
    FOREIGN KEY (zone_id) REFERENCES zone (zone_id) ON UPDATE CASCADE
);

CREATE TABLE person_drd_result (
    sample_id INT,
    drd_dose_usv DECIMAL(10, 6) NOT NULL CHECK (drd_dose_usv >= 0),
    worker_id INT NOT NULL,
    PRIMARY KEY (sample_id),
    FOREIGN KEY (sample_id) REFERENCES sample (sample_id) ON UPDATE CASCADE,
    FOREIGN KEY (worker_id) REFERENCES worker (worker_id) ON UPDATE CASCADE
);

CREATE TABLE person_pad_result (
    sample_id INT,
    ppr_dose_msv DECIMAL(10, 6) NOT NULL CHECK (ppr_dose_msv >= 0),
    worker_id INT NOT NULL,
    lab_id INT NOT NULL,
    PRIMARY KEY (sample_id),
    FOREIGN KEY (sample_id) REFERENCES sample (sample_id) ON UPDATE CASCADE,
    FOREIGN KEY (worker_id) REFERENCES worker (worker_id) ON UPDATE CASCADE,
    FOREIGN KEY (lab_id) REFERENCES lab (lab_id) ON UPDATE CASCADE
);

CREATE TABLE person_osld_result (
    sample_id INT,
    por_dose_msv DECIMAL(10, 6) NOT NULL CHECK (por_dose_msv >= 0),
    worker_id INT NOT NULL,
    lab_id INT NOT NULL,
    PRIMARY KEY (sample_id),
    FOREIGN KEY (sample_id) REFERENCES sample (sample_id) ON UPDATE CASCADE,
    FOREIGN KEY (worker_id) REFERENCES worker (worker_id) ON UPDATE CASCADE,
    FOREIGN KEY (lab_id) REFERENCES lab (lab_id) ON UPDATE CASCADE
);
