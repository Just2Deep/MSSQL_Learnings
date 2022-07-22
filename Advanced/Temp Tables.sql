/*
Temp Tables
*/

--First Temp Table
CREATE TABLE #Temp_Employee
(EmployeeID int,
JobTitle varchar(50),
Salary int);

INSERT INTO #Temp_Employee VALUES
(1001, 'HR', 45000);

SELECT *
FROM #Temp_Employee;

-- Insert data to temp table from another table
INSERT INTO #Temp_Employee
SELECT *
FROM EmployeeSalary;

-- Deleting an extra row 
DELETE FROM #Temp_Employee
WHERE JobTitle = 'HR' AND EmployeeID = 1001;

--Creating Temp Table 2 (Dropping table if it already exists so procedure can be run multiple times)
DROP TABLE IF EXISTS #Temp_Employee2
CREATE TABLE #Temp_Employee2(
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int);

-- Inserting data into temp table 2
INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle) , AVG(Age), AVG(Salary)
FROM EmployeeDemographics
INNER JOIN EmployeeSalary 
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
ORDER BY AVG(Salary)

-- SELECT from temp table 2
SELECT * 
FROM #Temp_Employee2;