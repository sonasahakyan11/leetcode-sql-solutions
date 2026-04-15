-- Problem: Employees Whose Manager Left the Company
-- Source: LeetCode
-- Difficulty: Easy

-- Approach:
-- Problem is solved using subquery in WHERE clause
-- Filter all records employees whoes salary < 30000 AND whoes manager does not exist in table

-- Write your PostgreSQL query statement below
SELECT employee_id
FROM Employees
WHERE salary < 30000 AND manager_id NOT IN (
        SELECT employee_id
        FROM Employees
)
ORDER BY employee_id
