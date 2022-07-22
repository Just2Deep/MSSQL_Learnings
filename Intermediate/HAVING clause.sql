/*
HAVING Clause
*/

-- Using having for conditions in aggregates
SELECT JobTitle, COUNT(JobTitle) AS JobTitleCount
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1;

-- Same as one above but a different field
SELECT JobTitle, AVG(Salary) AS AvgSalary
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY JobTitle;

-- ORDER BY should always be last and HAVING should be after GROUP BY