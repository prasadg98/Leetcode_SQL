# Write your MySQL query statement below
WITH CTE1 as (
SELECT user_id,activity_date,
row_number() over (partition by user_id order by activity_date) as login_no
FROM Traffic
WHERE activity = 'login'
)
select activity_date as login_date, count(user_id) as user_count from CTE1
WHERE login_no = 1 AND activity_date between DATE_SUB('2019-06-30', INTERVAL 90 DAY) AND '2019-06-30'
GROUP BY 1 
