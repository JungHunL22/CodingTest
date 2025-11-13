-- Write your PostgreSQL query statement below
with temp1 as(
    select *,
    lag(visited_on,6) over(order by visited_on) d_6,
    sum(amount) over(order by visited_on rows between 6 preceding and current row) amt_sum,
    round(avg(amount) over(order by visited_on rows between 6 preceding and current row),2) amt_avg
    from (select visited_on,sum(amount) amount from customer group by 1)
)
select visited_on,amt_sum amount, amt_avg average_amount from temp1 where d_6 is not null
