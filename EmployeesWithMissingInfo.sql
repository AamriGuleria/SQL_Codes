# Write your MySQL query statement below
select t.employee_id from
(
select employee_id
from
Employees
union
select employee_id
from
Salaries
) t
where
employee_id not in
(
    select employee_id
    from
    Employees
)
or
employee_id
not in
(
    select employee_id
    from
    Salaries
)
order by
employee_id asc;
-- Input: 
-- Employees table:
-- +-------------+----------+
-- | employee_id | name     |
-- +-------------+----------+
-- | 2           | Crew     |
-- | 4           | Haven    |
-- | 5           | Kristian |
-- +-------------+----------+
-- Salaries table:
-- +-------------+--------+
-- | employee_id | salary |
-- +-------------+--------+
-- | 5           | 76071  |
-- | 1           | 22517  |
-- | 4           | 63539  |
-- +-------------+--------+
-- Output: 
-- +-------------+
-- | employee_id |
-- +-------------+
-- | 1           |
-- | 2           |
-- +-------------+