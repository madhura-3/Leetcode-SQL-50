# Intuition
We aim to calculate the average time each machine takes to complete a process based on the start and end timestamps.

# Approach
We can join the Activity table with itself, matching start and end activities for the same machine and process. By calculating the time difference between the start and end timestamps for each process, we can then compute the average processing time for each machine.

# Complexity
- Time complexity: `O(n^2)`, where n is the number of rows in the Activity table.

- Space complexity: `O(1)`, constant space usage.

# Code
```sql
# Write your MySQL query statement below
Select a1.machine_id, Round(AVG(a2.timestamp - a1.timestamp),3) as processing_time
From Activity a1 JOIN Activity a2
ON a1.machine_id = a2.machine_id and
a1.process_id = a2.process_id and
a1.activity_type='start' and
a2.activity_type='end'
group by a1.machine_id;
```
# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/average-time-of-process-per-machine/solutions/4979997/simple-solution)

![image.png](https://assets.leetcode.com/users/images/2089b8f2-464a-4687-8c74-6252bbed33f8_1712355302.3223507.png)
