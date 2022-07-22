/*
TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/

--Drop Table EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors;

-- Using Trim, LTRIM, RTRIM

SELECT EmployeeID , TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors;

SELECT EmployeeID , LTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors;

SELECT EmployeeID , RTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors;

-- Using Replace

SELECT LastName, REPLACE(LastName, '- Fired', '') AS LastNameFixed
FROM EmployeeErrors;

-- Using Substring

SELECT SUBSTRING(FirstName, 1, 3) AS FirstNameSub
FROM EmployeeErrors;

-- Making fuzzy match with substring
SELECT err.FirstName, SUBSTRING(err.FirstName, 1, 3), dem.FirstName, SUBSTRING(dem.FirstName,1 ,3)
FROM EmployeeErrors AS err
JOIN EmployeeDemographics AS dem
	ON SUBSTRING(err.FirstName, 1, 3) = SUBSTRING(dem.FirstName,1 ,3);

--Other columns for fuzzy match (DOB, Age, Gender, LastName)

-- Using UPPER and lower

SELECT FirstName, LOWER(FirstName)
FROM EmployeeErrors;

SELECT FirstName, UPPER(FirstName)
FROM EmployeeErrors;
-----------------------------------------

--Updating the values after using trim
UPDATE EmployeeErrors
SET EmployeeID = TRIM(EmployeeID);

SELECT *
FROM EmployeeErrors;
