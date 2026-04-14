-- Problem: Customers Who Bought All Products
-- Source: LeetCode
-- Difficulty: Medium

-- Approach:
-- Problem is solved using GROUP BY + HAVING clause
-- 1. Group by customer_id and count distinct product keys that customer with customer_id bought
-- 2. Compare each customer's purchased product's count with the count of products in Product table

-- Write your PostgreSQL query statement below
SELECT customer_id 
FROM Customer 
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product)
