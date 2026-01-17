# Write your MySQL query statement below

WITH CTE1 AS (

    SELECT departmentID, name, Salary,
    DENSE_RANK() over (partition by departmentID order by Salary desc) as salary_rnk
    FROM Employee
)

SELECT d.name as Department,
CTE1.name as Employee,
CTE1.Salary as Salary
FROM CTE1
inner join Department as d
on CTE1.departmentID = d.id
WHERE CTE1.salary_rnk = 1