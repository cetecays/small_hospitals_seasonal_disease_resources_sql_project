/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- Analyse metrics over time
-- DATETRUNC()
SELECT
    DATETRUNC(MONTH, da.visit_date) AS visit_month,
    da.season,
    ROUND(AVG(CAST(vi.length_of_stay AS FLOAT)), 2) AS avg_length_of_stay,
    CAST(
        COUNT(CASE
            WHEN vi.readmission_within_30_days = 'Yes' THEN 1
        END) * 100.0 / COUNT(*) AS DECIMAL(10, 2)
    ) AS rate_of_readmission,
    CAST(AVG((vi.total_beds_available-vi.beds_occupied)*100.0/total_beds_available) AS DECIMAL(10,2)) as avg_available_beds_left,
    CAST(AVG((vi.icu_beds_available-vi.icu_beds_occupied)*100.0/icu_beds_available) AS DECIMAL(10,2)) as avg_icu_beds_left,
    AVG(oxygen_units_used) AS avg_oxygen_units_used
FROM gold.fact_visits vi
LEFT JOIN gold.dim_dates da
    ON vi.date_key = da.date_key
WHERE da.visit_date IS NOT NULL
GROUP BY
    DATETRUNC(MONTH, da.visit_date),
    da.season
ORDER BY
    visit_month,
    da.season;

