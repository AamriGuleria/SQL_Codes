# Write your MySQL query statement below
select id,
case
WHEN p_id IS NULL THEN 'Root'
WHEN id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
else "Inner"
end as type
from
Tree;

