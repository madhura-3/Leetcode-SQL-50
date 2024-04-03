# Intuition
We need to report the product name, year, and price for each `sale_id` in the Sales table.

# Approach
We can use a `right join` to combine the `Sales` and `Product` tables on the `product_id` column. This way, we can include all sales from the Sales table along with the corresponding product names from the Product table.

# Complexity
- Time complexity: `O(m + n)`, where m is the number of rows in the Sales table and n is the number of rows in the Product table.

- Space complexity: `O(m)`, where m is the number of rows in the Sales table.

# Code
``` sql
# Write your MySQL query statement below
select product_name, year, price
from product right join sales  using (product_id);
```

# My Solution:

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/product-sales-analysis-i/solutions/4967713/simple-solution)

<img src="https://assets.leetcode.com/users/images/d4ecbcf2-c4a7-46ce-bc60-6eda7f2384d8_1712153517.599146.png" width="500">
