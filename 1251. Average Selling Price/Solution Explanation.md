# Intuition
You might initially think that simply using the `AVG` function on the `price` column in the `Prices` table would solve this problem. However, this wouldn't account for the actual number of units sold at each price. To get a true picture of the average selling price, we need to consider both the `price` and the `sales volume`.

# Approach
1. **Join the tables:** We'll use a `LEFT JOIN` to connect the `Prices` and `UnitsSold` tables. This ensures we include all products even if they weren't sold during a specific price period.
2. **Match sales to price range:** We'll filter the `UnitsSold` table using a condition `(u.purchase_date between p.start_date and p.end_date)` to ensure we only consider units sold within the valid price range of each product in the `Prices` table.
3. **Calculate weighted average:** Essentially, we'll calculate a weighted average where the weights are the number of units sold at each price. We'll achieve this by multiplying `price` by `units` for each sale and then summing those values. We'll also sum the total number of units sold.
4. **Calculate average price:** We'll divide the total revenue (calculated in step 3) by the total units sold (using `ifnull` to avoid division by zero) and `round` the result to two decimal places using round.
5. **Group by product:** We'll group the results by `product_id` to calculate the average price for each individual product.

# Complexity
- Time complexity: `O(nlogn)` (worst case) due to the join operation.

- Space complexity: `O(n)` for storing intermediate results.

# Code
``` sql
# Write your MySQL query statement below
select p.product_id, ifnull(round(sum(p.price*u.units)/sum(u.units),2),0) as average_price
from Prices p left join UnitsSold u
on p.product_id = u.product_id
and u.purchase_date between p.start_date and p.end_date
group by p.product_id;
```
# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/average-selling-price/solutions/4993228/simple-solution)

<img src = "https://assets.leetcode.com/users/images/2e48e7be-2546-41f8-8a08-9d2c030f5df0_1712582044.7948043.png" width = "500">
