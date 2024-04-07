# Intuition
Imagine each user has a personal `"confirmation scorecard."` We want to calculate their overall confirmation rate by looking at their scorecard.

- **Confirmed actions** are like points they earned for successfully confirming a message.
- **Total requests** are like the total number of times they were asked to confirm something.

The confirmation rate is simply the ratio of points earned (confirmed actions) to total attempts (total requests).

# Approach
We'll achieve this by teaming up the `signups` and `confirmations` tables using a left join. This ensures we include all users from `signups` even if they haven't made any confirmation requests in `confirmations`.

- **Find confirmed actions:** We'll use the `ifnull` function to check if an action is "confirmed." If it is, we count it as 1 (a point!), otherwise we count it as 0. We then use `avg` to calculate the average "points" per user (average confirmed actions).
- **Find total requests:** We simply use `count(*)` to count the total number of rows (requests) for each user in the `confirmations` table (even if the action wasn't confirmed).
- **Calculate confirmation rate:** We divide the average confirmed actions (points) by the total requests and round the result to two decimal places using `round`.

# Complexity
- Time complexity:This approach takes `O(nlogn)` time in the worst case, where n is the total number of rows across both tables. This is because the left join can be expensive depending on the implementation.

- Space complexity: The space complexity is `O(n)` since we're storing intermediate results for each user.

# Code
```sql
# Write your MySQL query statement below
select user_id, round(ifnull(avg(action = 'confirmed'),0),2) as confirmation_rate
from signups left join confirmations using(user_id)
group by user_id;
```
# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/confirmation-rate/solutions/4985322/simple-solution)

![image.png](https://assets.leetcode.com/users/images/2c0a0c5d-9e6f-4e6e-b3b8-d62f00b5d90c_1712459143.9670515.png)
