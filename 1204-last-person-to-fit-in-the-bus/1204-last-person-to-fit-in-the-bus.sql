-- Write your PostgreSQL query statement below
with temp1 as(
select turn,person_id id,person_name,weight,sum(weight) over(order by turn) "Total Weight"
from queue
order by turn desc)
select person_name from temp1
where "Total Weight"<=1000
limit 1;
