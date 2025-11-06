-- Write your PostgreSQL query statement below
with temp1 as (
    select requester_id id from requestaccepted 
),
temp2 as (
    select accepter_id id from requestaccepted 
)
select id,count(*) num from (select * from temp1 union all select * from temp2) a group by id
order by 2 desc limit 1;