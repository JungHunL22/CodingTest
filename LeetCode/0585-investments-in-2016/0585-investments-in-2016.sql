-- Write your PostgreSQL query statement below
with temp1 as (
    select tiv_2015,count(*) cnt_tiv from insurance group by tiv_2015),
temp2 as (
    select lat,lon,count(*) cnt_dirr from insurance group by lat,lon)
select round(sum(tiv_2016)::numeric,2) tiv_2016 from insurance a left join temp1 b on a.tiv_2015=b.tiv_2015 left join temp2 c on a.lat=c.lat and a.lon=c.lon
where cnt_tiv<>1 and cnt_dirr<=1;