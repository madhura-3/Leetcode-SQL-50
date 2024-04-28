# Intuition

We want to analyze the `Delivery` table to find the percentage of first customer orders that were placed for immediate delivery. This means the customer's preferred delivery date matched the actual order date.

<!-- Describe your first thoughts on how to solve this problem. -->

# Approach

1. **Identify First Orders:** Use a subquery to find the minimum `order_date` for each `customer_id`. This represents their first order.
2. **Filter Immediate Orders:** Filter the main table to include only rows where the `order_date` (actual delivery) matches the `customer_pref_delivery_date` (preferred delivery) and the `customer_id` is from the first orders identified in the subquery.
3. **Calculate Percentage:** Calculate the average of a boolean expression that evaluates to 1 for immediate orders (matching dates) and 0 for non-immediate orders. This average, multiplied by 100 and rounded, provides the immediate order percentage.

<!-- Describe your approach to solving the problem. -->

# Complexity
- Time complexity: `O(nlogn)` (worst case) due to potential table sorting during subquery and filtering.
<!-- Add your time complexity here, e.g. $$O(n)$$ -->

- Space complexity: `O(n)` (proportional to the number of rows) in the worst case, as temporary result sets might be created.
<!-- Add your space complexity here, e.g. $$O(n)$$ -->

![image.png](https://assets.leetcode.com/users/images/83e20ddf-7e81-477a-8056-d976a4d9daec_1714330155.907587.png)

# Code
```sql
# Write your MySQL query statement below
Select 
    round(avg(order_date = customer_pref_delivery_date)*100, 2) as immediate_percentage
from Delivery
where (customer_id, order_date) in (
  Select customer_id, min(order_date) 
  from Delivery
  group by customer_id
);
```

# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/immediate-food-delivery-ii/solutions/5085037/simple-solution-beats-83)

![image.png](https://assets.leetcode.com/users/images/683fdb50-1cf1-4c01-ab88-a90ef730e79e_1714330339.2928872.png)
