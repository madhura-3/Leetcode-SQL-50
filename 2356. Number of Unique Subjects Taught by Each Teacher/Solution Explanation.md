# Intuition
We want to analyze the `Teacher` table to find how many unique subjects each teacher teaches across all departments.
<!-- Describe your first thoughts on how to solve this problem. -->

# Approach
1. **Group by Teacher ID:** Organize the `Teacher` table by `teacher_id` to group data for each teacher.
2. **Count Unique Subjects:** Use `COUNT(DISTINCT subject_id)` to count the number of unique `subject_id` entries within each teacher group.
<!-- Describe your approach to solving the problem. -->

# Complexity
- Time complexity: `O(nlogn)` (worst case) due to potential table sorting during grouping.
<!-- Add your time complexity here, e.g. $$O(n)$$ -->

- Space complexity: `O(n)` (proportional to the number of rows) in the worst case, as temporary result sets might be created.
<!-- Add your space complexity here, e.g. $$O(n)$$ -->

![image.png](https://assets.leetcode.com/users/images/67538227-5326-418e-9f28-24ca2770b880_1715124671.961646.png)


# Code
```
# Write your MySQL query statement below
select teacher_id , count(distinct subject_id) as cnt
from Teacher
group by teacher_id;
```

# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/solutions/5127534/simple-solution-beats-96)

![image.png](https://assets.leetcode.com/users/images/7d23bf80-decd-4d4d-9132-b244da192e10_1715124846.2233691.png)
