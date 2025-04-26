--Creating normalized Table in the database
--1) Create Table CSDTypeLookup

CREATE TABLE GA5_CSDTypeLookup (
    CSD_type_code INT IDENTITY(1,1) PRIMARY KEY,
    csd_type_name_en VARCHAR(100),
    csd_type_name_fr VARCHAR(100)
);

--2) Create Table ProvinceLookup

CREATE TABLE GA5_ProvinceLookup (
    PROV_CODE VARCHAR(50) PRIMARY KEY,
    Province_Abbreviation VARCHAR(25),
    Province_Name_en VARCHAR(100),
    Province_Name_fr VARCHAR(100)
);
 
 --3) Create Table BuildingUsageLookup

CREATE TABLE GA5_BuildingUsageLookup (
    BU_USE_code VARCHAR (50) PRIMARY KEY,
    BU_USE_EN VARCHAR(100),
    BU_USE_FR VARCHAR(100),
);

--4) Create Table Street

CREATE TABLE GA5_Street (
    Street_ID INT IDENTITY(1,1) PRIMARY KEY,
    OFFICIAL_STREET_NAME VARCHAR(100),
    OFFICIAL_STREET_TYPE VARCHAR(50),
    OFFICIAL_STREET_DIR VARCHAR(20)
);

--5) Create Table MailingAddress

CREATE TABLE GA5_MailingAddress (
    Mailing_ID INT IDENTITY(1,1) PRIMARY KEY,
    MAIL_STREET_NAME VARCHAR(100),
    MAIL_STREET_TYPE VARCHAR(50),
    MAIL_STREET_DIR VARCHAR(30),
    MAIL_MUN_NAME VARCHAR(100),
    MAIL_POSTAL_CODE VARCHAR(50),
    PROV_CODE VARCHAR(50),
    FOREIGN KEY (PROV_CODE) REFERENCES GA5_ProvinceLookup(PROV_CODE)
);

--6) Create Table LandSurvey

CREATE TABLE GA5_LandSurvey (
    Survey_ID INT IDENTITY(1,1) PRIMARY KEY,
    BG_DLS_LSD VARCHAR(50),
    BG_DLS_QTR VARCHAR(30),
    BG_DLS_SCTN VARCHAR(10),
    BG_DLS_TWNSHP VARCHAR(20),
    BG_DLS_RNG VARCHAR(10),
    BG_DLS_MRD VARCHAR(10)
);

--7) Create Table CensusSubdivision

CREATE TABLE GA5_CensusSubdivision (
    CSD_ID INT IDENTITY(1,1) PRIMARY KEY,
    CSD_ENG_NAME VARCHAR(100),
    CSD_FRE_NAME VARCHAR(100),
    csd_type_code INT,
    PROV_CODE VARCHAR(50),
    CONSTRAINT FK_CensusSubdivision_CSDTypeLookup FOREIGN KEY (csd_type_code) REFERENCES GA5_CSDTypeLookup(csd_type_code),
    CONSTRAINT FK_CensusSubdivision_ProvinceLookup FOREIGN KEY (PROV_CODE) REFERENCES GA5_ProvinceLookup(PROV_CODE)
);

--8) Create Table AddressUnit

CREATE TABLE GA5_AddressUnit (
    Address_ID INT IDENTITY(1,1) PRIMARY KEY,
    ADDR_GUID UNIQUEIDENTIFIER,
    LOC_GUID UNIQUEIDENTIFIER,
    APT_NO_LABEL VARCHAR(50),
    CIVIC_NO VARCHAR(20),
    CIVIC_NO_SUFFIX VARCHAR(20),
    BU_N_CIVIC_ADD VARCHAR(100),
    Street_ID INT,
    CSD_ID INT,
    BU_USE_code VARCHAR(50),
    CONSTRAINT FK_AddressUnit_Street FOREIGN KEY (Street_ID) REFERENCES GA5_Street(Street_ID),
    CONSTRAINT FK_AddressUnit_CensusSubdivision FOREIGN KEY (CSD_ID) REFERENCES GA5_CensusSubdivision(CSD_ID),
    CONSTRAINT FK_AddressUnit_BuildingUsage FOREIGN KEY (BU_USE_code) REFERENCES GA5_BuildingUsageLookup(BU_USE_code)
);

--9) Create Table Location

CREATE TABLE GA5_Location (
    Location_ID INT IDENTITY(1,1) PRIMARY KEY,
    LOC_GUID UNIQUEIDENTIFIER,
    REPOINT_LATITUDE FLOAT,
    REPOINT_LONGITUDE FLOAT,
    BG_X FLOAT,
    BG_Y FLOAT
);