-- --------------------------------------------------------------------------
-- Project : A Relational Database for Radiation Protection in Uranium Mining
-- Created : 2026-02-24
-- Author  : Derek Harnett
-- Version : 0.1.0
-- --------------------------------------------------------------------------

INSERT INTO job_category (job_title, job_desc)
VALUES ('miner', 'mines uranium'),
       ('radiation technician', 'collects area samples'),
       ('radiation safety officer', 'approves samples');

INSERT INTO worker (worker_fname, worker_initials, worker_lname, worker_sin, worker_phone, worker_email, job_code)
VALUES ('Page', NULL, 'Lemart', '123456789', '7789584512', 'plemart@u238mineco.ca', 3),
       ('Martha', 'G.', 'Smith', '789123456', '7789584879', 'msmith@u238mineco.ca', 2),
       ('Angela', NULL, 'Jaswal', '987654321', '7789581122', 'ajaswal@u238mineco.ca', 2),
       ('Brett', 'B.B.', 'Bretterson', '197345682', '7789587558', 'bbretterson@u238mineco.ca', 1),
       ('Coop', 'A.', 'Cooper', '111555999', '7789589544', 'ccooper@u238mineco.ca', 1);

INSERT INTO site (site_name, site_desc, site_lat, site_long, site_region, site_country)
VALUES ('Musk Ox Falls', 'active uranium mining site', 55.652, -104.549, 'Saskatchewan', 'Canada'),
       ('Thirsty Mosquito Lake', NULL, 61.727, -109.376, 'Northwest Territories', 'Canada');

INSERT INTO building (bldg_num, bldg_name, bldg_desc, site_num)
VALUES (1, 'Administration', 'the building where offices are located', 1),
       (2, 'Cafeteria', 'the building where workers eat', 1),
       (3, 'Mine', 'the building where uranium is mined', 1),
       (1, 'Administration', 'the building where offices are located', 2),
       (2, 'Cafeteria', 'the building where workers eat', 2),
       (3, 'Mine', 'the building where uranium is mined', 2);

INSERT INTO zone (zone_num, zone_desc, bldg_num, site_num)
VALUES (1, 'ground floor', 1, 1),
       (2, 'second floor', 1, 1),
       (1, 'ground floor', 2, 1),
       (1, 'basement', 3, 1),
       (2, 'sub-basement', 3, 1),
       (1, 'ground floor', 1, 2),
       (2, 'second floor', 1, 2),
       (1, 'ground floor', 2, 2),
       (2, 'basement', 3, 2),
       (1, 'sub-basement', 3, 2);

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
