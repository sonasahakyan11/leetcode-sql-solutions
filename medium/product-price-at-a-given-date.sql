-- Problem: Product Price at a Given Date
-- Source: LeetCode
-- Difficulty: Medium

-- Approach:
-- Problem is solved using window function and UNION
-- First part: - Filter records where change_date <= 2019-08-16
--             - Use ROW_NUMBER partitioned by product id and ordered by change_date DESC
--             - Select the latest price per product (rn = 1) 
-- Second part: - Find products that have no price changes on or before 2019-08-16
--              - These products must have default price of 10
--              - GROUP BY product_id and HAVING MIN(change_date) > '2019-08-16')
-- Combine both tables using UNION

-- Write your PostgreSQL query statement below
SELECT  product_id, new_price AS price
FROM (
    SELECT 
        product_id,
        new_price,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
) t
WHERE rn = 1 
UNION
SELECT product_id, 10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'
