-- --------------------------------------------------------------------------
-- Project : A Relational Database for Radiation Protection in Uranium Mining
-- Created : 2026-04-06
-- Author  : Derek Harnett
-- Version : 0.1.0
-- --------------------------------------------------------------------------

-- Generate a report showing each piece of equipment that is overdue 
-- for calibration.
DROP VIEW IF EXISTS calibration_report;
CREATE VIEW calibration_report AS
    SELECT
        eq_ser_num,
        eq_make,
        eq_model,
        eq_cat_name,
        ABS(DATEDIFF(eq_next_cal_date, CURRENT_DATE)) AS days_overdue
    FROM equipment JOIN
        equipment_category USING (eq_cat_code)
    WHERE DATEDIFF(eq_next_cal_date, CURRENT_DATE) < 0
    ORDER BY days_overdue, eq_cat_name;

-- Generate a report listing all pieces of equipment for which a 
-- corresponding sample has been marked void.
DROP VIEW IF EXISTS void_equipment;
CREATE VIEW void_equipment AS
    SELECT
        eq_ser_num,
        eq_make,
        eq_model
    FROM equipment
    WHERE eq_ser_num IN (
        SELECT DISTINCT eq_ser_num
        FROM sample JOIN
            equipment_sample USING (sample_id)
        WHERE sample_is_void = TRUE
        );

-- Generate a report showing summary area statistics (avg and max) for each
-- zone for each category of area sample. Exclude samples marked void.
DROP VIEW IF EXISTS area_summary;
CREATE VIEW area_summary AS
    SELECT
        COALESCE(arr.zone_id, aar.zone_id, agr.zone_id) AS zone_id,
        site_num, bldg_num, zone_num,
        ROUND(AVG(arr_concentration_bq_m3), 1) AS avg_radon,
        ROUND(MAX(arr_concentration_bq_m3), 1) AS max_radon,
        ROUND(AVG(aar_concentration_bq_m3), 1) AS avg_alpha,
        ROUND(MAX(aar_concentration_bq_m3), 1) AS max_alpha,
        ROUND(AVG(agr_dose_rate_usv_hr), 1) AS avg_gamma,
        ROUND(MAX(agr_dose_rate_usv_hr), 1) AS max_gamma
    FROM sample LEFT JOIN
        area_radon_result arr USING (sample_id) LEFT JOIN
        area_alpha_result aar USING (sample_id) LEFT JOIN
        area_gamma_result agr USING (sample_id) JOIN
        zone ON COALESCE(arr.zone_id, aar.zone_id, agr.zone_id) = zone.zone_id
    WHERE sample_is_void = FALSE AND
        samp_cat_code IN (1, 2, 3)
    GROUP BY 
        COALESCE(arr.zone_id, aar.zone_id, agr.zone_id)
    ORDER BY zone_id;

-- Generate a report showing how many days have passed since each type of
-- area-sample has been taken for each zone.
DROP VIEW IF EXISTS area_frequency;
CREATE VIEW area_frequency AS
    SELECT
        COALESCE(arr.zone_id, aar.zone_id, agr.zone_id) as zone_id,
        site_num, bldg_num, zone_num,
        samp_cat_name,
        MIN(DATEDIFF(CURRENT_DATE, DATE(sample_start))) AS days_since
    FROM sample LEFT JOIN
        area_radon_result arr USING (sample_id) LEFT JOIN
        area_alpha_result aar USING (sample_id) LEFT JOIN
        area_gamma_result agr USING (sample_id) JOIN
        sample_category USING (samp_cat_code) JOIN
        zone ON COALESCE(arr.zone_id, aar.zone_id, agr.zone_id) = zone.zone_id
    WHERE sample_is_void = FALSE
    GROUP BY COALESCE(arr.zone_id, aar.zone_id, agr.zone_id), samp_cat_code
    ORDER BY zone_id, samp_cat_code;

-- Generate a report for each worker indicating their year-to-date 
-- absorbed dose as measured by PADs and OSLDs.
DROP VIEW IF EXISTS worker_dose;
CREATE VIEW worker_dose AS
    SELECT
        COALESCE(ppr.worker_id, por.worker_id) AS worker_id,
        worker_lname, worker_initials, worker_fname,
        ROUND(SUM(ppr_dose_msv), 2) AS alpha_dose_ytd,
        ROUND(SUM(por_dose_msv), 2) AS gamma_dose_ytd,
        ROUND(SUM(ppr_dose_msv) + SUM(por_dose_msv), 2) AS total_dose_ytd 
    FROM sample LEFT JOIN
        person_pad_result ppr USING (sample_id) LEFT JOIN
        person_osld_result por USING (sample_id) JOIN
        worker w ON COALESCE(ppr.worker_id, por.worker_id) = w.worker_id
    WHERE samp_cat_code IN (4, 5, 6) AND
        EXTRACT(YEAR FROM sample_start) = EXTRACT(YEAR FROM CURRENT_DATE)
    GROUP BY COALESCE(ppr.worker_id, por.worker_id)
    ORDER BY worker_id;