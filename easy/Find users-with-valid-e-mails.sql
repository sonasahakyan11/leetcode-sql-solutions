-- Problem: Find Users With Valid E-Mails
-- Source: LeetCode
-- Difficulty: Easy

-- Approach:
-- Use WHERE clause and regex
-- Filter only valid LeetCode email addresses
-- Rules:
-- 1. Starts with a letter (A-Z or a-z)
-- 2. Followed by letters, digits, underscore, dot, or hyphen
-- 3. Must end with @leetcode.com

-- Write your PostgreSQL query statement below
SELECT user_id,
    name,
    mail
FROM Users
WHERE mail ~ '^[A-Za-z][\w_\.-]*@leetcode\.com$'
