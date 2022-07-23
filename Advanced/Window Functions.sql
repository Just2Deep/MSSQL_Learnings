/*
Window functions OVER, ROW_NUMBER, RANK, DENSE_RANK
*/
--Updating Data
UPDATE EmployeeSalary
SET Salary = 48000
WHERE EmployeeID = 1001

--Using OVER 
SELECT *, MAX(Salary) OVER (PARTITION BY JobTitle) AS MaxSalary
FROM EmployeeSalary
ORDER BY JobTitle;

--Using ROW_NUMBER
SELECT *, ROW_NUMBER() OVER(PARTITION BY JobTitle ORDER BY EmployeeID) AS RowNumber
FROM EmployeeSalary;

--Fetching first 2 RowNumber 
SELECT * 
FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY JobTitle ORDER BY EmployeeID) AS RowNumber
	FROM EmployeeSalary) AS X
WHERE X.RowNumber <= 2;

-- Using RANK to fetch top 2 salary in each dept
SELECT *
FROM (SELECT *,
	RANK() OVER(PARTITION BY JobTitle ORDER BY Salary DESC) AS RankCol
	FROM EmployeeSalary) AS X
WHERE X.RankCol <= 3;

--Using DENSE_RANK to fetch records
SELECT *
FROM ( SELECT *,
	   DENSE_RANK() OVER(PARTITION BY JobTitle ORDER BY Salary DESC) AS DenseRank
	   FROM EmployeeSalary) AS X
WHERE X.DenseRank <= 3;

-- Using all the 3 row, rank and dense_rank 
SELECT *,
RANK() OVER(PARTITION BY JobTitle ORDER BY Salary DESC) AS RankCol,
DENSE_RANK() OVER(PARTITION BY JobTitle ORDER BY Salary DESC) AS DenseRank,
ROW_NUMBER() OVER(PARTITION BY JobTitle ORDER BY Salary DESC) AS RowNumber
FROM EmployeeSalary 

-- Rank will skip a value if there is a duplicate where as DenseRank will not skip
-- Row Number will add a new value to each row even if comparing value is same.

--Using LEAD and LAG
SELECT *,
LAG(Salary, 1, 0) OVER(PARTITION BY JobTitle ORDER BY Salary) AS PrevEmpSalary,
LEAD(Salary, 1, 0) OVER(PARTITION BY JobTitle ORDER BY Salary) AS NextEmpSalary
FROM EmployeeSalary;

-- Creating a case to return if salary is higher than previous employee 
SELECT *,
LAG(Salary, 1, 0) OVER(PARTITION BY JobTitle ORDER BY Salary) AS PrevEmpSalary,
CASE WHEN EmpSal.Salary > LAG(Salary) OVER(PARTITION BY JobTitle ORDER BY Salary) THEN 'Higher'
	 WHEN EmpSal.Salary < LAG(Salary) OVER(PARTITION BY JobTitle ORDER BY Salary) THEN 'Lower'
	 WHEN EmpSal.Salary = LAG(Salary) OVER(PARTITION BY JobTitle ORDER BY Salary) THEN 'Same'
END AS Comparison
FROM EmployeeSalary AS EmpSal;

