SELECT
  i.item_category AS Category,
  SUM(CASE WHEN DAYOFWEEK(o.order_date) = 2 THEN o.quantity ELSE 0 END) AS `MONDAY`,
  SUM(CASE WHEN DAYOFWEEK(o.order_date) = 3 THEN o.quantity ELSE 0 END) AS `TUESDAY`,
  SUM(CASE WHEN DAYOFWEEK(o.order_date) = 4 THEN o.quantity ELSE 0 END) AS `WEDNESDAY`,
  SUM(CASE WHEN DAYOFWEEK(o.order_date) = 5 THEN o.quantity ELSE 0 END) AS `THURSDAY`,
  SUM(CASE WHEN DAYOFWEEK(o.order_date) = 6 THEN o.quantity ELSE 0 END) AS `FRIDAY`,
  SUM(CASE WHEN DAYOFWEEK(o.order_date) = 7 THEN o.quantity ELSE 0 END) AS `SATURDAY`,
  SUM(CASE WHEN DAYOFWEEK(o.order_date) = 1 THEN o.quantity ELSE 0 END) AS `SUNDAY`
FROM Items i
LEFT JOIN Orders o 
  ON o.item_id = i.item_id
GROUP BY i.item_category
ORDER BY i.item_category;

