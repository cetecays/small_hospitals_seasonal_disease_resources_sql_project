/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore all dimensional attributes.

SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- Retrieve a list of all seasons recorded in the dataset
SELECT distinct season
FROM gold.dim_dates
ORDER BY season;

-- Retrieve a list of all days of the week
SELECT distinct day_of_week
FROM gold.dim_dates
ORDER BY day_of_week;

-- Retrieve a list of all months
SELECT distinct month
FROM gold.dim_dates
ORDER BY month;

-- Retrieve a list of all unique genders
SELECT distinct gender
FROM gold.fact_visits
ORDER BY gender;

-- Retrieve a list of all unique diseases
SELECT distinct disease
FROM gold.fact_visits
ORDER BY disease;

-- Retrieve a list of all disease severity classifications
SELECT distinct severity
FROM gold.fact_visits
ORDER BY severity;

-- Retrieve a list of all admission types
SELECT distinct admission_type
FROM gold.fact_visits
ORDER BY admission_type;

-- Retrieve a list of all unique departments
SELECT distinct department
FROM gold.fact_visits
ORDER BY department;