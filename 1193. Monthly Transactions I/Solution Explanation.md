# Intuition
<!-- Describe your first thoughts on how to solve this problem. -->
We want to analyze transactions in the `Transactions` table, summarizing them by month and country. This involves calculating:

- Total number of transactions (`trans_count`).
- Total transaction amount (`trans_total_amount`).
- Number of approved transactions (`approved_count`).
- Total approved transaction amount (`approved_total_amount`).

# Approach
- **Group by Month and Country:** Organize the `Transactions` table by both `DATE_FORMAT`(trans_date, '%Y-%m') (month in YYYY-MM format) and `country`.
- **Aggregate Transaction Data:** Utilize these aggregation functions:
    - `count(trans_date):` Counts all transactions.
    - `count(CASE WHEN state='approved' THEN trans_date END):` Counts
    approved transactions using a conditional statement.
    - `sum(amount):` Calculates the total transaction amount.
    - `sum(CASE WHEN state='approved' THEN amount ELSE 0 END:` Calculates the total approved transaction amount using a conditional sum.
<!-- Describe your approach to solving the problem. -->

# Complexity
- Time complexity: `O(nlogn)` worst case due to potential table sorting during grouping.
<!-- Add your time complexity here, e.g. $$O(n)$$ -->

- Space complexity: `O(n)` (proportional to the number of rows) in the worst case, as temporary result sets might be created.
<!-- Add your space complexity here, e.g. $$O(n)$$ -->


![image.png](https://assets.leetcode.com/users/images/2ea48a8f-f3ae-40a3-865b-3c9a1f649514_1714328700.0493665.png)

# Code
```sql
# Write your MySQL query statement below
select DATE_FORMAT(trans_date, '%Y-%m') as month, 
country, 
count(trans_date) as trans_count,  
count(CASE WHEN state='approved' THEN trans_date END) as approved_count, 
sum(amount) as trans_total_amount, 
sum(CASE WHEN state='approved' THEN amount ELSE 0 END) as approved_total_amount
from Transactions
group by month, country;
```

# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/monthly-transactions-i/solutions/5084925/simple-solution-beats-96)

![image.png](https://assets.leetcode.com/users/images/aa0c6396-8e06-4996-ac2f-c3f24dca75f2_1714328846.6896768.png)
