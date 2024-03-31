# Write your MySQL query statement below
with results as (
    select requester_id as id, accepter_id
    from RequestAccepted

    union all

    select accepter_id as id, requester_id
    from RequestAccepted
)

select id, count(*)as num
from results
group by id
order by num desc
limit 1;
