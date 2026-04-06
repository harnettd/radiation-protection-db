-- --------------------------------------------------------------------------
-- Project : A Relational Database for Radiation Protection in Uranium Mining
-- Created : 2026-04-06
-- Author  : Derek Harnett
-- Version : 0.1.0
-- --------------------------------------------------------------------------

-- Generate a calibration report showing each piece of equipment and how many
-- days remaining before each needs to be calibrated
CREATE VIEW calibration_report AS
    SELECT
        eq_ser_num,
        eq_make,
        eq_model,
        eq_cat_name,
        DATEDIFF(eq_next_cal_date, CURRENT_DATE) AS days_until_next_cal
    FROM equipment JOIN
        equipment_category USING (eq_cat_code)
    ORDER BY days_until_next_cal, eq_cat_name
;
