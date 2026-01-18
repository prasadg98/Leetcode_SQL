# Write your MySQL query statement below

with direct_reporting as(
    Select employee_id 
    FROM Employees
    where manager_id = 1 and employee_id != 1
),
indirect2 as (
    Select employee_id
    FROM Employees
    WHERE manager_id in (select employee_id from direct_reporting)
),
indirect3 as(
    SELECT employee_id
    FROM Employees
    WHERE manager_id in (select employee_id from indirect2)
)
select employee_id 
FROM direct_reporting
UNION
select employee_id 
FROM indirect2
UNION
select employee_id 
FROM indirect3