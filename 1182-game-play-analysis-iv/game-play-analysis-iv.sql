# Write your MySQL query statement below
WITH CTE1 as (
SELECT player_id, event_date,
row_number() over (partition by player_id order by event_date asc) as rn_date,
LEAD(event_date) over (partition by player_id order by event_date asc) as next_date
FROM Activity
),
CTE2 as(
select player_id,
DATEDIFF(next_date,event_date) as date_diff from CTE1
where rn_date = 1
)
select ROUND(count(distinct player_id) /(select count(distinct player_id) from Activity),2) as fraction
FROM CTE2
WHERE date_diff = 1