--------------------------------------------
       ------ Check database -----
--------------------------------------------
 SELECT name, database_id FROM sys.databases;

--------------------------------------------
      ------ Create Master Key----
--------------------------------------------
CREATE MASTER KEY ENCRYPTION BY PASSWORD ='Thisyear@2025' 

--------------------------------------------
    -----Checking if master key exist----
--------------------------------------------
SELECT * 
FROM sys.symmetric_keys
WHERE name = '##MS_DatabaseMasterKey##';

--------------------------------------------
       ----- To Open Master Key------
--------------------------------------------
OPEN MASTER KEY DECRYPTION BY PASSWORD = 'Thisyear@2025';


CREATE DATABASE SCOPED CREDENTIAL cread_adven
WITH IDENTITY = 'Managed Identity'

--------------------------------------------
      ----Check credentials-----
--------------------------------------------
 SELECT * 
FROM sys.database_scoped_credentials;

CREATE EXTERNAL DATA SOURCE source_silver
WITH (
    LOCATION = 'https://adventureworkdl.blob.core.windows.net/silver',
    CREDENTIAL = cread_adven
);

CREATE EXTERNAL DATA SOURCE dest_gold
WITH (
    LOCATION = 'https://adventureworkdl.blob.core.windows.net/gold',
    CREDENTIAL = cread_adven
);


--------------------------------------------
     ----- Creating file format------
--------------------------------------------
CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

--------------------------------------------
----- Creating External Table EXTSales -----
--------------------------------------------
CREATE EXTERNAL TABLE gold.extsales
WITH
( 
    LOCATION = 'extsales',
    DATA_SOURCE = dest_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.Sales

SELECT * FROM gold.extsales

--------------------------------------------
      -----Checking Schema Table-----
--------------------------------------------
SELECT *
FROM INFORMATION_SCHEMA.TABLES




