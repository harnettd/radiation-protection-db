-- --------------------------------------------------------------------------
-- Project : A Relational Database for Radiation Protection in Uranium Mining
-- Created : 2026-04-06
-- Author  : Derek Harnett
-- Version : 0.1.0
-- --------------------------------------------------------------------------

-- Generate a calibration report showing each piece of equipment that is
-- overdue for calibration.
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

-- Generate a report showing summary area statistics (avg and max) for each
-- zone. Exclude samples marked void.
DROP VIEW IF EXISTS area_summary;
CREATE VIEW area_summary AS
    SELECT
        site_num, bldg_num, zone_num,
        ROUND(AVG(arr_concentration_bq_m3), 1) AS avg_radon_concentration,
        ROUND(MAX(arr_concentration_bq_m3), 1) AS max_radon_concentration
    FROM sample JOIN
        area_radon_result USING (sample_id) JOIN
        zone USING (zone_id)
    WHERE sample_is_void = FALSE
    GROUP BY zone_id
    ORDER BY zone_id;

-- Generate a list of all pieces of equipment for which a corresponding
-- sample has been marked void.
DROP VIEW IF EXISTS void_equipment;
CREATE VIEW void_equipment AS
    SELECT
        eq_ser_num,
        eq_make,
        eq_model
    FROM equipment
    WHERE eq_ser_num IN (
        SELECT DISTINCT
            eq_ser_num
        FROM sample JOIN
            equipment_sample USING (sample_id)
        WHERE sample_is_void = TRUE
        );

-- Generate a report showing how many days have passed since each type of
-- area-sample has been taken for each zone.
DROP VIEW IF EXISTS area_frequency;
CREATE VIEW area_frequency AS
    SELECT
        site_num, bldg_num, zone_num,
        DATEDIFF(CURRENT_DATE, DATE(MAX(sample_start))) AS days_since_radon_sample
    FROM sample JOIN
        area_radon_result USING (sample_id) JOIN
        zone USING (zone_id)
    GROUP BY zone_id
    ORDER BY zone_id;
