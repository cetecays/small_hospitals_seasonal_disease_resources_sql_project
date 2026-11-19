/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse.
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dim_dates
-- =============================================================================
IF OBJECT_ID('gold.dim_dates', 'V') IS NOT NULL
    DROP VIEW gold.dim_dates;
GO

CREATE VIEW gold.dim_dates AS
SELECT
    ROW_NUMBER() OVER (ORDER BY hod_visit_date) AS date_key,    -- Surrogate key
    hod_visit_date AS visit_date,
    hod_month AS month,
    hod_season AS season,
    hod_day_of_week AS day_of_week
FROM silver.hospital_operations_dataset;
GO

-- =============================================================================
-- Create Fact Table: gold.fact_visits
-- =============================================================================
IF OBJECT_ID('gold.fact_visits', 'V') IS NOT NULL
    DROP VIEW gold.fact_visits;
GO

CREATE VIEW gold.fact_visits AS
SELECT
    op.hod_patient_id AS patient_id,
    op.hod_age AS age,
    op.hod_gender AS gender,
    da.date_key AS date_key,
    op.hod_disease AS disease,
    op.hod_severity AS severity,
    op.hod_admission AS admission_type,
    op.hod_length_of_stay AS length_of_stay,
    op.hod_bed_required AS bed_required,
    op.hod_oxygen_required AS oxygen_required,
    op.hod_ventilator_required AS ventilator_required,
    op.hod_total_beds_available AS total_beds_available,
    op.hod_beds_occupied AS beds_occupied,
    op.hod_icu_beds_available AS icu_beds_available,
    op.hod_icu_beds_occupied AS icu_beds_occupied,
    op.hod_oxygen_units_used AS oxygen_units_used,
    op.hod_department AS department, 
    op.hod_readmission_within_30_days AS readmission_within_30_days
FROM silver.hospital_operations_dataset op
LEFT JOIN gold.dim_dates da ON op.hod_visit_dates = da.visit_dates;
GO
