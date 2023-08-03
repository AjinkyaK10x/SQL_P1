-- 1. What is the gender breakdown of employees in the company
SELECT * FROM project_hr.`human resources`

SELECT SUM(gender), COUNT(*) AS count 
FROM project_hr.`human resources`
WHERE termdate IS NULL
GROUP BY gender;


-- 2. What is the race breakdown of employees in the company
SELECT race , COUNT(*) AS count
FROm project_hr.`human resources`
WHERE termdate IS NULL
GROUP BY race

-- 3. What is the age distribution of employees in the company
SELECT 
	CASE
		WHEN age>=18 AND age<=24 THEN '18-24'
        WHEN age>=25 AND age<=34 THEN '25-34'
        WHEN age>=35 AND age<=44 THEN '35-44'
        WHEN age>=45 AND age<=54 THEN '45-54'
        WHEN age>=55 AND age<=64 THEN '55-64'
        ELSE '65+'
	END AS age_group,
    COUNT(*) AS count
    FROM project_hr.`human resources`
    WHERE termdate IS NULL
    GROUP BY age_group
    ORDER BY age_group;
    
-- 4. How many employees work at HQ vs remote

SELECT location,COUNT(*) AS count
FROm project_hr.`human resources`
WHERE termdate IS NULL
GROUP BY location;

-- 5. What is the average length of employement who have been teminated.
SELECT ROUND(AVG(year(termdate) - year(hire_date)),0) AS length_of_emp
FROM project_hr.`human resources`
WHERE termdate IS NOT NULL AND termdate <= curdate()