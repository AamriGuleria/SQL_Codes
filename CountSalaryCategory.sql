# Write your MySQL query statement below
select "Low Salary" as category ,count(income) as accounts_count
from Accounts
where
income<20000

union
select "Average Salary" as category ,count(income) as accounts_count
from Accounts
where
income>=20000 and income<=50000

union

select "High Salary" as category,count(income) as accounts_count
from Accounts
where
income>50000

order by accounts_count desc
;
-- Accounts table:
-- +------------+--------+
-- | account_id | income |
-- +------------+--------+
-- | 3          | 108939 |
-- | 2          | 12747  |
-- | 8          | 87709  |
-- | 6          | 91796  |
-- +------------+--------+
-- Output: 
-- +----------------+----------------+
-- | category       | accounts_count |
-- +----------------+----------------+
-- | Low Salary     | 1              |
-- | Average Salary | 0              |
-- | High Salary    | 3              |
-- +----------------+----------------+
-- Explanation: 
-- Low Salary: Account 2.
-- Average Salary: No accounts.
-- High Salary: Accounts 3, 6, and 8.