# Intuition
We want to analyze the `Register` table to find the percentage of users registered for each contest. This involves calculating the ratio of registered users per contest compared to the total number of users.
<!-- Describe your first thoughts on how to solve this problem. -->

# Approach
1. **Count Total Users:** Use a subquery to retrieve the total number of users from the `Users` table.
2. **Count Users per Contest:** Use `COUNT(DISTINCT user_id)` in the `Register` table to count the unique users registered for each `contest_id`.
3. **Calculate Percentage:** Divide the count of unique users per contest by the total number of users (from the subquery) and multiply by 100. Then, round the result to 2 decimal places.
4. **Group and Order Results:** Group the results by `contest_id` to present the `percentage` for each contest. Order the table first by percentage in descending order (highest percentage first), and then by `contest_id` in ascending order (to break ties).
<!-- Describe your approach to solving the problem. -->

# Complexity
- Time complexity: `O(nlogn)` 
(worst case) due to potential sorting for distinct count and grouping.
<!-- Add your time complexity here, e.g. $$O(n)$$ -->

- Space complexity: `O(1)`
(constant) in most cases, as it only uses a small number of temporary variables.
<!-- Add your space complexity here, e.g. $$O(n)$$ -->

![image.png](https://assets.leetcode.com/users/images/1763bf75-f365-426f-a9bb-323c66c01969_1714402102.3871462.png)

# Code
```sql
# Write your MySQL query statement below
Select contest_id, 
round(count( distinct user_id)*100/(Select count(user_id) from Users),2) as percentage
From Register 
Group by contest_id
Order by percentage DESC, contest_id;
```
# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/percentage-of-users-attended-a-contest/solutions/5088367/simple-solution-beats-94)


![image.png](https://assets.leetcode.com/users/images/a9670329-1eaa-4f58-852f-f10d61bb715f_1714402277.1297185.png)
