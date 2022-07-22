/*
Updating and Deleting Data
*/

SELECT *
FROM EmployeeDemographics;

-- Updating EmployeeID
UPDATE EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax';

-- Updating Age and Gender
UPDATE EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax';


-- Its better to use select statement query the data to be deleted before actually deleting it.
-- Example
SELECT *
FROM EmployeeDemographics
WHERE EmployeeID = 1013;

-- Delete statements for removing rows
DELETE FROM EmployeeDemographics
WHERE EmployeeID = 1013;