-- Given the transactions table below, write a query that finds the third purchase of every user.

-- Note: Sort the results by the user_id in ascending order. If a user purchases two products at the same time, the lower id field is used to determine which is the first purchase.

-- Example:

-- Input:

-- transactions table

-- Columns	Type
-- id	INTEGER
-- user_id	INTEGER
-- created_at	DATETIME
-- product_id	INTEGER
-- quantity	INTEGER
-- Output:

-- Columns	Type
-- user_id	INTEGER
-- created_at	DATETIME
-- product_id	INTEGER
-- quantity	INTEGER

select user_id , created_id , product_id , quantity
from
(
select id, user_id, created_id, quantity , ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY created_id,id)
as rank
from
transactions 
) as sub_table
where rank=3
order by user_id;