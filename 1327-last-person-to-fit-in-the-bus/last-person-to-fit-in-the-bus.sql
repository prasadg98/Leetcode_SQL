# Write your MySQL query statement below
WITH CTE1 AS (
SELECT 
    person_name,
    weight,
    turn,
    SUM(weight) OVER (
        ORDER BY turn
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_sum_weight
FROM Queue
)
Select person_name from CTE1
WHERE running_sum_weight <= 1000
ORDER by running_sum_weight DESC
LIMIT 1