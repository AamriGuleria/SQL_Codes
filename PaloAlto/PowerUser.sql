-- sale_id (int) – The unique identifier of a sale.
-- user_id (int) – The unique identifier of a user.
-- purchase_date (timestamp) – The date when the product was purchased.
-- product_id (int) – The unique identifier of a product.
-- price (decimal) - The price of the product when it was sold.
-- Your task is to write a SQL query that can identify these power users. The output should include user_ids and total purchase value of all power users, sorted in descending order by total purchase value.

-- sales Example Input:
-- sale_id	user_id	purchase_date	product_id	price
-- 1001	300	01/01/2022 00:00:00	500	200.00
-- 1002	305	01/03/2022 00:00:00	505	800.00
-- 1003	300	02/01/2022 00:00:00	501	250.00
-- 1004	310	02/07/2022 00:00:00	502	150.00
-- 1005	300	02/15/2022 00:00:00	503	350.00
-- 1006	305	02/20/2022 00:00:00	506	1100.00
-- 1007	300	03/01/2022 00:00:00	504	200.00
select count(user_id),SUM(Total_Price) AS total_purchase_value
from
(
select user_id , count(distinct product_id) as products , sum(price) as Total_Price
FROM
sales
group by
user_id
) as t1
WHERE
products>10 and Total_Price>10000;