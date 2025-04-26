-- Populating the Table
--1) Insert into CSDTypeLookup

INSERT INTO GA5_CSDTypeLookup (csd_type_name_en, csd_type_name_fr)
SELECT DISTINCT
    CSD_TYPE_ENG_CODE, 
    CSD_TYPE_FRE_CODE
FROM GA5_Staging_NAR_Raw
WHERE CSD_TYPE_ENG_CODE IS NOT NULL;

--2) Insert into ProvinceLookup

INSERT INTO GA5_ProvinceLookup (
    PROV_CODE,
    Province_Abbreviation,
    Province_Name_en,
    Province_Name_fr
)
VALUES
(10, 'NL', 'Newfoundland and Labrador', 'Terre-Neuve-et-Labrador'),
(11, 'PE', 'Prince Edward Island', 'Île-du-Prince-Édouard'),
(12, 'NS', 'Nova Scotia', 'Nouvelle-Écosse'),
(13, 'NB', 'New Brunswick', 'Nouveau-Brunswick'),
(24, 'QC', 'Quebec', 'Québec'),
(35, 'ON', 'Ontario', 'Ontario'),
(46, 'MB', 'Manitoba', 'Manitoba'),
(47, 'SK', 'Saskatchewan', 'Saskatchewan'),
(48, 'AB', 'Alberta', 'Alberta'),
(59, 'BC', 'British Columbia', 'Colombie-Britannique'),
(60, 'YT', 'Yukon', 'Yukon'),
(61, 'NT', 'Northwest Territories', 'Territoires du Nord-Ouest'),
(62, 'NU', 'Nunavut', 'Nunavut');

--3) Insert into BuildingUsageLookup

INSERT INTO GA5_BuildingUsageLookup (
    BU_USE_code,
    BU_USE_EN,
    BU_USE_FR
)
VALUES
('1', 'Residential', 'Résidentiel'),
('2', 'Partial Residential', 'Résidentiel partiel'),
('3', 'Non Residential', 'Non résidentiel'),
('4', 'Unknown', 'Inconnu');

--4) Insert into Street

INSERT INTO GA5_Street (OFFICIAL_STREET_NAME, OFFICIAL_STREET_TYPE, OFFICIAL_STREET_DIR)
SELECT DISTINCT
    OFFICIAL_STREET_NAME,
    OFFICIAL_STREET_TYPE,
    OFFICIAL_STREET_DIR
FROM GA5_Staging_NAR_Raw
WHERE 
    OFFICIAL_STREET_NAME IS NOT NULL
    AND OFFICIAL_STREET_TYPE IS NOT NULL
    AND OFFICIAL_STREET_DIR IS NOT NULL;

--5) Insert into CensusSubdivision

INSERT INTO GA5_CensusSubdivision (
    CSD_ENG_NAME,
    CSD_FRE_NAME,
    csd_type_code,
    PROV_CODE
)
SELECT DISTINCT
    CSD_ENG_NAME,
    CSD_FRE_NAME,
    Null,  -- placeholder for csd_type_code
    PROV_CODE
FROM GA5_Staging_NAR_Raw
WHERE 
    CSD_ENG_NAME IS NOT NULL
    AND CSD_TYPE_ENG_CODE IS NOT NULL
    AND PROV_CODE IS NOT NULL;

--6) Insert into Location

INSERT INTO GA5_Location (LOC_GUID, REPOINT_LATITUDE, REPOINT_LONGITUDE, BG_X, BG_Y)
SELECT DISTINCT
    TRY_CAST(LOC_GUID AS UNIQUEIDENTIFIER),
    NULL, -- Placeholder for latitude
    NULL, -- Placeholder for longitude
    TRY_CAST(BG_X AS FLOAT),
    TRY_CAST(BG_Y AS FLOAT)
FROM GA5_Staging_NAR_Raw
WHERE LOC_GUID IS NOT NULL;

--7) Insert into LandSurvey

