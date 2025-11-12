# Write your MySQL query statement below
WITH CTE AS (
SELECT c.name, count(*) AS cnt, dense_rank() over (order by count(*) desc) as dr
FROM Vote as v
LEFT JOIN Candidate as c
ON c.id = v.candidateID
GROUP BY c.name
)
Select name
FROM CTE
WHERE dr = 1