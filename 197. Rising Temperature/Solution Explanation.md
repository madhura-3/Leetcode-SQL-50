# Intuition
We aim to find the IDs of dates with higher temperatures compared to their previous dates (yesterday).

# Approach
We can join the `Weather` table with itself using a `self-join` operation. By matching records where the difference in recordDate is 1 day (indicating the previous day), we can compare the temperatures of consecutive days. We then select the IDs of the dates where the temperature is higher than the temperature of the previous day.

# Complexity
- Time complexity: `O(n^2)`, where n is the number of rows in the Weather table.

- Space complexity: `O(1)`, constant space usage.

# Code
```
# Write your MySQL query statement below
Select w1.id as Id
From Weather w1 , Weather w2 
Where  DATEDIFF(w1.recordDate,w2.recordDate) = 1
And w1.temperature > w2.temperature;
```
# My Solution
You can find my solution posted on Leetcode [here](https://leetcode.com/problems/rising-temperature/solutions/4979941/simple-solution)

![image.png](https://assets.leetcode.com/users/images/c48a6bda-f8d2-4ab7-b667-75407a3e66f5_1712353248.861599.png)
