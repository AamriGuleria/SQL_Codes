SELECT
    patient_id,
    patient_name,
    conditions
FROM
    Patients
WHERE
    conditions LIKE '% DIAB1%' or conditions LIKE 'DIAB1%'
ORDER BY
    patient_id;
-- Input: 
-- Patients table:
-- +------------+--------------+--------------+
-- | patient_id | patient_name | conditions   |
-- +------------+--------------+--------------+
-- | 1          | Daniel       | YFEV COUGH   |
-- | 2          | Alice        |              |
-- | 3          | Bob          | DIAB100 MYOP |
-- | 4          | George       | ACNE DIAB100 |
-- | 5          | Alain        | DIAB201      |
-- +------------+--------------+--------------+
-- Output: 
-- +------------+--------------+--------------+
-- | patient_id | patient_name | conditions   |
-- +------------+--------------+--------------+
-- | 3          | Bob          | DIAB100 MYOP |
-- | 4          | George       | ACNE DIAB100 | 
-- +------------+--------------+--------------+
-- Explanation: Bob and George both have a condition that starts with DIAB1.