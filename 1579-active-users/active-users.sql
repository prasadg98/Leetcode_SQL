# Write your MySQL query statement below

WITH CTE1 AS (
SELECT DISTINCT a.*, l.login_date
FROM Logins as l
LEFT JOIN Accounts as a
ON l.id = a.id
),
cte2 as (
    SELECT *, row_number() over (partition by id order by login_date) AS RN 
    FROM CTE1
)
SELECT DISTINCT id, name
FROM CTE2 
GROUP BY id, name, DATE_SUB(login_date, INTERVAL RN DAY)
HAVING count(*) >= 5