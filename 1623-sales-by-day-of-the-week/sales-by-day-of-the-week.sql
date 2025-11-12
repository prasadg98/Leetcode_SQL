WITH CTE1 AS (
    SELECT 
        i.item_category AS CATEGORY,
        SUM(CASE WHEN DAYOFWEEK(o.order_date) = 2 THEN o.quantity ELSE 0 END) AS MONDAY,
        SUM(CASE WHEN DAYOFWEEK(o.order_date) = 3 THEN o.quantity ELSE 0 END) AS TUESDAY,
        SUM(CASE WHEN DAYOFWEEK(o.order_date) = 4 THEN o.quantity ELSE 0 END) AS WEDNESDAY,
        SUM(CASE WHEN DAYOFWEEK(o.order_date) = 5 THEN o.quantity ELSE 0 END) AS THURSDAY,
        SUM(CASE WHEN DAYOFWEEK(o.order_date) = 6 THEN o.quantity ELSE 0 END) AS FRIDAY,
        SUM(CASE WHEN DAYOFWEEK(o.order_date) = 7 THEN o.quantity ELSE 0 END) AS SATURDAY,
        SUM(CASE WHEN DAYOFWEEK(o.order_date) = 1 THEN o.quantity ELSE 0 END) AS SUNDAY
        
    FROM Orders AS o
    RIGHT JOIN Items AS i
        ON o.item_id = i.item_id
    GROUP BY i.item_category
)
SELECT * 
FROM CTE1
ORDER BY CATEGORY
