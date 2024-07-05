# Write your MySQL query statement below
select e.employee_id , 0 as bonus
from
Employees e
where e.employee_id not in
(
    select employee_id
from
Employees
where name not like 'M%'
and 
employee_id % 2<>0
)
union all
(
select employee_id,salary as bonus
from
Employees
where name not like 'M%'
and 
employee_id % 2<>0
)
order by
employee_id;
-- Input: 
-- Employees table:
-- +-------------+---------+--------+
-- | employee_id | name    | salary |
-- +-------------+---------+--------+
-- | 2           | Meir    | 3000   |
-- | 3           | Michael | 3800   |
-- | 7           | Addilyn | 7400   |
-- | 8           | Juan    | 6100   |
-- | 9           | Kannon  | 7700   |
-- +-------------+---------+--------+
-- Output: 
-- +-------------+-------+
-- | employee_id | bonus |
-- +-------------+-------+
-- | 2           | 0     |
-- | 3           | 0     |
-- | 7           | 7400  |
-- | 8           | 0     |
-- | 9           | 7700  |
-- +-------------+-------+