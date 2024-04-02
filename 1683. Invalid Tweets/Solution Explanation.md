# Intuition
We need to identify tweets with content length greater than 15 characters.

# Approach
We can use a SQL query to select `tweet_ids` from the `Tweets` table where the length of the `content` exceeds 15 characters.

# Complexity
- Time complexity: **`O(n)`**, where n is the number of tweets in the Tweets table.

- Space complexity: **`O(1)`**, the space used is constant.

# Code
```
# Write your MySQL query statement below
select tweet_id
from Tweets
where length(content) >15;
```

# My Solution

You can find my solution posted on Leetcode [here](https://leetcode.com/problems/invalid-tweets/solutions/4960014/simple-solution)
