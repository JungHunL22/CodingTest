-- Write your PostgreSQL query statement below
with temp1 as (
select * from products 
where (product_id,change_date) in
(select product_id,max(change_date) from products
where change_date<='2019-08-16'
group by 1))
select distinct a.product_id, coalesce(b.new_price,10) price from products a left join temp1 b on a.product_id=b.product_id
