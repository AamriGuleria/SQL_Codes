SELECT DISTINCT opened.account_id
FROM
    (SELECT account_id
     FROM account_status
     WHERE date = '2019-12-31' AND status = 'open') AS opened
JOIN
    (SELECT account_id
     FROM account_status
     WHERE date = '2020-01-01' AND status = 'closed') AS closed
ON opened.account_id = closed.account_id;
-- Given a table of account statuses, write a query to get the percentage of accounts that were active on December 31st, 2019, and closed on January 1st, 2020, over the total number of accounts that were active on December 31st. Each account has only one daily record indicating its status at the end of the day.

-- Note: Round the result to 2 decimal places.

-- Example:

-- Input:

-- account_status table

-- Column	Type
-- account_id	INTEGER
-- date	DATETIME
-- status	VARCHAR
-- account_id	date	status
-- 1	2020-01-01	closed
-- 1	2019-12-31	open
-- 2	2020-01-01	closed
-- Output:

-- Column	Type
-- percentage_closed	FLOAT
