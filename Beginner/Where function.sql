/*
Where 
= , <>, <, >, And, Or, Like, Null, Not Nul, In
*/

-- Using equal to
SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim';

-- Using not equal to
SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim';

-- Using greater than 
SELECT *
FROM EmployeeDemographics
WHERE Age >= 30;

-- Using lesser than
SELECT *
FROM EmployeeDemographics
WHERE Age <= 32;

-- Using And
SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male'; 

-- Using Or
SELECT *
FROM EmployeeDemographics
WHERE Age = 32 OR Gender = 'Female';

-- Using like and wildcard
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%o%';

-- Using WHERE and Null
SELECT *
FROM EmployeeDemographics
WHERE LastName is NULL;

-- Using WHERE and NotNull
SELECT *
FROM EmployeeDemographics
WHERE LastName is NOT NULL;

-- Using WHERE and IN
SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael', 'Kevin');