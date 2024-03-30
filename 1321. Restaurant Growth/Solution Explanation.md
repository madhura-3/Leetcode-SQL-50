# Intuition
To compute the moving average of the amount paid by customers over a seven-day window, we need to sum up the amounts for each day and then calculate the average over the specified window.

# Approach
We first calculate the total amount paid by customers for each day using the SUM function in SQL. Then, we use a common table expression (CTE) to create a subquery named DaySum to store the total amount for each day.

Next, we perform a self-join on the DaySum table to compute the moving sum of amounts over a seven-day window. We use the DATEDIFF function to determine the number of days between two dates and filter the rows to include only those within the specified window.

Finally, we calculate the moving average by dividing the moving sum of amounts by 7 and round the result to two decimal places using the ROUND function.

# Complexity
Time complexity: O(n^2) due to the self-join operation and grouping.

Space complexity: O(n) for storing the total amounts for each day in the DaySum CTE.

# Code
```sql
	-- Write your MySQL query statement below
	with DaySum as (
		select visited_on, sum(amount) as amount
		from Customer
    		group by visited_on
		)
	select a.visited_on,
       		round(sum(b.amount), 2) as amount,
       		round(avg(b.amount), 2) as average_amount
	from DaySum a, DaySum b
	where datediff(a.visited_on, b.visited_on) between 0 and 6
	group by a.visited_on
	having count(*) > 6
	order by a.visited_on;
```

# My Solution
I have posted my solution on LeetCode. You can find it [here](https://leetcode.com/problems/restaurant-growth/solutions/4948874/simple-solution).
