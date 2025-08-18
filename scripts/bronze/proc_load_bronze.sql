/*
===================
MySQL Script: Load Bronze Layer.
===================
Script Purpose:
    This script loads data into the bronze tables from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses LOAD DATA LOCAL INFILE to load data from CSV files to bronze tables.
    - Provides Table name and Raw count information.
Parameters:
    None.This stored procedure does not return any values.
Usage:
    Execute this entire script in MySQL Workbench
===================
*/
-- Clear CRM bronze tables and import data


TRUNCATE TABLE DataWarehouse.bronze_crm_cust_info;
LOAD DATA LOCAL INFILE 'C:/Users/priya/OneDrive/Desktop/SQL Project 2025/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
INTO TABLE DataWarehouse.bronze_crm_cust_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(cst_id, cst_key, cst_firstname, cst_lastname, cst_marital_status, cst_gndr, cst_create_date);

TRUNCATE TABLE DataWarehouse.bronze_crm_prd_info;
LOAD DATA LOCAL INFILE 'C:/Users/priya/OneDrive/Desktop/SQL Project 2025/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
INTO TABLE DataWarehouse.bronze_crm_prd_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(prd_id, prd_key, prd_nm, prd_cost, prd_line, prd_start_dt, prd_end_dt);

TRUNCATE TABLE DataWarehouse.bronze_crm_sales_details;
LOAD DATA LOCAL INFILE 'C:/Users/priya/OneDrive/Desktop/SQL Project 2025/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
INTO TABLE DataWarehouse.bronze_crm_sales_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(sls_ord_num, sls_prd_key, sls_cust_id, sls_order_dt, sls_ship_dt, sls_due_dt, sls_sales, sls_quantity, sls_price);



-- Clear ERP bronze tables and import data


TRUNCATE TABLE DataWarehouse.bronze_erp_loc_a101;
LOAD DATA LOCAL INFILE 'C:/Users/priya/OneDrive/Desktop/SQL Project 2025/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
INTO TABLE DataWarehouse.bronze_erp_loc_a101
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(cid, cntry);

TRUNCATE TABLE DataWarehouse.bronze_erp_cust_az12;
LOAD DATA LOCAL INFILE 'C:/Users/priya/OneDrive/Desktop/SQL Project 2025/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
INTO TABLE DataWarehouse.bronze_erp_cust_az12
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(cid, bdate, gen);

TRUNCATE TABLE DataWarehouse.bronze_erp_px_cat_g1v2;
LOAD DATA LOCAL INFILE 'C:/Users/priya/OneDrive/Desktop/SQL Project 2025/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
INTO TABLE DataWarehouse.bronze_erp_px_cat_g1v2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id, cat, subcat, maintenance);


-- Display record counts for validation


SELECT 
    'bronze_crm_cust_info' AS Table_name, COUNT(*) AS Row_count FROM DataWarehouse.bronze_crm_cust_info
UNION ALL
SELECT 'bronze_crm_prd_info', COUNT(*) FROM DataWarehouse.bronze_crm_prd_info
UNION ALL
SELECT 'bronze_crm_sales_details', COUNT(*) FROM DataWarehouse.bronze_crm_sales_details
UNION ALL
SELECT 'bronze_erp_loc_a101', COUNT(*) FROM DataWarehouse.bronze_erp_loc_a101
UNION ALL
SELECT 'bronze_erp_cust_az12', COUNT(*) FROM DataWarehouse.bronze_erp_cust_az12
UNION ALL
SELECT 'bronze_erp_px_cat_g1v2', COUNT(*) FROM DataWarehouse.bronze_erp_px_cat_g1v2;

