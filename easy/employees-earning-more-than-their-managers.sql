-- Problem: Employees Earning More Than Their Managers
-- Source: LeetCode
-- Difficulty: Easy

-- Approach:
-- Problem is solved using self join
-- Employee table joined with itself
-- The other managers table
-- Tables are joined on employees managerId = managers id
-- Then compares their salaries

-- Write your PostgreSQL query statement below
SELECT e.name AS Employee 
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
WHERE e.salary > m.salary
