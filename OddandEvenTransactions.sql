-- Input:

-- transactions table:

-- +----------------+--------+------------------+
-- | transaction_id | amount | transaction_date |
-- +----------------+--------+------------------+
-- | 1              | 150    | 2024-07-01       |
-- | 2              | 200    | 2024-07-01       |
-- | 3              | 75     | 2024-07-01       |
-- | 4              | 300    | 2024-07-02       |
-- | 5              | 50     | 2024-07-02       |
-- | 6              | 120    | 2024-07-03       |
-- +----------------+--------+------------------+
  
-- Output:

-- +------------------+---------+----------+
-- | transaction_date | odd_sum | even_sum |
-- +------------------+---------+----------+
-- | 2024-07-01       | 75      | 350      |
-- | 2024-07-02       | 0       | 350      |
-- | 2024-07-03       | 0       | 120      |
-- +------------------+---------+----------+
  
  # Write your MySQL query statement below
select transaction_date,sum(CASE WHEN amount%2=0 THEN 0 ELSE amount END) as odd_sum, sum(CASE WHEN amount%2=0 THEN amount ELSE 0 END) as even_sum
from 
Transactions
group by
transaction_date
order by transaction_date
;