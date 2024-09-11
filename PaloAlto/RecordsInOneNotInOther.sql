SELECT * from table1
WHERE
user_id 
not IN
(SELECT
user_id FROM
table2);