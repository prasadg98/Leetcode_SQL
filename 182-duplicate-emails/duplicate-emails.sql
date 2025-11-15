# Write your MySQL query statement below

SELECT email
FROM Person
group by email
HAVING count(email) > 1