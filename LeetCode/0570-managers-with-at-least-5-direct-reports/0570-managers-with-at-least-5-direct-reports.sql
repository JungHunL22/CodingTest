-- Write your PostgreSQL query statement below
with temp1 as (
    select a.id,a.name,count(*) manager_n from employee a left join employee b on a.id=b.managerid group by a.id,a.name)
    select name from temp1 where manager_n>=5
    