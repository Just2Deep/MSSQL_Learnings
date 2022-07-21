/* 
Select Statement
*, Top, Distinct, Count, As, Max, Min, Avg
*/

-- Retriving all rows and columns
SELECT *
FROM EmployeeDemographics;

-- Retriving all rows of specified columns
SELECT EmployeeID, FirstName, LastName, Age, Gender
FROM EmployeeDemographics;

-- Retriving the TOP Number of rows 
SELECT TOP 5 *
FROM EmployeeDemographics;

-- Retriving only distinct values
SELECT DISTINCT(Gender)
FROM EmployeeDemographics;

-- Retriving count of a specific column(non empty values) and using AS for aliasing
SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics;

-- Retriving the max data of a required column
SELECT MAX(Salary) AS MaxSalary
FROM EmployeeSalary;

-- Retriving the min data of a required column
SELECT MIN(Salary) AS MinSalary
FROM EmployeeSalary;

-- Retriving the avg data of a required column
SELECT AVG(Salary) AS AvgSalary
FROM EmployeeSalary;

-- FROM statement (adding Database and Table name in master DB)
SELECT *
FROM Beginner.dbo.EmployeeDemographics;