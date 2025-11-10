# Write your MySQL query statement below
with apple_cte as (
SELECT sale_date, fruit, sold_num as apple_sold_num
from Sales
where fruit = 'apples'
),
oranges_cte as (
    SELECT sale_date, fruit, sold_num as oranges_sold_num
    from Sales
    where fruit = 'oranges'
)
select distinct apple_cte.sale_date as sale_date,
(apple_sold_num - oranges_sold_num) as diff
FROM apple_cte
JOIN oranges_cte
ON apple_cte.sale_date = oranges_cte.sale_date