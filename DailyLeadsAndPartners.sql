select date_id,make_name,count(distinct lead_id) as unique_leads,count(distinct partner_id) as unique_partners
from
DailySales
group by 
date_id,make_name;
-- Input: 
-- DailySales table:
-- +-----------+-----------+---------+------------+
-- | date_id   | make_name | lead_id | partner_id |
-- +-----------+-----------+---------+------------+
-- | 2020-12-8 | toyota    | 0       | 1          |
-- | 2020-12-8 | toyota    | 1       | 0          |
-- | 2020-12-8 | toyota    | 1       | 2          |
-- | 2020-12-7 | toyota    | 0       | 2          |
-- | 2020-12-7 | toyota    | 0       | 1          |
-- | 2020-12-8 | honda     | 1       | 2          |
-- | 2020-12-8 | honda     | 2       | 1          |
-- | 2020-12-7 | honda     | 0       | 1          |
-- | 2020-12-7 | honda     | 1       | 2          |
-- | 2020-12-7 | honda     | 2       | 1          |
-- +-----------+-----------+---------+------------+
-- Output: 
-- +-----------+-----------+--------------+-----------------+
-- | date_id   | make_name | unique_leads | unique_partners |
-- +-----------+-----------+--------------+-----------------+
-- | 2020-12-8 | toyota    | 2            | 3               |
-- | 2020-12-7 | toyota    | 1            | 2               |
-- | 2020-12-8 | honda     | 2            | 2               |
-- | 2020-12-7 | honda     | 3            | 2               |
-- +-----------+-----------+--------------+-----------------+