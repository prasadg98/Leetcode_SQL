WITH cte AS (
  SELECT 
    i.item_category AS category,
    DAYOFWEEK(o.order_date) AS dow,       -- 1=Sun … 7=Sat
    SUM(o.quantity) AS qty
  FROM Items i
  LEFT JOIN Orders o
    ON o.item_id = i.item_id              -- keeps categories with no orders
  GROUP BY 1, 2
)
SELECT
  category,
  SUM(CASE WHEN dow = 2 THEN qty ELSE 0 END) AS `MONDAY`,
  SUM(CASE WHEN dow = 3 THEN qty ELSE 0 END) AS `TUESDAY`,
  SUM(CASE WHEN dow = 4 THEN qty ELSE 0 END) AS `WEDNESDAY`,
  SUM(CASE WHEN dow = 5 THEN qty ELSE 0 END) AS `THURSDAY`,
  SUM(CASE WHEN dow = 6 THEN qty ELSE 0 END) AS `FRIDAY`,
  SUM(CASE WHEN dow = 7 THEN qty ELSE 0 END) AS `SATURDAY`,
  SUM(CASE WHEN dow = 1 THEN qty ELSE 0 END) AS `SUNDAY`
FROM cte
GROUP BY category
ORDER BY category;
