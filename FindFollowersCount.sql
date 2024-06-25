select
user_id,count(distinct follower_id) as followers_count
from
Followers
group by
user_id;
-- Input: 
-- Followers table:
-- +---------+-------------+
-- | user_id | follower_id |
-- +---------+-------------+
-- | 0       | 1           |
-- | 1       | 0           |
-- | 2       | 0           |
-- | 2       | 1           |
-- +---------+-------------+
-- Output: 
-- +---------+----------------+
-- | user_id | followers_count|
-- +---------+----------------+
-- | 0       | 1              |
-- | 1       | 1              |
-- | 2       | 2              |
-- +---------+----------------+
-- Explanation: 
-- The followers of 0 are {1}
-- The followers of 1 are {0}
-- The followers of 2 are {0,1}