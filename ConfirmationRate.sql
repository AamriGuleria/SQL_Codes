SELECT 
    IFNULL(t1.user_id, 0) AS user_id,
    IFNULL(ROUND(t2.Number / t3.Total, 2), 0) AS confirmation_rate
FROM 
    Signups t1
LEFT JOIN (
    SELECT 
        user_id, 
        COUNT(action) AS Number
    FROM 
        Confirmations
    WHERE 
        action = 'confirmed'
    GROUP BY 
        user_id
) t2 ON t1.user_id = t2.user_id
LEFT JOIN (
    SELECT 
        user_id, 
        COUNT(*) AS Total
    FROM 
        Confirmations
    GROUP BY 
        user_id
) t3 ON t1.user_id = t3.user_id;
-- Input: 
-- Signups table:
-- +---------+---------------------+
-- | user_id | time_stamp          |
-- +---------+---------------------+
-- | 3       | 2020-03-21 10:16:13 |
-- | 7       | 2020-01-04 13:57:59 |
-- | 2       | 2020-07-29 23:09:44 |
-- | 6       | 2020-12-09 10:39:37 |
-- +---------+---------------------+
-- Confirmations table:
-- +---------+---------------------+-----------+
-- | user_id | time_stamp          | action    |
-- +---------+---------------------+-----------+
-- | 3       | 2021-01-06 03:30:46 | timeout   |
-- | 3       | 2021-07-14 14:00:00 | timeout   |
-- | 7       | 2021-06-12 11:57:29 | confirmed |
-- | 7       | 2021-06-13 12:58:28 | confirmed |
-- | 7       | 2021-06-14 13:59:27 | confirmed |
-- | 2       | 2021-01-22 00:00:00 | confirmed |
-- | 2       | 2021-02-28 23:59:59 | timeout   |
-- +---------+---------------------+-----------+
-- Output: 
-- +---------+-------------------+
-- | user_id | confirmation_rate |
-- +---------+-------------------+
-- | 6       | 0.00              |
-- | 3       | 0.00              |
-- | 7       | 1.00              |
-- | 2       | 0.50              |
-- +---------+-------------------+