# Write your MySQL query statement below

with cte1 as(
    select product_id,
    year,
    quantity,
    price,
    dense_rank() over (partition by product_id order by year asc) as rn
    FROM Sales
)
SELECT product_id,
year AS first_year,
quantity as quantity,
price as price
FROM cte1
WHERE rn = 1
