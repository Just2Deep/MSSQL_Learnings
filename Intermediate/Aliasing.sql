/*
Aliasing
*/

-- Using a temporary name by alias
SELECT FirstName AS FIRST_NAME
FROM EmployeeDemographics;

-- Combining columns and aliasing it
SELECT FirstName + ' ' + LastName AS FullName
FROM EmployeeDemographics;

-- Aliasing Aggregate functions
SELECT AVG(Age) AS AvgAge
FROM EmployeeDemographics;

-- Aliasing table names
SELECT Demo.FirstName, Sal.Salary
FROM EmployeeDemographics AS Demo
INNER JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID;
