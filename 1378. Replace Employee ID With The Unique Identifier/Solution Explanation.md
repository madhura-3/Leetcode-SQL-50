# Intuition
We need to show the unique ID of each user from the `EmployeeUNI` table and replace it with null if a user does not have a unique ID.

# Approach
We can use a `left join` to combine the Employees and EmployeeUNI tables on the id column. 
This way, we can include all employees from the `Employees` table and their corresponding unique IDs from the `EmployeeUNI` table. 
If an employee does not have a unique ID, we show `null`.

# Complexity
* Time complexity: `O(m + n)`, where m is the number of rows in the `Employees` table and n is the number of rows in the `EmployeeUNI` table.

* Space complexity: `O(m)`, where m is the number of rows in the `Employees` table.

Code
```sql
# Write your MySQL query statement below
select unique_id, name
from Employees  left join EmployeeUNI 
using (id);
```

# My Solution
You can my solution posted on Leetcode [here](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/solutions/4964262/simple-solution)
