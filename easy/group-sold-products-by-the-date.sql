-- Problem: Group Sold Products By The Date
-- Source: LeetCode
-- Difficulty: Easy

-- Approach:
-- 1. Group rows by sell_date
-- 2. Count unique products sold per day
-- 3. Concatenate unique product names into a comma-separated string per day
-- 4. Sort results by date

-- Write your PostgreSQL query statement below
SELECT sell_date, 
    COUNT(DISTINCT product) AS num_sold, 
    STRING_AGG(DISTINCT product, ',' ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date
