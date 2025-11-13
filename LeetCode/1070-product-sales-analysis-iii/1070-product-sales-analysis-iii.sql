-- Write your PostgreSQL query statement below
with temp1 as (
    select product_id,min(year) myear from sales group by product_id 
)
select a.product_id,year first_year, quantity,price from sales a inner join temp1 b 
on a.product_id=b.product_id and a.year=b.myear;