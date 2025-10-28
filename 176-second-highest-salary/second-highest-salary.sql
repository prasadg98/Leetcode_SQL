# Write your MySQL query statement below

WITH cte1 AS (
    SELECT 
        id, 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS D_rnk
    FROM Employee
)
SELECT 
    CASE 
        WHEN COUNT(*) > 0 THEN MAX(salary)
        ELSE NULL
    END AS SecondHighestSalary
FROM cte1
WHERE D_rnk = 2;


