# Write your MySQL query statement below

with cte1 as (
    SELECT *, 
    dense_rank() over (partition by username order by endDate desc) as    dense_rnk,
    count(activity) over (partition by username) as num_of_activities
    FROM UserActivity
)
select username, activity, startDate, endDate from cte1
where (dense_rnk = 2 and num_of_activities > 1) or (dense_rnk = 1 and num_of_activities = 1)
