
select table4.product_id,IFNULL(round(sum(table4.average_price)/sum(table4.units),2),0) as average_price
from
(
select table3.product_id,table3.price*table3.units as average_price,table3.units
from
(
select table1.product_id,table1.price,table2.units
from
Prices table1
left join
UnitsSold table2
on
table1.product_id=table2.product_id
and table2.purchase_date>=table1.start_date and table2.purchase_date<=table1.end_date)
table3
)
table4 group by product_id
;
-- Input: 
-- Prices table:
-- +------------+------------+------------+--------+
-- | product_id | start_date | end_date   | price  |
-- +------------+------------+------------+--------+
-- | 1          | 2019-02-17 | 2019-02-28 | 5      |
-- | 1          | 2019-03-01 | 2019-03-22 | 20     |
-- | 2          | 2019-02-01 | 2019-02-20 | 15     |
-- | 2          | 2019-02-21 | 2019-03-31 | 30     |
-- +------------+------------+------------+--------+
-- UnitsSold table:
-- +------------+---------------+-------+
-- | product_id | purchase_date | units |
-- +------------+---------------+-------+
-- | 1          | 2019-02-25    | 100   |
-- | 1          | 2019-03-01    | 15    |
-- | 2          | 2019-02-10    | 200   |
-- | 2          | 2019-03-22    | 30    |
-- +------------+---------------+-------+
-- Output: 
-- +------------+---------------+
-- | product_id | average_price |
-- +------------+---------------+
-- | 1          | 6.96          |
-- | 2          | 16.96         |
-- +------------+---------------+