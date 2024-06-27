# Write your MySQL query statement below
SELECT x, y, z, 'No' as triangle
FROM Triangle
WHERE x + y <= z OR y + z <= x OR z + x <= y

UNION

SELECT x, y, z, 'Yes' as triangle
FROM Triangle
WHERE x + y > z AND y + z > x AND z + x > y;
