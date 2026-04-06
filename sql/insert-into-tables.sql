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
VALUES ('RadYouHave Inc.', '19 Warbler St', 'Kitimat', 'British Columbia', 'Canada', 'V2G 3H7', '7785556667', 'radyouhave@aws.ca'),
       ('ReadYourDevice Co.', '4501 Mallard Ave', 'Truro', 'Nova Scotia', 'Canada', 'B3P 6T0', '7786665342', 'readyourdevice@azure.ca');

INSERT INTO equipment_category (eq_cat_name, eq_cat_cal_freq_d)
VALUES ('air pump', 30),
       ('alpha counter', 60),
       ('personal alpha dosimeter', 90),
       ('optically stimulated luminescent dosimeter', 90),
       ('direct reading dosimeter', 30),
       ('gamma meter', 60);

INSERT INTO equipment (eq_ser_num, eq_make, eq_model, eq_status, eq_last_cal_date, eq_next_cal_date, eq_cat_code)
VALUES ('AIR-2020-001', 'AirPumper', 'A-1000',    'ready', '2026-03-01', DATE_ADD('2026-03-01', INTERVAL 30 DAY), 1),
       ('AIR-2020-002', 'AirPumper', 'A-1000', 'deployed', '2026-03-31', DATE_ADD('2026-03-31', INTERVAL 30 DAY), 1),
       ('ALP-2023-050', 'AlphaCount', 'S1',       'ready', '2026-03-01', DATE_ADD('2026-03-01', INTERVAL 60 DAY), 2),
       ('ALP-2024-100', 'AlphaCount', 'S2',       'ready', '2026-03-15', DATE_ADD('2026-03-15', INTERVAL 60 DAY), 2),
       ('CLP-2022-111', 'Clip-On',    'PAD-X',    'ready', '2026-02-01', DATE_ADD('2026-02-01', INTERVAL 90 DAY), 3),
       ('CLP-2022-222', 'Clip-On',    'PAD-X',    'ready', '2026-02-15', DATE_ADD('2026-02-15', INTERVAL 90 DAY), 3),
       ('STM-2025-501', 'Stimulex',   'Stimpack', 'ready', '2026-03-15', DATE_ADD('2026-03-15', INTERVAL 90 DAY), 4),
       ('STM-2025-601', 'Stimulex',   'Stimpack', 'ready', '2026-01-12', DATE_ADD('2026-01-12', INTERVAL 90 DAY), 4),
       ('RME-2023-010', 'README',   'V0.1.0',     'ready', '2026-04-25', DATE_ADD('2026-04-25', INTERVAL 30 DAY), 5),
       ('RME-2024-011', 'README',   'V0.1.1',     'ready', '2026-04-05', DATE_ADD('2026-04-05', INTERVAL 30 DAY), 5),
       ('GAM-2026-999', 'Gamete',   'Basic',   'deployed', '2026-01-05', DATE_ADD('2026-01-05', INTERVAL 60 DAY), 6),
       ('GAM-2026-888', 'Gamete',   'Basic',      'ready', '2026-04-05', DATE_ADD('2026-04-05', INTERVAL 60 DAY), 6);
       
INSERT INTO sample_category (samp_cat_name, samp_cat_desc)
VALUES ('area radon',  'test for radon gas concentration in a zone'),
       ('area alpha',  'test for alpha emitter concentration in a zone'),
       ('area gamma',  'test for gamma dose rate in a zone'),
       ('person drd',  'test a worker for daily gamma dose'),
       ('person pad',  'test a worker for monthly alpha dose'),
       ('person osld', 'test a worker for monthly gamma dose');

