/*
===============================================================================
Magnitude Analysis
===============================================================================
Purpose:
    - To quantify data and group results by specific dimensions.
    - For understanding data distribution across categories.

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT(), AVG()
    - GROUP BY, ORDER BY
===============================================================================
*/

-- What are the top 5 diseases that produce the highest rates of readmission?
SELECT 
    disease,
    CAST(COUNT(CASE
        WHEN readmission_within_30_days = 'Yes' THEN 1
        END) * 100.0/COUNT(*) AS DECIMAL(10, 2)) AS rate_of_readmission
    FROM gold.fact_visits
    GROUP BY disease
    ORDER BY rate_of_readmission DESC
    LIMIT 5;

-- What is the rate of readmission in each season?
SELECT 
    da.season,
    CAST(COUNT(CASE
        WHEN vi.readmission_within_30_days = 'Yes' THEN 1
        END) * 100.0/COUNT(*) AS DECIMAL(10, 2)) AS rate_of_readmission
    FROM gold.fact_visits vi
    LEFT JOIN gold.dim_dates da ON vi.date_key = da.date_key
    GROUP BY da.season;

-- Find the number of cases for each disease by season
SELECT
    vi.disease,
    da.season,
    COUNT(*) AS number_of_cases
    FROM gold.fact_visits vi
    LEFT JOIN gold.dim_dates da ON vi.date_key = da.date_key
    GROUP BY vi.disease, da.season
    ORDER BY vi.disease, da.season;

-- What are the top 5 diseases that produce the longest lengths of stay at the hospital?
SELECT
    disease,
    ROUND(AVG(CAST(length_of_stay AS FLOAT)), 2) AS avg_length_of_stay
    FROM gold.fact_visits
    GROUP BY disease
    ORDER BY avg_length_of_stay DESC
    LIMIT 5;

-- Find the average length of stay by severity
SELECT
    severity,
    ROUND(AVG(CAST(length_of_stay AS FLOAT)), 2) AS avg_length_of_stay
    FROM gold.fact_visits
    GROUP BY severity;

-- Find the rate of readmission by severity
SELECT 
    severity,
    CAST(COUNT(CASE
        WHEN readmission_within_30_days = 'Yes' THEN 1
        END) * 100.0/COUNT(*) AS DECIMAL(10, 2)) AS rate_of_readmission
    FROM gold.fact_visits
    GROUP BY severity;

-- Find the average percentage of available resources left by season
SELECT
    da.season,
    CAST(AVG((vi.total_beds_available-vi.beds_occupied)*100.0/total_beds_available) AS DECIMAL(10,2)) as avg_available_beds_left,
    CAST(AVG((vi.icu_beds_available-vi.icu_beds_occupied)*100.0/icu_beds_available) AS DECIMAL(10,2)) as avg_icu_beds_left
    FROM gold.fact_visits vi
    LEFT JOIN gold.dim_dates da ON vi.date_key = da.date_key
    GROUP BY da.season

-- Find the average oxygen unit usage by season
SELECT
    da.season,
    ROUND(AVG(CAST(oxygen_units_used AS FLOAT)), 2) AS avg_oxygen_units_used
    FROM gold.fact_visits vi
    LEFT JOIN gold.dim_dates da ON vi.date_key = da.date_key
    GROUP BY da.season
