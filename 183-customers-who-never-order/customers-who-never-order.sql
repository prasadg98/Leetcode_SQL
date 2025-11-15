# Write your MySQL query statement below


SELECT name as Customers
FROM Customers
WHERE id not in ( SELECT distinct customerID FROM Orders)