
# Intuition
We need to select customers who were not referred by the person with `ID '2'`. This suggests a straightforward filtering operation based on the `referee_id` column.

# Approach
To solve this problem, we'll use a simple `SELECT`query to filter out the customers who have a `referee_id` different from **2** or have a 
**NULL** value in the `referee_id` column.

# Complexity
* Time complexity:The time complexity of the query is **O(n)**, where n is the number of rows in the Customer table.
* Space complexity:The space complexity of the query is **O(1)**, as we are only retrieving the names of customers and not storing any additional data structures.

# Code
```sql
# Write your MySQL query statement below
select name
from Customer
where referee_id != 2 or referee_id is null;
```

# My Solution
I have posted my solution on LeetCode. You can find it [here](https://leetcode.com/problems/find-customer-referee/solutions/4948933/simple-solution/).
