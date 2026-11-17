/*
===============================================================================
Age Segmentation Analysis
===============================================================================
Purpose:
    - To group patients into by age for age group analysis.

SQL Functions Used:
    - CASE: Defines custom segmentation logic.
    - GROUP BY: Groups data into segments.
===============================================================================
*/

WITH age_segments AS (
    SELECT 
        CASE 
            WHEN age < 18 THEN 'Under 18'
            WHEN age BETWEEN 18 AND 29 THEN '18-29'
            WHEN age BETWEEN 30 AND 44 THEN '30-44'
            WHEN age BETWEEN 45 AND 59 THEN '45-59'
            ELSE '60+'
            END as age_group,
        
        CASE
            WHEN age < 18 THEN 1
            WHEN age BETWEEN 18 AND 29 THEN 2
            WHEN age BETWEEN 30 AND 44 THEN 3
            WHEN age BETWEEN 45 AND 59 THEN 4
            WHEN age >= 60 THEN 5
            ELSE 6
        END AS age_group_order,

        length_of_stay,
        readmission_within_30_days
    FROM gold.fact_visits
)

SELECT
    age_group,
    COUNT(*) AS total_visits,
    ROUND(AVG(CAST(length_of_stay AS FLOAT)), 2) AS avg_length_of_stay,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN readmission_within_30_days = 'Yes' THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS readmission_rate

FROM age_segments
GROUP BY
    age_group,
    age_group_order
ORDER BY age_group_order;