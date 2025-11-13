-- Write your PostgreSQL query statement below
with temp1 as (
    select *,row_number() over(partition by customer_id order by order_date) rnk from delivery   
)
select round((sum(case when order_date=customer_pref_delivery_date then 1 else 0 end)::numeric/count(*)::numeric)*100,2) immediate_percentage from temp1 where rnk=1;