# Write your MySQL query statement below

with cte as 
            (select visited_on,sum(amount) as amt 
            from Customer 
            group by visited_on),

 cte2 as(SELECT visited_on, amt,
        sum(amt) over (order by visited_on rows between 6 preceding  and current row) as summm 
        FROM cte) 

select * from (
select visited_on,summm as amount,
round(avg(amt) over(order by visited_on
                RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW),2) as average_amount
 from cte2 )sub
 where visited_on between date_add((select min(visited_on) from Customer), interval 6 day) 
 and (select max(visited_on) from Customer)
order by visited_on