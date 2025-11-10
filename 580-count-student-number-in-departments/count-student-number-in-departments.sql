# Write your MySQL query statement below

with cte1 as (
SELECT s.dept_id, d.dept_name, count(*) as student_num
FROM Student as s
inner join Department as d 
ON s.dept_id = d.dept_id
group by 1,2
)
Select d.dept_name as dept_name, 
case when cte1.student_num IS NULL then 0 else cte1.student_num end as student_number
FROM Department as d 
LEFT JOIN cte1 
ON d.dept_id = cte1.dept_id
order by student_number desc, dept_name asc

