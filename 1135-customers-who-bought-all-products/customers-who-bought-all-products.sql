# Write your MySQL query statement below

WITH Distinct_Customer as (
select distinct customer_id, 
product_key
from Customer
),
cte2 as(
SELECT customer_id,
count(*) over (partition by customer_id) as products_bought
FROM Distinct_Customer
)
select distinct customer_id from cte2
WHERE products_bought = (select count(*) from Product)