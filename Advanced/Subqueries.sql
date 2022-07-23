/*
Subqueries in (SELECT , FROM, WHERE)
*/

--Table we are going to use
SELECT *
FROM EmployeeSalary;

-- Subquery in Select
SELECT JobTitle, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AvgSalary
FROM EmployeeSalary;

-- How to do the same using partition by
SELECT JobTitle, Salary,  AVG(Salary) OVER () AS AvgSalary
FROM EmployeeSalary;

-- GROUP BY does not return expected average.
SELECT JobTitle, Salary,  AVG(Salary) AS AvgSalary
FROM EmployeeSalary
GROUP BY JobTitle, Salary
ORDER BY 1, 2;

-- Subquery in FROM
SELECT a.EmployeeID, a.AvgSalary
FROM (SELECT EmployeeID, Salary, AVG(Salary) OVER() AS AvgSalary
	  FROM EmployeeSalary) a;

-- Subquery in WHERE
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE EmployeeID IN (SELECT EmployeeID
					 FROM EmployeeDemographics 
					 WHERE Age > 30);