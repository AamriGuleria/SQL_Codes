# Write your MySQL query statement below
select person_name from
(
SELECT turn, weight, person_name, Person_id,cum_weight
FROM (
    SELECT turn, weight, person_name, Person_id,
           SUM(weight) OVER (ORDER BY turn) AS cum_weight
    FROM Queue
) subquery
WHERE cum_weight <= 1000
ORDER BY turn
)t2
order by cum_weight
desc
limit 1;
-- Input: 
-- Queue table:
-- +-----------+-------------+--------+------+
-- | person_id | person_name | weight | turn |
-- +-----------+-------------+--------+------+
-- | 5         | Alice       | 250    | 1    |
-- | 4         | Bob         | 175    | 5    |
-- | 3         | Alex        | 350    | 2    |
-- | 6         | John Cena   | 400    | 3    |
-- | 1         | Winston     | 500    | 6    |
-- | 2         | Marie       | 200    | 4    |
-- +-----------+-------------+--------+------+
-- Output: 
-- +-------------+
-- | person_name |
-- +-------------+
-- | John Cena   |
-- +-------------+