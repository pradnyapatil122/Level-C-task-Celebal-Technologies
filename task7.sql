WITH RECURSIVE PrimeNumbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1
    FROM PrimeNumbers
    WHERE num < 1000
),
PrimeFilter AS (
    SELECT num
    FROM PrimeNumbers pn1
    WHERE NOT EXISTS (
        SELECT 1
        FROM PrimeNumbers pn2
        WHERE pn2.num < pn1.num AND pn1.num % pn2.num = 0
    )
)
SELECT STRING_AGG(CAST(num AS VARCHAR), '&') AS primes
FROM PrimeFilter
OPTION (MAXRECURSION 0);