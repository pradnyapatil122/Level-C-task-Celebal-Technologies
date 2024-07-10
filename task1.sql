WITH ProjectGroups AS (
    SELECT Task_ID, 
           Start_Date, 
           End_Date,
           ROW_NUMBER() OVER (ORDER BY Start_Date) - ROW_NUMBER() OVER (PARTITION BY Start_Date ORDER BY Task_ID) AS grp
    FROM Projects
)
SELECT MIN(Start_Date) AS Project_Start, 
       MAX(End_Date) AS Project_End
FROM ProjectGroups
GROUP BY grp
ORDER BY DATEDIFF(day, MIN(Start_Date), MAX(End_Date)), MIN(Start_Date);