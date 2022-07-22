/*
CASE statement
*/

-- using case for creating age groups
SELECT FirstName, LastName, Age,
CASE 
	WHEN Age BETWEEN 30 AND 35 THEN 'Middle Age'
	WHEN Age >= 35 THEN 'Old'
	ELSE 'Young'
END AS AgeGroup
FROM EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age;

--Using case for giving different raises.

SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * 0.10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * 0.05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * 0.01)
	ELSE Salary + (Salary * 0.03)
END AS SalaryAfterRaise
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
ORDER BY FirstName;