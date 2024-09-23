SELECT one_student, other_student, score_diff
FROM (
    SELECT 
        s1.student AS one_student,
        s2.student AS other_student,
        ABS(s1.score - s2.score) AS score_diff
    FROM 
        scores s1
    JOIN 
        scores s2 ON s1.id < s2.id  -- Ensure we don't compare the same student
) AS final_table
ORDER BY 
    score_diff, 
    LEAST(one_student, other_student), 
    GREATEST(one_student, other_student)
LIMIT 1;
-- Given a table of students and their SAT test scores, write a query to return the two students with the closest test scores with the score difference.

-- If there are multiple students with the same minimum score difference, select the student name combination that is higher in the alphabet. 

-- Example:

-- Input:

-- scores table

-- Column	Type
-- id	INTEGER
-- student	VARCHAR
-- score	INTEGER
-- Output:

-- Column	Type
-- one_student	VARCHAR
-- other_student	VARCHAR
-- score_diff	INTEGER
