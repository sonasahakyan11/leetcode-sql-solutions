-- Problem: Fix Names in a Table
-- Source: LeetCode
-- Difficulty: Easy

-- Approach:
-- Solved using string functions
-- Converted the first character to uppercase
-- Converted remaining characters to lowercase
-- Concatenated both parts

-- Write your PostgreSQL query statement below
SELECT user_id,
    UPPER(LEFT(name, 1)) || LOWER(SUBSTRING(name FROM 2)) AS name
FROM Users
ORDER BY user_id
