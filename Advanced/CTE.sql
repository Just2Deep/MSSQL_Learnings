/*
Common Table Expressions(CTE)
*/

--Using CTE (it creates a table in runtime and is not stored anywhere, so it has be run with CTE statement)

WITH CTE_Employee AS
( SELECT FirstName, LastName, Gender, Salary,
 COUNT(Gender) OVER (PARTITION BY Gender) AS GenderCount,
 AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
 FROM EmployeeDemographics 
 INNER JOIN EmployeeSalary 
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE Salary > 45000
)
SELECT FirstName, Salary 
FROM CTE_Employee;