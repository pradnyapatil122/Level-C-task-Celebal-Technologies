SELECT BU, 
       MONTH, 
       SUM(Cost) AS Total_Cost, 
       SUM(Revenue) AS Total_Revenue, 
       SUM(Cost) / NULLIF(SUM(Revenue), 0) AS Cost_Revenue_Ratio
FROM YourTable
GROUP BY BU, MONTH;
