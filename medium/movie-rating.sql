-- Problem: Movie Rating
-- Source: LeetCode
-- Difficulty: Medium

-- Approach:
-- Problem is solved using JOIN, GROUP BY, aggregation and UNION
-- Written 2 queries, then merge them 
-- First query: JOIN Users and MovieRating, GROUP BY users's id and name, ORDER BY ratings's COUNT and user's name
-- SECON query: JOIN Movies and MovieRating, GROUP BY movies's id and title, ORDER BY average ratings and movies's title

-- Write your PostgreSQL query statement below
( 
    SELECT u.name AS results    
    FROM Users u
    JOIN MovieRating m
        ON u.user_id = m.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name
    LIMIT 1 
)
UNION ALL
(
    SELECT m.title AS results
    FROM Movies m
    JOIN MovieRating mr
        ON m.movie_id = mr.movie_id
    WHERE mr.created_at >= '2020-02-01' AND mr.created_at < '2020-03-01'
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title
    LIMIT 1
);
