/*
====================================================
Create Database and Schemas
====================================================

Script Purpose:
    This script creates a new database named 'datawarehouse'
    and sets up three schemas: 'bronze', 'silver', and 'gold'.

    - bronze: Raw data (as-is from source)
    - silver: Cleaned and transformed data
    - gold: Final business-ready data (fact & dimension tables)
====================================================
*/

/*
WARNING:
    Ensure you are connected to the correct database before running 
    this script to avoid creating schemas in the wrong location.
*/

-- Step 1: Create Database (Run this separately if not already created)
-- CREATE DATABASE datawarehouse;

-- Step 2: Connect to database (For psql/command line users)
-- \c datawarehouse;

-- =========================
-- Create Schemas (Medallion Architecture)
-- =========================

CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
