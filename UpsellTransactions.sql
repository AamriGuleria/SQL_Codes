SELECT COUNT(DISTINCT user_id) AS num_of_upsold_customers
FROM transactions
WHERE user_id IN (
    SELECT user_id
    FROM transactions
    GROUP BY user_id, DATE(created_at)
    HAVING COUNT(DISTINCT created_at) > 1
)
-- We’re given a table of product purchases. Each row in the table represents an individual user product purchase.

-- Write a query to get the number of customers that were upsold, or in other words, the number of users who bought additional products after their first purchase.

-- Note: If the customer purchased two things on the same day, that does not count as an upsell, as they were purchased within a similar timeframe.

-- Example:

-- Input:

-- transactions table

-- Column	Type
-- id	INTEGER
-- user_id	INTEGER
-- created_at	DATETIME
-- product_id	INTEGER
-- quantity	INTEGER
-- Output:

-- Column	Type
-- num_of_upsold_customers	INTEGER
