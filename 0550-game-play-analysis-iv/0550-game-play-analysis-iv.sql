-- Write your PostgreSQL query statement below
with temp1 as (
    select player_id,row_number() over(partition by player_id order by event_date) rnk,event_date-lag(event_date) over(partition by player_id order by event_date) d_diff
from activity)
select round((select count(distinct player_id) from temp1 where d_diff=1 and rnk=2)::numeric / count(distinct player_id)::numeric,2) fraction from temp1;