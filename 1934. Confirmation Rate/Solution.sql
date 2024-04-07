# Write your MySQL query statement below
select user_id, round(ifnull(avg(action = 'confirmed'),0),2) as confirmation_rate
from signups left join confirmations using(user_id)
group by user_id;
