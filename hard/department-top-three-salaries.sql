-- Problem: Department Top Three Salaries
-- Source: LeetCode
-- Difficulty: Hard

-- Approach:
-- Solved using subquery, DENSE_RANK() and INNER JOIN
-- Joined Employee and Department tables using department id
-- Used DENSE_RANK() to rank salaries within each department
-- Ordered salaries descending to find highest-paid employees first
-- Filtered rows where rank <= 3 to return top 3 distinct salaries


-- Write your PostgreSQL query statement below
SELECT Department,
        Employee,
        Salary
FROM (
    SELECT d.name AS Department,
        e.salary AS Salary,
        e.name AS Employee,
        DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS salary_rank
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
) t
WHERE t.salary_rank <= 3
