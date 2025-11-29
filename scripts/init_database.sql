/*
================================================================================
Create Database and Schemas
================================================================================
Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database already exists, it is dropped and recreated. Additionally, the script sets up
    three schemas within the database: 'bronze', 'silver' and 'gold'.

WARNING:
    It works on DROP on any database called DataWarehouse, that means all of any old data will be
    deleted, proceed with caution.
*/


-- Create Database 'DataWarehouse'
USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the database
CREATE DATABASE DataWarehouse;

USE DataWarehouse;
GO


-- Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;