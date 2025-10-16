-------CREATING SCHEMA Name Gold for Gold Layer-------

CREATE SCHEMA gold

-------CREATING VIEWS FOR EACH TABLE-------

CREATE VIEW gold.Calendar
AS
SELECT *
FROM OPENROWSET (
    BULK 'https://adventureworkdl.dfs.core.windows.net/silver/AdventureWorks_Calendar',
    FORMAT = 'parquet'
) AS Query1


CREATE VIEW gold.Customers
AS
SELECT *
FROM OPENROWSET (
    BULK 'https://adventureworkdl.dfs.core.windows.net/silver/AdventureWorks_Customers',
    FORMAT = 'parquet'
) AS Query1


CREATE VIEW gold.Product
AS
SELECT *
FROM OPENROWSET (
    BULK 'https://adventureworkdl.dfs.core.windows.net/silver/AdventureWorks_Product',
    FORMAT = 'parquet'
) AS Query1



CREATE VIEW gold.Product_Categories
AS
SELECT *
FROM OPENROWSET (
    BULK 'https://adventureworkdl.dfs.core.windows.net/silver/AdventureWorks_Product_Categories',
    FORMAT = 'parquet'
) AS Query1



CREATE VIEW gold.Returns
AS
SELECT *
FROM OPENROWSET (
    BULK 'https://adventureworkdl.dfs.core.windows.net/silver/AdventureWorks_Returns',
    FORMAT = 'parquet'
) AS Query1


CREATE VIEW gold.Sales
AS
SELECT *
FROM OPENROWSET (
    BULK 'https://adventureworkdl.dfs.core.windows.net/silver/AdventureWorks_Sales',
    FORMAT = 'parquet'
) AS Query1


CREATE VIEW gold.Territories
AS
SELECT *
FROM OPENROWSET (
    BULK 'https://adventureworkdl.dfs.core.windows.net/silver/AdventureWorks_Territories',
    FORMAT = 'parquet'
) AS Query1

