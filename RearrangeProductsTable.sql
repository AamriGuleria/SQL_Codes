# Write your MySQL query statement below
select t.product_id,t.store,t.price
from
(
select store1 as price,"store1" as store,product_id
from Products
where store1 is not null
union all
select store2 as price,"store2" as store,product_id
from Products
where store2 is not null
union all
select store3 as price,"store3" as store,product_id
from Products
where store3 is not null
) t
order by
product_id;
-- Input: 
-- Products table:
-- +------------+--------+--------+--------+
-- | product_id | store1 | store2 | store3 |
-- +------------+--------+--------+--------+
-- | 0          | 95     | 100    | 105    |
-- | 1          | 70     | null   | 80     |
-- +------------+--------+--------+--------+
-- Output: 
-- +------------+--------+-------+
-- | product_id | store  | price |
-- +------------+--------+-------+
-- | 0          | store1 | 95    |
-- | 0          | store2 | 100   |
-- | 0          | store3 | 105   |
-- | 1          | store1 | 70    |
-- | 1          | store3 | 80    |
-- +------------+--------+-------+
-- Explanation: 
-- Product 0 is available in all three stores with prices 95, 100, and 105 respectively.
-- Product 1 is available in store1 with price 70 and store3 with price 80. The product is not available in store2.