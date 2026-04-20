-- Problem: Friend Requests II: Who Has the Most Friends
-- Source: LeetCode
-- Difficulty: Medium

-- Approach:
-- Step 1: Count how many requests each user sent
-- Step 2: Count how many requests each user accepted
-- Step 3: Combine both counts using FULL JOIN to include all users
-- Step 4: Use COALESCE for NULL ids
-- Step 5: Handle NULLs and sum counts using CASE
-- Step 6: Sort and return the user with the highest total
-- FULL JOIN ensures users appearing in only one role are not lost

-- Write your PostgreSQL query statement below
WITH requester AS (
    SELECT requester_id, COUNT(*) AS requester_count
    FROM RequestAccepted
    GROUP BY requester_id
),
accepter AS (
    SELECT accepter_id, COUNT(*) AS accepter_count
    FROM RequestAccepted
    GROUP BY accepter_id
)

SELECT COALESCE(r.requester_id, a.accepter_id) AS id, 
           CASE WHEN r.requester_id = a.accepter_id THEN r.requester_count + a.accepter_count
           WHEN r.requester_id IS NULL THEN  a.accepter_count 
           ELSE r.requester_count END AS num
FROM requester r
FULL JOIN accepter a
ON r.requester_id = a.accepter_id
ORDER BY num DESC
LIMIT 1
