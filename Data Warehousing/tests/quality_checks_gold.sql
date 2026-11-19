-- ====================================================================
-- Checking 'gold.dim_dates'
-- ====================================================================
-- Check for Uniqueness of Date Key in gold.dim_dates
-- Expectation: No results
SELECT
    date_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_dates
GROUP BY date_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.fact_visits'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_visits v
LEFT JOIN gold.dim_dates d
ON v.date_key = d.date_key
WHERE d.date_key IS NULL
