WITH CTE1 AS (
    SELECT 
        *, 
        CASE 
            WHEN order_date = customer_pref_delivery_date THEN 'Immediate'
            ELSE 'Scheduled' 
        END AS status,
        DENSE_RANK() OVER (
            PARTITION BY customer_id 
            ORDER BY order_date
        ) AS cust_order_no
    FROM Delivery
),
num AS (
    SELECT 
        COUNT(DISTINCT customer_id) AS numerator
    FROM CTE1
    WHERE status = 'Immediate' 
      AND cust_order_no = 1
),
den AS (
    SELECT 
        COUNT(DISTINCT customer_id) AS denominator
    FROM CTE1
    WHERE cust_order_no = 1
)
SELECT 
    ROUND(100.0 * num.numerator / den.denominator, 2) AS immediate_percentage
FROM num
CROSS JOIN den;
