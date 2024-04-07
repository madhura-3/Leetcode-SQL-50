# Intuition
- We want to count exam attendances for each student-subject combination.
- A complex join might be overkill - consider simpler solutions.

# Approach
1. **Generate all combinations:** Use `CROSS JOIN` between `Students` and `Subjects` to create all possible student-subject pairs.
2. **Left join with Examinations:** Perform a `LEFT JOIN` on `Examinations` to match attended exams. Count attendances with `COUNT`.
3. **Group and order:** Group by `student_id` and `subject_name` to summarize attendance per student-subject. Order the results for clarity.

# Complexity
- Time complexity: `O(nxm)` (students x subjects) due to the `CROSS JOIN.`

- Space complexity: `O(n+m)` for storing student, subject, and temporary data.

# Code
```sql
# Write your MySQL query statement below
select s.student_id, s.student_name, sub.subject_name, count(e.subject_name) as attended_exams
from Students s
cross join subjects sub
left join Examinations e
on s.student_id = e.student_id and sub.subject_name = e.subject_name
group by s.student_id, sub.subject_name
order by s.student_id, sub.subject_name;
```
# My Solution
You can find my solution posted on Leetcode [here](https://leetcode.com/problems/students-and-examinations/solutions/4990071/simple-solution)

<img src = "https://assets.leetcode.com/users/images/55fda215-29f3-4f67-9999-a9080fa397d3_1712530813.2655807.png" width = "500">
