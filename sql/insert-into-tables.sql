-- --------------------------------------------------------------------------
-- Project : A Relational Database for Radiation Protection in Uranium Mining
-- Created : 2026-02-24
-- Author  : Derek Harnett
-- Version : 0.1.0
-- --------------------------------------------------------------------------

INSERT INTO job_category (job_title, job_desc)
VALUES ('miner', 'Mines uranium.'),
       ('radiation technician', 'Collects area samples.'),
       ('radiation safety officer', 'Approves samples.');

INSERT INTO worker (worker_fname, worker_initials, worker_lname, worker_sin, worker_phone, worker_email, job_code)
VALUES ();

INSERT INTO site (site_name, site_desc, site_lat, site_long, site_region, site_country)
VALUES ();

INSERT INTO building (bldg_num, bldg_name, bldg_desc, site_num)
VALUES ();

INSERT INTO zone (zone_num, zone_desc, bldg_num, site_num)
VALUES ();

INSERT INTO lab (lab_name, lab_street_address, lab_city, lab_region, lab_country, lab_postal_code, lab_phone, lab_email)
VALUES ();

INSERT INTO equipment_category (eq_cat_name, eq_cat_cal_freq_d)
VALUES ();

INSERT INTO equipment (eq_ser_num, eq_make, eq_model, eq_status, eq_last_cal_date, eq_next_cal_date, eq_cat_code)
VALUES ();

INSERT INTO sample_category (samp_cat_name, samp_cat_desc)
VALUES ();

INSERT INTO sample (sample_start, sample_end, sample_is_void, sample_void_comment, samp_cat_code, worker_id)
VALUES ();

INSERT INTO equipment_sample (eq_ser_num, sample_id)
VALUES ();

INSERT INTO area_radon_result (sample_id, arr_concentration_bq_m3, worker_id, zone_id)
VALUES ();

INSERT INTO area_alpha_result (sample_id, aar_concentration_bq_m3, worker_id, zone_id)
VALUES ();

INSERT INTO area_gamma_result (sample_id, agr_dose_rate_usv_hr, worker_id, zone_id)
VALUES ();

INSERT INTO person_drd_result (sample_id, drd_dose_usv, worker_id)
VALUES ();

INSERT INTO person_pad_result (sample_id, ppr_dose_msv, worker_id, lab_id)
VALUES ();

INSERT INTO person_osld_result (sample_id, por_dose_msv, worker_id, lab_id)
VALUES ();
