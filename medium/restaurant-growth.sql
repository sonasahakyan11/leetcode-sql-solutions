-- Problem: Restaurant Growth
-- Source: LeetCode
-- Difficulty: Medium

-- Approach:
-- Problem is solved using CTE, GROUP BY, aggregation, rolling window logic and time series 
-- Used CTE to aggregate daily revenue 
-- Window functions to compute 7-days rolling sum and average using ROWS BETWEEN clause for time-series aggregation
-- Taken only rows that have 6 preceding rows

-- Write your PostgreSQL query statement below
WITH daily AS (
    SELECT visited_on, 
        SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
)

SELECT visited_on,
    SUM(daily_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
    ROUND(AVG(daily_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
FROM daily
ORDER BY visited_on
OFFSET 6
