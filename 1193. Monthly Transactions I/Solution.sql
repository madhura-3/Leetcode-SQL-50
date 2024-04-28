# Write your MySQL query statement below
select date_format(trans_date, '%Y-%m') as month, 
country, 
count(trans_date) as trans_count,  
count(CASE WHEN state='approved' THEN trans_date END) as approved_count, 
sum(amount) as trans_total_amount, 
sum(CASE WHEN state='approved' THEN amount ELSE 0 END) as approved_total_amount
from Transactions
group by month, country;
