**﻿Address Normalization and ETL Project**

**Project Overview**

This project focuses on designing and implementing an ETL pipeline to transform raw address data into a fully normalized relational database following 1NF through 3NF principles. Using SQL Server, raw CSV files were staged, cleaned, and systematically populated into a normalized schema comprising lookup, dimension, and relational tables.
The primary goal was to ensure data integrity, eliminate redundancy, enforce referential relationships, and prepare the address data for efficient querying and reporting.

**Source of Data**

The raw data for the National Address Registry was obtained from:
Statistics Canada - National Address Register
https://www150.statcan.gc.ca/n1/pub/46-26-0002/462600022022001-eng.htm
The data was provided in CSV format and includes detailed civic address attributes and related geographic information.

**Technologies Used**

•	SQL Server 2019
•	SQL Server Management Studio (SSMS)

**Folder Structure**

AddressNormalizationProject/
├── README.md
├── ERD.png                   # Entity Relationship Diagram (optional)
├── Create_Tables.sql          # DDL scripts to create normalized tables
├── Insert_Statements.sql      # DML scripts to insert distinct data
├── Staging_Table.sql     # DDL and DML to create staging table

**Key Features**

•	ETL process including data staging, cleaning, and transformation
•	Full database normalization (1NF to 3NF)
•	Separation of lookup tables, dimension tables, and relationships
•	Bulk Insert usage for handling large CSV files
•	Complex UPDATE JOIN queries to populate foreign keys
•	Integrity maintained using primary keys and foreign key constraints

**Database Schema Overview**

•	ProvinceLookup
•	CSDTypeLookup
•	BuildingUsageLookup
•	CensusSubdivision
•	Street
•	MailingAddress
•	AddressUnit
•	Location
•	LandSurvey
(Entity-Relationship Diagram provided in ERD.png)

**How to Run This Project**

1.  Download all CSV files from the Statistics Canada National Address Register and save them to the C: drive on your local machine.
2.	Create a new SQL Server database.
3.	Execute Create_Tables.sql to create all normalized tables.
4.	Use the Staging_Table.sql script to create the staging table, and perform a bulk insert of the data from the downloaded CSV files into the Staging_NAR_Raw table.
5.	Run Insert_Statements.sql to populate dimension and lookup tables.
6.	Validate data integrity through sample queries and foreign key checks.
    
**Credits**

This project uses publicly available data provided by Statistics Canada and is intended for academic and learning purposes.

Author-Neetika Upadhyay
