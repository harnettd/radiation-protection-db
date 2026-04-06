-- --------------------------------------------------------------------------
-- Project : A Relational Database for Radiation Protection in Uranium Mining
-- Created : 2026-04-06
-- Author  : Derek Harnett
-- Version : 0.1.0
-- --------------------------------------------------------------------------

-- Generate a calibration report showing each piece of equipment that is
-- overdue for calibration.
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
    ORDER BY days_overdue, eq_cat_name
;
