# Intuition
To identify authors who viewed their own articles, we need to find rows where the `author_id` is the same as the `viewer_id`.

# Approach
We can use a SQL query to select **`distinct`** author_ids from the Views table where the `author_id` matches the `viewer_id`. 
This will give us the authors who viewed at least one of their own articles.

# Complexity
- Time complexity: **`O(n)`**, where n is the number of rows in the Views table.

- Space complexity: **`O(n)`**, where n is the number of distinct author_ids in the Views table.

# Code
```
# Write your MySQL query statement below
select distinct author_id as id
from Views
where author_id = viewer_id
order by id;
```
# My Solution
I have posted my solution on LeetCode. You can find it [here](https://leetcode.com/problems/article-views-i/solutions/4959992/simple-solution).
