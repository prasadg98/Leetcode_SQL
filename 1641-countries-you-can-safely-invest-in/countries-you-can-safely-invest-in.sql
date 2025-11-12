# Write your MySQL query statement below

WITH CallsCTE AS (
    SELECT caller_id as id, duration
    FROM Calls
    UNION ALL
    SELECT callee_id as id, duration
    FROM Calls
),
cte2 as (
SELECT 
    CallsCTE.*,
    LPAD(CAST(SUBSTRING(phone_number, 1, 3) AS UNSIGNED), 3, '0') AS country_code
FROM CallsCTE
INNER JOIN Person as p
ON p.id = CallsCTE.id
),
cte3 as (
    select name, cast(country_code as CHAR) as country_code
    FROM Country
),
cte4 as(
    SELECT CTE2.*, CTE3.NAME as country
    FROM CTE2
    INNER JOIN CTE3
    ON cte2.country_code = cte3.country_code
),
cte5_avg_country as (
select country, avg(duration) over (partition by country) as avg_country
FROM cte4
)
select distinct country 
from cte5_avg_country
where avg_country > (select avg(duration) from cte4)
