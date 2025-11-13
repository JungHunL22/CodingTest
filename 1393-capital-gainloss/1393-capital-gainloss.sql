-- Write your PostgreSQL query statement below
select stock_name,sum(case when operation='Buy' then price*-1 else price end) capital_gain_loss from stocks
group by 1