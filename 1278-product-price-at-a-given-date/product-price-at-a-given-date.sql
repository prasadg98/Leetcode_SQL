# Write your MySQL query statement below
WITH CTE1 as(
SELECT *,
ROW_NUMBER() OVER (PARTITION BY product_id order by change_date desc) as date_num
FROM Products
WHERE change_date <= '2019-08-16'
)
SELECT product_id,
new_price as price
FROM CTE1
WHERE date_num = 1
UNION
SELECT product_id, 10 as price
FROM Products
WHERE product_id NOT IN (SELECT distinct product_id FROM CTE1)
