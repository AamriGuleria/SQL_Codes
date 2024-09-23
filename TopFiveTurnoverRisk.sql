SELECT t1.id
FROM employees t1
JOIN projects p1
  ON t1.id = p1.employee_id
WHERE p1.End_dt IS NOT NULL -- Only consider completed projects
GROUP BY t1.id, t1.salary
HAVING COUNT(p1.project_id) >= 3 -- Employees who completed at least 3 projects
ORDER BY t1.salary ASC -- Order by lowest salary
LIMIT 5; -- Get the 5 lowest-paid employees
-- Let’s say you’re working in HR at a major tech company, and they ask you to find employees with a high probability of leaving the company. They tell you these employees perform well but have the lowest pay.

-- Given two tables, employees and projects, find the five lowest-paid employees who have completed at least three projects.

-- Note: We consider projects to be completed when they have an end date, which is the same as saying their End_dt is not NULL.

-- Example:

-- Input:

-- employees table

-- id	salary
-- INTEGER	FLOAT
-- projects table

-- employee_id	project_id	Start_dt	End_dt
-- INTEGER	INTEGER	DATETIME	DATETIME
-- Output:

-- employee_id
-- INTEGER
