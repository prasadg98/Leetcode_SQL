# Write your MySQL query statement below

WITH CTE1 AS (
    SELECT name,
    continent,
    row_number() over (partition by continent order by name asc) as rn
    FROM Student
)
select 
MAX(CASE WHEN continent = 'America' then name END) as America,
MAX(CASE WHEN continent = 'Asia' then name END) as Asia,
MAX(CASE WHEN continent = 'Europe' then name END) as Europe
FROM CTE1
GROUP BY rn


