-- BEGIN TRANSACTION Command
-- Starts a new transaction
BEGIN TRANSATION 
[transaction_name];

-- COMMIT 
-- Saves all the changes done during transation
COMMIT;

-- ROLLBACK Command
ROLLBACK;

-- SAVEPOINT
SAVEPOINT savepoint_name;