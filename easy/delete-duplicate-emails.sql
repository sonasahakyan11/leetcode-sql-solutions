-- Problem: Delete Duplicate Emails
-- Source: LeetCode
-- Difficulty: Easy

-- Approach:
-- Use ROW_NUMBER() to assign a rank within each email group.
-- Keep the first occurrence (lowest id) and delete the rest.

-- Write your PostgreSQL query statement below
WITH ranked AS (
    SELECT id, email,
        ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS rn
    FROM Person
)
DELETE FROM Person p
USING ranked r
WHERE p.id = r.id 
AND r.rn > 1;
