# Write your MySQL query statement below


SELECT player_id,
event_date,
SUM(games_played) over (PARTITION BY player_id order by event_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as games_played_so_far
FROM Activity