/*
Partition By
*/

-- Using partition by to add aggregate value of gender count to each row
SELECT FirstName, LastName, Age, Gender,
	COUNT(Gender) OVER (PARTITION BY Gender) AS GenderCount
FROM EmployeeDemographics
INNER JOIN EmployeeSalary 
	ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID ;

--doing the same in group by
SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
INNER JOIN EmployeeSalary 
	ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID 
GROUP BY Gender;
