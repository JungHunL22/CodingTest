-- Write your PostgreSQL query statement below
with temp1 as (
    select buyer_id,count(item_id) cnt from orders 
where extract('year' from order_date)=2019 group by buyer_id
)
select user_id buyer_id, join_date,
case when cnt is null then 0
else cnt end orders_in_2019 
from users a left join temp1 b on a.user_id=b.buyer_id
;