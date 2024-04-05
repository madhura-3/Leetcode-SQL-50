# Intuition
We aim to find the IDs of users who visited the mall without making any transactions and determine the number of times they made such visits.

# Approach
We can use a left join between the Visits and Transactions tables on the visit_id column. By selecting the rows where the transaction_id is NULL, we can identify visits without transactions. We then group the results by customer_id and count the number of visits without transactions for each customer.

# Complexity
- Time complexity: `O(m + n)`, where m is the number of rows in the Visits table and n is the number of rows in the Transactions table.

- Space complexity: `O(m)`, where m is the number of rows in the Visits table.

# Code
```sql
# Write your MySQL query statement below
select v.customer_id, count(v.visit_id) as count_no_trans
from Visits v left join Transactions t
on v.visit_id = t.visit_id
where t.transaction_id is NULL
group by v.customer_id
order by count_no_trans;
```
# My Solution
You can find my solution posted on Leetcode [here](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/solutions/4975417/simple-solution)

![image.png](https://assets.leetcode.com/users/images/feed78b5-0479-46d9-aad4-631491ee2b60_1712283252.6718464.png)
