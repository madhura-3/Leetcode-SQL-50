# Intuition
Imagine an employee hierarchy chart. We want to find managers with at least five direct reports. To achieve this, we can count the number of employees who have each manager listed as their `managerId`.

# Approach
We'll use a `JOIN` and a `HAVING` clause to achieve this:

1. **Join the Employee table:** We'll perform a `JOIN` on the `Employee` table itself. This will connect each employee to their manager. We'll use `e1.id (employee)` and `e2.managerId (manager)` for the join condition.
2. **Group by manager ID:** We'll use `GROUP BY e2.managerId` to group the results by the manager's ID. This will allow us to count the number of direct reports for each manager.
3. **Filter by minimum reports:** We'll use the `HAVING` clause to filter the results. We only want managers with `COUNT(e2.managerId) >= 5`, meaning at least five employees have them listed as their manager.
4. **Retrieve manager names:** Finally, we'll select the `name` of the managers who meet the criteria using `e1.name`. Since we joined on `id`, `e1` represents the actual manager with at least five reports.

# Complexity
- **Time complexity:** This approach takes `O(nlogn)` time in the worst case, where n is the number of employees. This is because the join can be expensive depending on the implementation.

- **Space complexity:** The space complexity is `O(n)` since we're storing intermediate results for each manager.

# Code
```sql
# Write your MySQL query statement below
select e1.name
from Employee e1 join Employee e2
on e1.id = e2.managerId
group by e2.managerId
having count(e2.managerId) >= 5;
```

# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/solutions/4985373/simple-solution)

<img src = "https://assets.leetcode.com/users/images/d2b846b3-2497-4a19-ada3-98ae67b1d8d2_1712460548.2654874.png"  width = "500">
