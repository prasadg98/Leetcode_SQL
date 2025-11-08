#Avg Salary of employee in dept vs avg company salary -- BY MONTH
# Write your MySQL query statement below
with cte1 as (
    select s.*,
    e.department_id
    from Salary as s
    inner join Employee as e
    ON s.employee_id = e.employee_id
),
cte2 as (
    SELECT DATE_FORMAT(cte1.pay_date, '%Y-%m') as pay_month,
    cte1.department_id as department_id,
    AVG(cte1.amount) over (partition by cte1.department_id, DATE_FORMAT(cte1.pay_date, '%Y-%m') order by DATE_FORMAT(cte1.pay_date, "%Y-%m") desc) as avg_dept_salary,
    AVG(cte1.amount) over (partition by DATE_FORMAT(cte1.pay_date, "%Y-%m")) as avg_company_salary
    FROM cte1
)
select distinct pay_month,
department_id,
case when avg_dept_salary > avg_company_salary then "higher"
when avg_dept_salary < avg_company_salary then "lower"
else "same" end as comparison
from cte2

