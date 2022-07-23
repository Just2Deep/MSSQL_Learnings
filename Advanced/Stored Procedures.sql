/*
Stored Procedure
*/

-- First Procedure
CREATE PROCEDURE TEST AS
SELECT *
FROM EmployeeDemographics;

EXEC TEST;

-- Second Procedure (We can parameters in the procedure while executing the procedure)
CREATE PROCEDURE Temp_Employee AS
CREATE TABLE #Temp_Employee3(
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #Temp_Employee3
SELECT JobTitle, COUNT(JobTitle) , AVG(Age), AVG(Salary)
FROM EmployeeDemographics
INNER JOIN EmployeeSalary 
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
ORDER BY AVG(Salary)

-- SELECT from temp table 2
SELECT * 
FROM #Temp_Employee3;

EXEC Temp_Employee @JobTitle = 'Salesman'