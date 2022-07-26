USE [Beginner]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee]    Script Date: 23-07-2022 08:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Temp_Employee] 
@JobTitle nvarchar(50)
AS
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
WHERE JobTitle = @JobTitle
GROUP BY JobTitle
ORDER BY AVG(Salary)

-- SELECT from temp table 2
SELECT * 
FROM #Temp_Employee3;