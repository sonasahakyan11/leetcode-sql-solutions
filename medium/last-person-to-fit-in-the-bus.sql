-- Problem: Last Person to Fit in the Bus
-- Source: LeetCode
-- Difficulty: Medium

-- Approach:
-- Problem is solved using window function (cumulative sum)
-- Compute running total of weight ordered by turn
-- Filter rows where cumulative weight <= 1000
-- Select the last person who still fits 

-- Write your PostgreSQL query statement below
SELECT person_name
FROM (
    SELECT person_name,
            SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
) t
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;
