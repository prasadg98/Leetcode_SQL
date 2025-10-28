# Write your MySQL query statement below
WITH 
employee_salary as (
    SELECT name, salary, departmentId,
    dense_rank() over (partition by departmentId order by salary desc) as dr
    from Employee
),
cte2 as (
select * from employee_salary
where dr <=3
)
select dept.name as Department,
cte2.name as Employee,
cte2.salary as Salary
from cte2
inner join Department as dept
on cte2.departmentId = dept.id
