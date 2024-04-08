# Intuition
We need movies with odd IDs that aren't boring. Filter by ID and description, then sort by rating.

# Approach
1. **Filter by odd ID:** Use the modulo operator `(%)` to check if id is odd `(id % 2 <> 0)`.
2. **Filter by non-boring description:** Exclude rows where `description = "boring"`.
3. **Order by rating:** Sort the results in descending order by `rating`.
4. **Select all columns:** Use SELECT * to retrieve all movie information.

# Complexity
- Time complexity: `O(n)` (linear search through the table).

- Space complexity: `O(1)` (constant additional space for temporary results).

# Code
```sql
# Write your MySQL query statement below
select *
from Cinema
where id %2 <> 0 and description <> "boring"
order by rating desc;
```

# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/not-boring-movies/solutions/4993026/simple-solution)

![image.png](https://assets.leetcode.com/users/images/04a1d8e3-910b-4cef-99cb-281691429ed7_1712579188.7741437.png)
