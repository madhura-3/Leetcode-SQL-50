# Intuition
Imagine you need to calculate the average experience of employees working on each project. You might initially consider grouping by `employee_id` to find experience, but that wouldn't tell you anything about projects. Instead, let's group by `project_id` and find the average experience of those working on each project.

# Approach
1. **Join tables:** We'll use a `LEFT JOIN` between `Project` and `Employee` tables to connect project IDs with employee experience.
2. **Group by project:** We'll group the results by `project_id` to calculate the average experience for each project.
3. **Calculate average experience:** We'll use `AVG` on `experience_years` to find the average experience of employees working on each project.
4. **Round the result:** We'll use `ROUND` to round the average experience to 2 decimal places.

# Complexity
- Time complexity: `O(nlogn)` (worst case) due to the join operation.

- Space complexity: `O(n)` for storing intermediate results.

# Code
``` sql
# Write your MySQL query statement below
select p.project_id, round(avg(e.experience_years),2) as average_years
from Project p left join Employee e 
on p.employee_id = e.employee_id
group by p.project_id
order by p.project_id;
```
# My Solution
You can find my solution posted on Leetcode [here](https://leetcode.com/problems/project-employees-i/solutions/5000494/simple-solution)

![image.png](https://assets.leetcode.com/users/images/e310c211-7376-43d9-95bc-3403ce81fece_1712689791.7027469.png)
