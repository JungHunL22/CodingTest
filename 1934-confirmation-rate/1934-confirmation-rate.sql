-- Write your PostgreSQL query statement below
select a.user_id, coalesce(round(con_cnt::numeric/total::numeric,2),0) confirmation_rate  from signups a left join (select user_id,sum(case when action='confirmed' then 1 else 0 end) con_cnt, count(*) total from confirmations
group by 1) b on a.user_id=b.user_id