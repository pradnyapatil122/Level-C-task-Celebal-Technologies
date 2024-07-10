WITH ContestStats AS (
    SELECT C.contest_id, 
           C.hacker_id, 
           C.name,
           COALESCE(SUM(V.total_views), 0) AS total_views,
           COALESCE(SUM(V.total_unique_views), 0) AS total_unique_views,
           COALESCE(SUM(S.total_submissions), 0) AS total_submissions,
           COALESCE(SUM(S.total_accepted_submissions), 0) AS total_accepted_submissions
    FROM Contests C
    LEFT JOIN Challenges H ON C.contest_id = H.contest_id
    LEFT JOIN View_Stats V ON H.challenge_id = V.challenge_id
    LEFT JOIN Submission_Stats S ON H.challenge_id = S.challenge_id
    GROUP BY C.contest_id, C.hacker_id, C.name
)
SELECT contest_id, hacker_id, name, total_views, total_unique_views, total_submissions, total_accepted_submissions
FROM ContestStats
WHERE total_views != 0 OR total_unique_views != 0 OR total_submissions != 0 OR total_accepted_submissions != 0
ORDER BY contest_id;
