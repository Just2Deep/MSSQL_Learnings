/*
Union and Union All
*/

-- Creating a new table for warehouse employees
CREATE TABLE WarehouseEmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50))

-- Inserting values to table 3
INSERT INTO WarehouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female');

-- Union (removes duplicate rows automatically)
SELECT *
FROM EmployeeDemographics
UNION
SELECT * 
FROM WarehouseEmployeeDemographics

-- Union All returns all rows regardless of duplicates
SELECT *
FROM EmployeeDemographics
UNION ALL
SELECT * 
FROM WarehouseEmployeeDemographics
ORDER BY EmployeeID;

-- For union the data types of both queries should be in same order.