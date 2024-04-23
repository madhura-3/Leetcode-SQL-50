# Intuition
<!-- Describe your first thoughts on how to solve this problem. -->
We want to calculate the fraction of players who logged in on consecutive days. This can be achieved by finding:

1. **Total Players:** The total number of distinct players in the `Activity` table.
2. **Players with Consecutive Logins:** The number of players who have entries on both their first login date and the day after.

# Approach
<!-- Describe your approach to solving the problem. -->
1. Use a subquery to find the first login date for each player.
2. Join the `Activity` table with itself using a correlated subquery.
3. Filter the joined table to include only players with entries on both their first login date and the following day.
4. Calculate the fraction by dividing the number of players with consecutive logins by the total number of players and round to 2 decimal places.

# Complexity
- Time complexity: `O(nlogn)`
(worst case) due to potential sorting involved in finding the first login date per player.
<!-- Add your time complexity here, e.g. $$O(n)$$ -->

- Space complexity:`O(n)`
(proportional to the number of rows) in the worst case, as temporary result sets might be created.
<!-- Add your space complexity here, e.g. $$O(n)$$ -->

![image.png](https://assets.leetcode.com/users/images/a4daebaa-0730-4e78-81d7-56474ef90717_1713901028.9796956.png)

# Code
```sql
# Write your MySQL query statement below
select round(count(distinct player_id)/(select count(distinct player_id)from activity),2) as fraction
from activity
where (player_id, date_sub(event_date, interval 1 day)) in (select player_id, min(event_date) as first_login from activity group by player_id);
```
# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/game-play-analysis-iv/solutions/5064213/simple-solution-beats-75)

![image.png](https://assets.leetcode.com/users/images/654c2827-04f4-4757-9a4d-33fc1394a7d7_1713901533.9029438.png)
