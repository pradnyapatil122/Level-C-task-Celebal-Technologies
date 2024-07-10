SELECT SubBand, 
       COUNT(EmployeeID) AS Headcount, 
       (COUNT(EmployeeID) / (SELECT COUNT(*) FROM YourTable)) * 100 AS Percentage_Headcount
FROM YourTable
GROUP BY SubBand;
