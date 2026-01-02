# Write your MySQL query statement below
WITH CTE1 as (
SELECT product_id,
year(transaction_date) as "year",
spend
FROM user_transactions
),
cte2 as (
select product_id,
year,
sum(spend) as curr_year_spend
from CTE1
Group by year, product_id),
cte3 as (
select year,
product_id,
curr_year_spend,
lag(curr_year_spend) over (partition by product_id order by year) as prev_year_spend
FROM cte2)
select *,
ROUND((curr_year_spend-prev_year_spend)/(prev_year_spend)*100,2) as yoy_rate
FROM cte3
ORDER BY product_id, year