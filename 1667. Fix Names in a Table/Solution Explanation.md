### I have posted my solution on LeetCode. You can find it <a href = 'https://leetcode.com/problems/fix-names-in-a-table/solutions/4925195/simple-solution'>here</a>

# Intuition
Our goal is to correct the formatting of the names in the Users table, ensuring that only the first character is uppercase and the rest are lowercase.

# Approach
To achieve this, we can use the concat function along with upper and lower functions in SQL. By selecting the user_id and applying string manipulation functions to the name column, we can fix the formatting of the names.

# Complexity
- Time complexity: O(nlogn) (due to sorting)
- Space complexity: O(n)

# Code
```sql
    # Write your MySQL query statement below
    select user_id, concat(upper(substring(name,1,1)),lower(substring(name,2))) as name
    from Users
    order by user_id;
