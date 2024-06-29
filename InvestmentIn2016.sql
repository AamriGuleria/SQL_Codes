SELECT  round(sum(e.tiv_2016),2) as tiv_2016
FROM Insurance e
JOIN (
    SELECT tiv_2015, COUNT(*) as number
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
) t1 ON e.tiv_2015 = t1.tiv_2015
WHERE e.pid IN (
    SELECT t3.pid
    FROM (
        SELECT pid, lat, lon, COUNT(*) as freq
        FROM Insurance
        GROUP BY lat, lon
        HAVING COUNT(*) = 1
    ) t3
);
-- Input: 
-- Insurance table:
-- +-----+----------+----------+-----+-----+
-- | pid | tiv_2015 | tiv_2016 | lat | lon |
-- +-----+----------+----------+-----+-----+
-- | 1   | 10       | 5        | 10  | 10  |
-- | 2   | 20       | 20       | 20  | 20  |
-- | 3   | 10       | 30       | 20  | 20  |
-- | 4   | 10       | 40       | 40  | 40  |
-- +-----+----------+----------+-----+-----+
-- Output: 
-- +----------+
-- | tiv_2016 |
-- +----------+
-- | 45.00    |
-- +----------+
-- Explanation: 
-- The first record in the table, like the last record, meets both of the two criteria.
-- The tiv_2015 value 10 is the same as the third and fourth records, and its location is unique.

-- The second record does not meet any of the two criteria. Its tiv_2015 is not like any other policyholders and its location is the same as the third record, which makes the third record fail, too.
-- So, the result is the sum of tiv_2016 of the first and last record, which is 45.