SELECT
    JobFamily,
    SUM(CASE WHEN Country = 'India' THEN Cost ELSE 0 END) AS India_Cost,
    SUM(CASE WHEN Country = 'International' THEN Cost ELSE 0 END) AS International_Cost,
    (SUM(CASE WHEN Country = 'India' THEN Cost ELSE 0 END) / NULLIF(SUM(Cost), 0)) * 100 AS India_Percentage,
    (SUM(CASE WHEN Country = 'International' THEN Cost ELSE 0 END) / NULLIF(SUM(Cost), 0)) * 100 AS International_Percentage
FROM YourTable
GROUP BY JobFamily;