INSERT INTO GA5_LandSurvey (BG_DLS_LSD, BG_DLS_QTR, BG_DLS_SCTN, BG_DLS_TWNSHP, BG_DLS_RNG, BG_DLS_MRD)
SELECT DISTINCT
    BG_DLS_LSD,
    BG_DLS_QTR,
    BG_DLS_SCTN,
    BG_DLS_TWNSHP,
    BG_DLS_RNG,
    BG_DLS_MRD
FROM GA5_Staging_NAR_Raw
WHERE BG_DLS_LSD IS NOT NULL;

--8) Insert into AddressUnit

INSERT INTO GA5_AddressUnit (
    ADDR_GUID, LOC_GUID, APT_NO_LABEL, CIVIC_NO, CIVIC_NO_SUFFIX,
    BU_N_CIVIC_ADD, Street_ID, CSD_ID, BU_USE_code
)
SELECT DISTINCT
    TRY_CAST(ADDR_GUID AS UNIQUEIDENTIFIER),
    TRY_CAST(LOC_GUID AS UNIQUEIDENTIFIER),
    APT_NO_LABEL,
    CIVIC_NO,
    CIVIC_NO_SUFFIX,
    BU_N_CIVIC_ADD,
    NULL, -- Street_ID
    NULL, -- CSD_ID
    BU_USE
FROM GA5_Staging_NAR_Raw
WHERE 
    ADDR_GUID IS NOT NULL
    AND BU_USE IN (SELECT BU_USE_code FROM GA5_BuildingUsageLookup);

--9) INSERT INTO MailingAddress

INSERT INTO GA5_MailingAddress (
    MAIL_STREET_NAME,
    MAIL_STREET_TYPE,
    MAIL_STREET_DIR,
    MAIL_MUN_NAME,
    MAIL_POSTAL_CODE,
    PROV_CODE
)
SELECT DISTINCT
    MAIL_STREET_NAME,
    MAIL_STREET_TYPE,
    MAIL_STEET_DIR,
    MAIL_MUN_NAME,
    MAIL_POSTAL_CODE,
    PROV_CODE
FROM GA5_Staging_NAR_Raw
WHERE 
    MAIL_STREET_NAME IS NOT NULL
    AND MAIL_STREET_TYPE IS NOT NULL
    AND MAIL_STEET_DIR IS NOT NULL
    AND MAIL_MUN_NAME IS NOT NULL
    AND MAIL_POSTAL_CODE IS NOT NULL
    AND PROV_CODE IS NOT NULL;

--Few Tables need JOIN Updates to populate some of the data
--1) Update AddressUnit.Street_ID using Street

UPDATE AU
SET AU.Street_ID = S.Street_ID
FROM GA5_AddressUnit AU
JOIN GA5_Staging_NAR_Raw SR ON AU.ADDR_GUID = TRY_CAST(SR.ADDR_GUID AS UNIQUEIDENTIFIER)
JOIN GA5_Street S ON 
    SR.OFFICIAL_STREET_NAME = S.OFFICIAL_STREET_NAME AND
    SR.OFFICIAL_STREET_TYPE = S.OFFICIAL_STREET_TYPE AND
    SR.OFFICIAL_STREET_DIR = S.OFFICIAL_STREET_DIR;

--2)Update AddressUnit.CSD_ID using CensusSubdivision

UPDATE AU
SET AU.CSD_ID = CS.CSD_ID
FROM GA5_AddressUnit AU
JOIN GA5_Staging_NAR_Raw SR ON AU.ADDR_GUID = TRY_CAST(SR.ADDR_GUID AS UNIQUEIDENTIFIER)
JOIN GA5_CensusSubdivision CS ON 
    SR.CSD_ENG_NAME = CS.CSD_ENG_NAME AND
    SR.PROV_CODE = CS.PROV_CODE;

--3) Update CensusSubdivision.csd_type_code using CSDTypeLookup

UPDATE CS
SET csd_type_code = CT.CSD_type_code
FROM GA5_CensusSubdivision CS
JOIN GA5_Staging_NAR_Raw SR ON 
    CS.CSD_ENG_NAME = SR.CSD_ENG_NAME AND 
    CS.PROV_CODE = SR.PROV_CODE
JOIN GA5_CSDTypeLookup CT ON 
    SR.CSD_TYPE_ENG_CODE = CT.csd_type_name_en;