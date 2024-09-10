-- Create Command
CREATE TABLE 
table_name
(col1 INT , col2 BOOLEAN , col3 CHAR , col4 DECIMAL , col5 DOUBLE , col6 FLOAT , col7 STRING , col8 VARCHAR) ;

-- Drop Command
-- used to delete the table not the structure of the table
DROP TABLE table_name;

-- Alter Command
-- used to alter the structure of the table
ALTER TABLE table_name ADD COLUMN 
column_name
BOOLEAN;

-- TRUNCATE Command
-- Used to delete the table including the structure 
TRUNCATE TABLE table_name;

-- COMMENT Command
-- Used to add text-able comment
COMMENT 'COMMENT TEXT' ON
TABLE 
table_name;

-- RENAME Command
-- Used to rename a table
RENAME TABLE table_name to new_table_name;