WITH Actual AS (
    SELECT AVG(Salary) AS ActualAvgSalary
    FROM Employees
),
Miscalculated AS (
    SELECT AVG(CAST(REPLACE(CAST(Salary AS VARCHAR), '0', '') AS INT)) AS MiscalculatedAvgSalary
    FROM Employees
)
SELECT CEILING(Actual.ActualAvgSalary - Miscalculated.MiscalculatedAvgSalary) AS ErrorAmount
FROM Actual, Miscalculated;