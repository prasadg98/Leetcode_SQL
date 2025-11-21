# Write your MySQL query statement below
WITH CTE1 AS(
SELECT requester_id as id,
accept_date
FROM RequestAccepted
UNION ALL
SELECT accepter_id as id,
accept_date
FROM RequestAccepted
)
SELECT id, COUNT(*) as num
FROM CTE1
GROUP BY id
ORDER by num desc
limit 1