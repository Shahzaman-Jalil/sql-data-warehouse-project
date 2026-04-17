/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `COPY` command to load data from CSV files to bronze tables.
    - Calculates and displays the load duration for each table and the entire batch.

Parameters:
    None. 
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    CALL bronze.load_bronze();
===============================================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE 
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    batch_start_time TIMESTAMP;
    batch_end_time TIMESTAMP;
BEGIN
    batch_start_time := clock_timestamp();

    BEGIN
        RAISE NOTICE '=================================================';
        RAISE NOTICE 'Loading Bronze Layer';
        RAISE NOTICE '==================================================';

        RAISE NOTICE '---------------------------------------------------';
        RAISE NOTICE 'Loading CRM Tables';
        RAISE NOTICE '----------------------------------------------------';

        -- crm_cust_info
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;
        RAISE NOTICE '>> Inserting Data Into: bronze.crm_cust_info';
        COPY bronze.crm_cust_info FROM 'D:/sql-data-warehouse-project/datasets/source_crm/cust_info.csv' WITH (FORMAT CSV, HEADER true, DELIMITER ',', ENCODING 'UTF8');
        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '----------------------------------------------------------';

        -- crm_prd_info
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;
        RAISE NOTICE '>> Inserting Data Into: bronze.crm_prd_info';
        COPY bronze.crm_prd_info FROM 'D:/sql-data-warehouse-project/datasets/source_crm/prd_info.csv' WITH (FORMAT CSV, HEADER true, DELIMITER ',', ENCODING 'UTF8');
        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '----------------------------------------------------------';

        -- crm_sales_details
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;
        RAISE NOTICE '>> Inserting Data Into: bronze.crm_sales_details';
        COPY bronze.crm_sales_details FROM 'D:/sql-data-warehouse-project/datasets/source_crm/sales_details.csv' WITH (FORMAT CSV, HEADER true, DELIMITER ',', ENCODING 'UTF8');
        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '----------------------------------------------------------';

        RAISE NOTICE '---------------------------------------------------';
        RAISE NOTICE 'Loading ERP Tables';
        RAISE NOTICE '----------------------------------------------------';

        -- erp_cust_az12
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;
        RAISE NOTICE '>> Inserting Data Into: bronze.erp_cust_az12';
        COPY bronze.erp_cust_az12 FROM 'D:/sql-data-warehouse-project/datasets/source_erp/cust_az12.csv' WITH (FORMAT CSV, HEADER true, DELIMITER ',', ENCODING 'UTF8');
        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '----------------------------------------------------------';

        -- erp_loc_a101
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;
        RAISE NOTICE '>> Inserting Data Into: bronze.erp_loc_a101';
        COPY bronze.erp_loc_a101 FROM 'D:/sql-data-warehouse-project/datasets/source_erp/loc_a101.csv' WITH (FORMAT CSV, HEADER true, DELIMITER ',', ENCODING 'UTF8');
        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '----------------------------------------------------------';

        -- erp_px_cat_g1v2
        start_time := clock_timestamp();
        RAISE NOTICE '>> Truncating Table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        RAISE NOTICE '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
        COPY bronze.erp_px_cat_g1v2 FROM 'D:/sql-data-warehouse-project/datasets/source_erp/px_cat_g1v2.csv' WITH (FORMAT CSV, HEADER true, DELIMITER ',', ENCODING 'UTF8');
        end_time := clock_timestamp();
        RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));
        RAISE NOTICE '----------------------------------------------------------';

        batch_end_time := clock_timestamp();
        RAISE NOTICE '=========================================================';
        RAISE NOTICE 'Total Batch Duration: % seconds', EXTRACT(EPOCH FROM (batch_end_time - batch_start_time));
        RAISE NOTICE '=========================================================';

    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE '================================';
            RAISE NOTICE 'ERROR OCCURED DURING LOADING BRONZE LAYER';
            RAISE NOTICE 'ERROR MESSAGE: %', SQLERRM;
            RAISE NOTICE 'ERROR STATE: %', SQLSTATE;
            RAISE NOTICE '================================';
    END;
END;
$$;
