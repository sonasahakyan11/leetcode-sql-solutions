-- Problem: Monthly Transactions I
-- Source: LeetCode
-- Difficulty: Medium

-- Approach:
-- Problem is solved using GROUP BY and aggregations
-- Table is grouped by month and country
-- Counted transactions count, approved transactions count, sum of all transactions, sum of approved transactions


-- Write your PostgreSQL query statement below
SELECT 
     TO_CHAR(trans_date, 'YYYY-MM') AS month,
     country,
     COUNT(*) AS trans_count,
     COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
     SUM(amount) AS trans_total_amount,
     COALESCE(SUM(CASE WHEN state = 'approved' THEN amount END), 0) AS approved_total_amount 
FROM Transactions
GROUP BY month, country
