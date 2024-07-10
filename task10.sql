WITH LeadManagerCount AS (
    SELECT company_code, COUNT(DISTINCT lead_manager_code) AS total_lead_managers
    FROM Lead_Manager
    GROUP BY company_code
),
SeniorManagerCount AS (
    SELECT company_code, COUNT(DISTINCT senior_manager_code) AS total_senior_managers
    FROM Senior_Manager
    GROUP BY company_code
),
ManagerCount AS (
    SELECT company_code, COUNT(DISTINCT manager_code) AS total_managers
    FROM Manager
    GROUP BY company_code
),
EmployeeCount AS (
    SELECT company_code, COUNT(DISTINCT employee_code) AS total_employees
    FROM Employee
    GROUP BY company_code
)
SELECT C.company_code, 
       C.founder, 
       COALESCE(LM.total_lead_managers, 0) AS total_lead_managers,
       COALESCE(SM.total_senior_managers, 0) AS total_senior_managers,
       COALESCE(M.total_managers, 0) AS total_managers,
       COALESCE(E.total_employees, 0) AS total_employees
FROM Company C
LEFT JOIN LeadManagerCount LM ON C.company_code = LM.company_code
LEFT JOIN SeniorManagerCount SM ON C.company_code = SM.company_code
LEFT JOIN ManagerCount M ON C.company_code = M.company_code
LEFT JOIN EmployeeCount E ON C.company_code = E.company_code
ORDER BY C.company_code;
