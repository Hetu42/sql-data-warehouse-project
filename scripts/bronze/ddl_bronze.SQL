USE DataWarehouse;
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @batch_start_time DATETIME,
        @batch_end_time   DATETIME,
        @start_time       DATETIME,
        @end_time         DATETIME;

    BEGIN TRY
        /* ================= BATCH START ================= */
        SET @batch_start_time = GETDATE();

        PRINT '============================================';
        PRINT 'Loading Bronze Layer';
        PRINT 'Batch Start Time: ' + CONVERT(VARCHAR, @batch_start_time, 120);
        PRINT '============================================';

        /* ================= CRM TABLES ================= */

        PRINT '--- Loading CRM Tables ---';

        -- CRM Customer
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> Inserting Data Into: bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM '/var/opt/mssql/data/cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n'
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration (sec): ' +
              CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);
        PRINT '-----------------------------';

        -- CRM Product
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> Inserting Data Into: bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM '/var/opt/mssql/data/prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n'
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration (sec): ' +
              CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);
        PRINT '-----------------------------';

        -- CRM Sales
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> Inserting Data Into: bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM '/var/opt/mssql/data/sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n'
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration (sec): ' +
              CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);
        PRINT '-----------------------------';

        /* ================= ERP TABLES ================= */

        PRINT '--- Loading ERP Tables ---';

        -- ERP Location
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM '/var/opt/mssql/data/LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n'
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration (sec): ' +
              CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);
        PRINT '-----------------------------';

        -- ERP Customer
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM '/var/opt/mssql/data/CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n'
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration (sec): ' +
              CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);
        PRINT '-----------------------------';

        -- ERP Product Category
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM '/var/opt/mssql/data/PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n'
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration (sec): ' +
              CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);
        PRINT '-----------------------------';

        /* ================= BATCH END ================= */

        SET @batch_end_time = GETDATE();
        PRINT '============================================';
        PRINT 'Bronze Load Completed Successfully';
        PRINT 'Batch End Time: ' + CONVERT(VARCHAR, @batch_end_time, 120);
        PRINT 'Total Duration (sec): ' +
              CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS VARCHAR);
        PRINT '============================================';

    END TRY
    BEGIN CATCH
        PRINT '❌ ERROR DURING BRONZE LOAD';
        PRINT ERROR_MESSAGE();
        THROW;
    END CATCH
END;
GO
