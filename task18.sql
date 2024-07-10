SELECT BU, 
       AVG(Cost * Weight) / SUM(Weight) AS WeightedAvgCost
FROM Employees1
GROUP BY BU;