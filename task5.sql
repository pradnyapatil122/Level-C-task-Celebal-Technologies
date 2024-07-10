WITH DailySubmissions AS (
    SELECT submission_date, 
           hacker_id, 
           COUNT(submission_id) AS submission_count,
           ROW_NUMBER() OVER (PARTITION BY submission_date ORDER BY COUNT(submission_id) DESC, hacker_id) AS rn
    FROM Submissions
    GROUP BY submission_date, hacker_id
),
DailyUniqueHackers AS (
    SELECT submission_date, 
           COUNT(DISTINCT hacker_id) AS unique_hackers
    FROM Submissions
    GROUP BY submission_date
)
SELECT D1.submission_date, 
       D2.unique_hackers, 
       D1.hacker_id, 
       H.name
FROM DailySubmissions D1
JOIN Hackers H ON D1.hacker_id = H.hacker_id
JOIN DailyUniqueHackers D2 ON D1.submission_date = D2.submission_date
WHERE D1.rn = 1
ORDER BY D1.submission_date;