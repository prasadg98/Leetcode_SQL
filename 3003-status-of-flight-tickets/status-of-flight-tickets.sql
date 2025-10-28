# Write your MySQL query statement below
with cte1 as (
    select f.flight_id, f.capacity,
    p.passenger_id, p.booking_time,
    count(p.passenger_id) over (partition by p.flight_id order by p.booking_time asc) as running_total
    from Flights as f
    inner join Passengers as p 
    on f.flight_id = p.flight_id
)
select passenger_id,
case when
running_total <= capacity then 'Confirmed'
ELSE 'Waitlist' END as Status
from cte1
order by passenger_id asc