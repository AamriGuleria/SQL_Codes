select employee_id 
from Employees
where
salary<30000
and manager_id not in 
(SELECT employee_id FROM Employees)
order by 
employee_id
asc;
-- Input:  
-- Employees table:
-- +-------------+-----------+------------+--------+
-- | employee_id | name      | manager_id | salary |
-- +-------------+-----------+------------+--------+
-- | 3           | Mila      | 9          | 60301  |
-- | 12          | Antonella | null       | 31000  |
-- | 13          | Emery     | null       | 67084  |
-- | 1           | Kalel     | 11         | 21241  |
-- | 9           | Mikaela   | null       | 50937  |
-- | 11          | Joziah    | 6          | 28485  |
-- +-------------+-----------+------------+--------+
-- Output: 
-- +-------------+
-- | employee_id |
-- +-------------+
-- | 11          |
-- +-------------+