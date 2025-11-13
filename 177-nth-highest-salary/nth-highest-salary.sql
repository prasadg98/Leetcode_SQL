CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
        with cte1 as (
            SELECT id, salary,
            dense_rank() over (order by salary desc) as dense_rn
            from Employee
        )
        SELECT 
        CASE WHEN count(*) > 0 then max(salary)
        ELSE NULL 
        END AS getHighestSalary
        from cte1
        where dense_rn = N
  );
END