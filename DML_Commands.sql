-- These Commands are used to manipulate data and contains most of the sql Commands
--  Basically, DCL statements are grouped with DML statements.

-- SELECT Command
SELECT col FROM table_name;

-- UPDATE Command
UPDATE Users
SET email = 'newemail@example.com'
WHERE user_id = 1;

-- INSERT Command
-- This command is used to insert a tuple in a table
INSERT INTO table_name 
(col1 , col2 , col3) 
VALUES
("HEY" , "THERE" , "GUYS");

-- DELETE Command
-- delete the tuples from table
DELETE FROM table_name 
where condition;