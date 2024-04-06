# Intuition
We need to fetch the names and bonuses of employees who have a bonus less than 1000 or no bonus at all.

# Approach
We'll perform a `left join` between the Employee and Bonus tables on the empId column. Then, we'll filter the result to include only those employees whose bonus is less than 1000 or null.

# Complexity
- Time complexity: `O(m+n)`
    * `m `is the number of rows in the `Employee` table.
    * `n` is the number of rows in the `Bonus` table.

- Space complexity: `O(n)`
    * `n` is the number of employees with bonuses less than 1000 or no bonus at all.

# Code
```sql
# Write your MySQL query statement below
select name, bonus
from Employee left join Bonus using (empId)
where bonus < 1000  or bonus is null
order by bonus;
```
# My Solution

You can find my solution posted on Leetcode [here]()

<img src = "https://github.com/madhura-3/Leetcode-SQL-50/assets/42023529/40a3acd4-8940-44b6-a4ad-d6f1e9b8a218">
