# Intuition
To identify big countries, we need to check if a country has either a large area or a large population. We can use a SQL query to filter countries based on these conditions.

# Approach
1. We can write a SQL query to select the name, population, and area of countries from the **`World`** table.
2. We use the **`WHERE`** clause to filter countries that have either an area greater than or equal to three million or a population greater than or equal to twenty-five million.
3. The result of the query provides the information about big countries.

# Complexity
- Time complexity:
The time complexity of the SQL query depends on the size of the **`World`** table and the efficiency of the database engine.
However, since we are only selecting rows based on certain conditions, the time complexity is typically linear with respect to the number of rows in the table.

- Space complexity:
The space complexity of the SQL query is determined by the size of the result set, which is proportional to the number of big countries identified.
In this case, it depends on the number of countries that meet the criteria specified in the **`WHERE`** clause.

# Code
```
# Write your MySQL query statement below
Select name, population, area
from World
Where population >= 25000000 || area >=3000000;
```

This SQL query selects the name, population, and area of countries from the **`World`** table 
where the population is greater than or equal to twenty-five million or the area is greater than or equal to three million.
It returns the result table containing information about big countries.

# My Solution
I have posted my solution on LeetCode. You can find it [here](https://leetcode.com/problems/big-countries/solutions/4952233/simple-solution).
