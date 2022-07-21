/*
Group by, Order by
*/

-- Using Group By 
SELECT Gender, COUNT(Gender) AS Count 
FROM EmployeeDemographics
GROUP BY Gender;

--Using Order by
SELECT Gender, COUNT(Gender) AS Count 
FROM EmployeeDemographics
WHERE Age > 30
GROUP BY Gender
ORDER BY Gender DESC;

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC;

--Using col numbers rather than col names
SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC, 5 DESC;