/*
===============================================================================
Measures Exploration (Averages)
===============================================================================
Purpose:
    - To calculate aggregated metrics for quick insights.

SQL Functions Used:
    - AVG()
===============================================================================
*/

-- Find the average length of stay
SELECT AVG(length_of_stay) AS avg_length_of_stay FROM gold.fact_visits

-- Find the average total beds available
SELECT AVG(total_beds_available) AS avg_total_beds_available FROM gold.fact_visits

-- Find the average number of beds occupied
SELECT AVG(beds_occupied) AS avg_beds_occupied FROM gold.fact_visits

-- Find the average icu beds available
SELECT AVG(icu_beds_available) AS avg_icu_beds_available FROM gold.fact_visits

-- Find the average icu beds occupied
SELECT AVG(icu_beds_occupied) AS avg_icu_beds_occupied FROM gold.fact_visits

-- Find the average oxygen units used
SELECT AVG(oxygen_units_used) AS avg_oxygen_units_used FROM gold.fact_visits

-- Generate a Report that shows all key metrics 
SELECT 'Average Length of Stay' AS measure_name, AVG(length_of_stay) AS measure_value FROM gold.fact_visits
UNION ALL
SELECT 'Average Number of Beds Available', AVG(total_beds_available) FROM gold.fact_visits
UNION ALL
SELECT 'Average Number of Beds Occupied', AVG(beds_occupied) FROM gold.fact_visits
UNION ALL
SELECT 'Average Number of ICU Beds Available', AVG(icu_beds_available) FROM gold.fact_visits
UNION ALL
SELECT 'Average Number of ICU Beds Occupied', AVG(icu_beds_occupied) FROM gold.fact_visits
UNION ALL
SELECT 'Average Number of Oxygen Units Used', AVG(oxygen_units_used) FROM gold.fact_visits;