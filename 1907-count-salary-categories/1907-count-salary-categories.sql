-- Write your PostgreSQL query statement below
with temp1(category,low,upp) as(
    select * from (values ('Low Salary',0,19999),('Average Salary',20000,50000),('High Salary',50001,999999))
)
select category,count(account_id) accounts_count from temp1 a left join accounts b 
on b.income >= a.low and b.income <= a.upp
group by category;