INSERT INTO sample (sample_start, sample_end, sample_is_void, sample_void_comment, samp_cat_code, worker_id)
VALUES 
    ('2026-01-02 08:30', DATE_ADD('2026-01-02 08:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-01-05 08:00', DATE_ADD('2026-01-05 08:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-01-08 09:30', DATE_ADD('2026-01-08 09:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-01-12 11:00', DATE_ADD('2026-01-12 11:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-01-15 13:00', DATE_ADD('2026-01-15 13:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-01-19 14:30', DATE_ADD('2026-01-19 14:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-01-22 16:00', DATE_ADD('2026-01-22 16:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-01-06 08:30', DATE_ADD('2026-01-06 08:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-01-10 10:00', DATE_ADD('2026-01-10 10:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-01-16 12:00', DATE_ADD('2026-01-16 12:00', INTERVAL 5 MINUTE), TRUE, 'Equipment malfunction - sensor drift detected', 1, 1),
    ('2026-01-28 15:00', DATE_ADD('2026-01-28 15:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-02-03 07:30', DATE_ADD('2026-02-03 07:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-02-06 09:00', DATE_ADD('2026-02-06 09:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-02-10 10:30', DATE_ADD('2026-02-10 10:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-02-13 12:00', DATE_ADD('2026-02-13 12:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-02-17 13:30', DATE_ADD('2026-02-17 13:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-02-20 15:00', DATE_ADD('2026-02-20 15:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-02-05 08:00', DATE_ADD('2026-02-05 08:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-02-11 11:00', DATE_ADD('2026-02-11 11:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-02-18 14:00', DATE_ADD('2026-02-18 14:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-02-25 16:30', DATE_ADD('2026-02-25 16:30', INTERVAL 5 MINUTE), TRUE, 'Equipment malfunction - power failure during sampling', 1, 1),
    ('2026-03-04 07:00', DATE_ADD('2026-03-04 07:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-03-07 08:30', DATE_ADD('2026-03-07 08:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-03-11 10:00', DATE_ADD('2026-03-11 10:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-03-14 11:30', DATE_ADD('2026-03-14 11:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-03-18 13:00', DATE_ADD('2026-03-18 13:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-03-21 14:30', DATE_ADD('2026-03-21 14:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-03-06 16:00', DATE_ADD('2026-03-06 16:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-03-12 08:00', DATE_ADD('2026-03-12 08:00', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-03-19 10:30', DATE_ADD('2026-03-19 10:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1),
    ('2026-03-27 15:30', DATE_ADD('2026-03-27 15:30', INTERVAL 5 MINUTE), FALSE, NULL, 1, 1);

INSERT INTO equipment_sample (eq_ser_num, sample_id)
VALUES
    ('AIR-2020-001', 1), ('ALP-2023-050', 1),
    ('AIR-2020-001', 2), ('ALP-2023-050', 2), 
    ('AIR-2020-001', 3), ('ALP-2023-050', 3),
    ('AIR-2020-001', 4), ('ALP-2023-050', 4),
    ('AIR-2020-001', 5), ('ALP-2023-050', 5),
    ('AIR-2020-001', 6), ('ALP-2023-050', 6),
    ('AIR-2020-001', 7), ('ALP-2023-050', 7),
    ('AIR-2020-001', 8), ('ALP-2023-050', 8),
    ('AIR-2020-001', 9), ('ALP-2023-050', 9),
    ('AIR-2020-001', 10), ('ALP-2023-050', 10),
    ('AIR-2020-001', 11), ('ALP-2023-050', 11),
    ('AIR-2020-002', 12), ('ALP-2024-100', 12),
    ('AIR-2020-002', 13), ('ALP-2024-100', 13),
    ('AIR-2020-002', 14), ('ALP-2024-100', 14),
    ('AIR-2020-002', 15), ('ALP-2024-100', 15),
    ('AIR-2020-002', 16), ('ALP-2024-100', 16),
    ('AIR-2020-002', 17), ('ALP-2024-100', 17),
    ('AIR-2020-002', 18), ('ALP-2024-100', 18),
    ('AIR-2020-002', 19), ('ALP-2024-100', 19),
    ('AIR-2020-002', 20), ('ALP-2024-100', 20),
    ('AIR-2020-002', 21), ('ALP-2024-100', 21),
    ('AIR-2020-001', 22), ('ALP-2023-050', 22),
    ('AIR-2020-001', 23), ('ALP-2023-050', 23),
    ('AIR-2020-001', 24), ('ALP-2023-050', 24),
    ('AIR-2020-001', 25), ('ALP-2023-050', 25),
    ('AIR-2020-001', 26), ('ALP-2023-050', 26),
    ('AIR-2020-001', 27), ('ALP-2023-050', 27),
    ('AIR-2020-001', 28), ('ALP-2023-050', 28),
    ('AIR-2020-001', 29), ('ALP-2023-050', 29),
    ('AIR-2020-001', 30), ('ALP-2023-050', 30),
    ('AIR-2020-001', 31), ('ALP-2023-050', 31);

INSERT INTO area_radon_result (sample_id, arr_concentration_bq_m3, worker_id, zone_id)
VALUES
    (1, 3500, 2, 10),
    (2, 1250.5, 1, 1),
    (3, 2800.0, 2, 2),
    (4, 4500.0, 3, 3),
    (5, 850.0, 1, 4),
    (6, 3200.0, 2, 5),
    (7, 1500.0, 3, 6),
    (8, 5500.0, 1, 7),
    (9, 2100.0, 2, 8),
    (10, 99999.0, 3, 9),  -- VOID
    (11, 980.0, 1, 10),
    (12, 1800.0, 1, 1),
    (13, 3100.0, 2, 2),
    (14, 6200.0, 3, 3),
    (15, 1100.0, 1, 4),
    (16, 4800.0, 2, 5),
    (17, 2400.0, 3, 6),
    (18, 7500.0, 1, 7),
    (19, 1650.0, 2, 8),
    (20, 3900.0, 3, 9),
    (21, 88888.0, 1, 10),  -- VOID
    (22, 1450.0, 2, 1),
    (23, 2950.0, 3, 2),
    (24, 5100.0, 1, 3),
    (25, 920.0, 2, 4),
    (26, 3600.0, 3, 5),
    (27, 1750.0, 1, 6),
    (28, 4200.0, 2, 7),
    (29, 2650.0, 3, 8),
    (30, 1300.0, 1, 9),
    (31, 5800.0, 2, 10);

-- INSERT INTO area_alpha_result (sample_id, aar_concentration_bq_m3, worker_id, zone_id)
-- VALUES ();

-- INSERT INTO area_gamma_result (sample_id, agr_dose_rate_usv_hr, worker_id, zone_id)
-- VALUES ();

-- INSERT INTO person_drd_result (sample_id, drd_dose_usv, worker_id)
-- VALUES ();

-- INSERT INTO person_pad_result (sample_id, ppr_dose_msv, worker_id, lab_id)
-- VALUES ();

-- INSERT INTO person_osld_result (sample_id, por_dose_msv, worker_id, lab_id)
-- VALUES ();
