# Write your MySQL query statement below
WITH CTE1 AS (
SELECT id, num, 
LAG(num) over (order by id) as prev_number,
LEAD(num) over (order by id) as next_number
FROM Logs as l
)
Select distinct num as ConsecutiveNums
FROM CTE1
where num = prev_number AND num = next_number