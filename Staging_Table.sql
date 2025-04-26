--Creating Staging table Staging_NAR_Raw

CREATE TABLE GA5_Staging_NAR_Raw (
    LOC_GUID UNIQUEIDENTIFIER,
    ADDR_GUID UNIQUEIDENTIFIER,
    APT_NO_LABEL VARCHAR(255),
    CIVIC_NO VARCHAR(255),
	CIVIC_NO_SUFFIX VARCHAR(255),
    OFFICIAL_STREET_NAME VARCHAR(255),
    OFFICIAL_STREET_TYPE VARCHAR(255),
    OFFICIAL_STREET_DIR VARCHAR(255),
    PROV_CODE VARCHAR(255),
    CSD_ENG_NAME VARCHAR(255),
    CSD_FRE_NAME VARCHAR(255),
    CSD_TYPE_ENG_CODE VARCHAR(255),
    CSD_TYPE_FRE_CODE VARCHAR(255),
    MAIL_STREET_NAME VARCHAR(255),
    MAIL_STREET_TYPE VARCHAR(255),
    MAIL_STEET_DIR VARCHAR(255),
    MAIL_MUN_NAME VARCHAR(255),
    MAIL_PROV_ABVN VARCHAR(255),
    MAIL_POSTAL_CODE VARCHAR(255),
    BG_DLS_LSD VARCHAR(255),
    BG_DLS_QTR VARCHAR(255),
    BG_DLS_SCTN VARCHAR(255),
    BG_DLS_TWNSHP VARCHAR(255),
    BG_DLS_RNG VARCHAR(255),
    BG_DLS_MRD VARCHAR(255),
    BG_X VARCHAR(255),
    BG_Y VARCHAR(255),
    BU_N_CIVIC_ADD VARCHAR(255),
    BU_USE VARCHAR(255)
);

--Inserting data from raw tables to staging table
--Inserting from CSV file 1

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_10.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 2

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_11.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 3

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_12.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 4

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_13.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 5

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_24_part_1.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 6

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_24_part_1.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 7

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_24_part_2.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 8

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_24_part_3.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 9

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_24_part_4.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 10

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_24_part_5.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 11

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_35_part_1.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 12

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_35_part_2.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 13

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_35_part_3.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 14

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_35_part_4.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 15

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_35_part_5.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 16

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_35_part_6.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 17

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_35_part_7.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 18

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_46.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 19

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_47.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 20

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_48_part_1.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 21

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_48_part_2.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 22

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_59_part_1.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 23

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_59_part_2.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 24

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_59_part_3.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 25

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_60.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 26

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_61.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

--Inserting from CSV file 27

BULK INSERT GA5_Staging_NAR_Raw
FROM 'c:\cst2112_data\ga5_NAR\Address_62.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);