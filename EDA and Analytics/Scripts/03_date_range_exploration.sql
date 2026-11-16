/*
===============================================================================
Date Range Exploration
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Determine the first and last visit date and the total duration in months
SELECT
    MIN(visit_date)                                   AS first_visit_date,
    MAX(visit_date)                                   AS last_visit_date,
    DATEDIFF(MONTH, MIN(visit_date), MAX(visit_date)) AS visit_range_months
FROM gold.dim_dates;