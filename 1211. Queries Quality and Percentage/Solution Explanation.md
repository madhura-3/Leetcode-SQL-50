# Intuition
We want to analyze the `Queries` table to calculate two metrics for each unique query:

1. **Quality:** The average of the ratio between a query's rating and its position. This indicates how well-rated queries are at different result positions.
2. **Poor Query Percentage:** The percentage of queries with a rating below 3, considered to be poor.
<!-- Describe your first thoughts on how to solve this problem. -->

# Approach

1. **Filter for Unique Queries:** Use SELECT DISTINCT query_name to ensure we only consider each query once.
2. **Calculate Quality:** 
    - Cast `rating` as decimal for accurate division.
    - Calculate the ratio of `rating` to `position` for each row.
    - Use `AVG` to find the average of these ratios, representing the overall quality for the query.
    - Round the average to 2 decimal places.
3. **Calculate Poor Query Percentage:**
    - Use a conditional expression `case when rating < 3 then 1 else 0 end` to count rows with a rating less than 3 (poor queries).
    - Divide the count of poor queries by the total count `(COUNT(*))` and multiply by 100 to get a percentage.
    - Round the percentage to 2 decimal places.
4. **Group by Query Name:** Group the results by `query_name` to present the quality and poor query percentage for each unique query.

<!-- Describe your approach to solving the problem. -->

# Complexity
- Time complexity: `O(nlogn)` (worst case) due to potential sorting for distinct selection and grouping.
<!-- Add your time complexity here, e.g. $$O(n)$$ -->

- Space complexity: `O(n)` (proportional to the number of rows) in the worst case, as temporary result sets might be created.
<!-- Add your space complexity here, e.g. $$O(n)$$ -->

![image.png](https://assets.leetcode.com/users/images/e3ad0205-a071-4039-83ea-58e7e63424f9_1714335852.89234.png)

# Code
```sql
# Write your MySQL query statement below
select distinct query_name,
round(avg(cast(rating as decimal) / position), 2) as quality,
round(sum(case when rating < 3 then 1 else 0 end) * 100 / count(*), 2) as poor_query_percentage
from queries
where query_name is not null
group by query_name;
```

# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/queries-quality-and-percentage/solutions/5085266/simple-solution-beats-93)

![image.png](https://assets.leetcode.com/users/images/aab5a009-be11-4c05-8e66-0cd4f3786eb8_1714336346.8400016.png)
