/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouseAnalytics' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, this script creates a schema called gold

WARNING:
    Running this script will drop the entire 'DataWarehouseAnalytics' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.

Note:
    The BULK INSERT paths point to 'C:\sql\sql-data-analytics-project\01_datasets\csv-files\'.
    Change them to the folder where you saved the CSV files.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouseAnalytics' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouseAnalytics')
BEGIN
    ALTER DATABASE DataWarehouseAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouseAnalytics;
END;
GO

-- Create the 'DataWarehouseAnalytics' database
CREATE DATABASE DataWarehouseAnalytics;
GO

USE DataWarehouseAnalytics;
GO

-- Create Schemas

CREATE SCHEMA gold;
GO

CREATE TABLE gold.dim_dates(
    date_key int,
    visit_date date,
    month int,
    season nvarchar(max),
    day_of_week nvarchar(max)
);
GO

CREATE TABLE gold.fact_visits(
    patient_id nvarchar(max),
    age int,
    gender nvarchar(max),
    date_key int,
    disease nvarchar(max),
    severity nvarchar(max),
    admission_type nvarchar(max),
    length_of_stay int,
    bed_required nvarchar(max),
    oxygen_required nvarchar(max),
    ventilator_required nvarchar(max),
    total_beds_available int,
    beds_occupied int,
    icu_beds_available int,
    icu_beds_occupied int,
    oxygen_units_used int,
    department nvarchar(max), 
    readmission_within_30_days nvarchar(max)
);
GO

TRUNCATE TABLE gold.dim_dates;
GO

BULK INSERT gold.dim_dates
FROM 'C:\Users\yanso\OneDrive\Documents\Data Projects\Readmission and Capacity\gold.dim_dates.csv'
WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0D0A',
    FORMAT = 'CSV',
    FIELDQUOTE = '"',
    TABLOCK
);
GO

TRUNCATE TABLE gold.fact_visits;
GO

BULK INSERT gold.fact_visits
FROM 'C:\Users\yanso\OneDrive\Documents\Data Projects\Readmission and Capacity\gold.fact_visits.csv'
WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0D0A',
    FORMAT = 'CSV',
    FIELDQUOTE = '"',
    TABLOCK
);
GO
