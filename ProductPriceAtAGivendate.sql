select distinct t1.product_id, t2.new_price as price
from 
    (
        select product_id, max(change_date) as change_date
        from Products
        where change_date <= '2019-08-16'
        group by product_id
    ) t1 
    join 
    Products t2
where t1.product_id = t2.product_id 
and t1.change_date = t2.change_Date
union

select product_id, 10 as price
from Products
group by product_id
having min(change_date) >'2019-08-16'
-- Products table:
-- +------------+-----------+-------------+
-- | product_id | new_price | change_date |
-- +------------+-----------+-------------+
-- | 1          | 20        | 2019-08-14  |
-- | 2          | 50        | 2019-08-14  |
-- | 1          | 30        | 2019-08-15  |
-- | 1          | 35        | 2019-08-16  |
-- | 2          | 65        | 2019-08-17  |
-- | 3          | 20        | 2019-08-18  |
-- +------------+-----------+-------------+
-- Output: 
-- +------------+-------+
-- | product_id | price |
-- +------------+-------+
-- | 2          | 50    |
-- | 1          | 35    |
-- | 3          | 10    |
-- +------------+-------+