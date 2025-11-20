# Write your MySQL query statement below

WITH CTE1 as (
SELECT *,
LEAD(id) OVER (ORDER by id) AS next,
LAG(id) OVER (ORDER by id) as prev
FROM Seat
)

SELECT 
CASE WHEN id % 2 = 1 and next IS NOT NULL then next
WHEN id % 2 = 0 then prev
ELSE id END as id,
student
FROM CTE1
order by id