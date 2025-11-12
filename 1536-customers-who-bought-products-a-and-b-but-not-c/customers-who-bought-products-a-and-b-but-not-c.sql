# Write your MySQL query statement below
# Write your MySQL query statement below
WITH CTE1 AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        o.product_name
    FROM Customers AS c
    INNER JOIN Orders AS o
        ON c.customer_id = o.customer_id
)
SELECT 
    customer_id,
    customer_name
FROM CTE1
GROUP BY customer_id, customer_name
HAVING 
    SUM(product_name = 'A') > 0  -- bought A
    AND SUM(product_name = 'B') > 0  -- bought B
    AND SUM(product_name = 'C') = 0  -- did NOT buy C
ORDER BY customer_id;
