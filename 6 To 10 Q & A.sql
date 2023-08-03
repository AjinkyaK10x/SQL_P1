SELECT * FROM project_hr.`human resources`;

-- 6. How does the gender distribution vary acorss dept. and job titles

SELECT department,jobtitle,gender,COUNT(*) AS count
FROM project_hr.`human resources`
WHERE termdate IS NOT NULL
GROUP BY department, jobtitle,gender
ORDER BY department, jobtitle,gender;


SELECT department,gender,COUNT(*) AS count
FROM project_hr.`human resources`
WHERE termdate IS NOT NULL
GROUP BY department,gender
ORDER BY department,gender;


-- 7. What is the distribution of jobtitles acorss the company
SELECT jobtitle, COUNT(*) AS count
FROm project_hr.`human resources`
WHERE termdate IS NULL
GROUP BY jobtitle;


-- 8. Which dept has the higher turnover/termination rate


SELECT department,
		COUNT(*) AS total_count,
        COUNT(CASE
				WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1 
				END) AS terminated_count,
		ROUND((COUNT(CASE
					WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1 
                    END)/COUNT(*))*100,2) AS termination_rate
		FROM project_hr.`human resources`
        GROUP BY department
        ORDER BY termination_rate DESC;
        
-- 9. What is the distribution of employees across location_state
SELECT location_state, COUNT(*) AS count
FROm project_hr.`human resources`
WHERE termdate IS NULL
GROUP BY location_state;

SELECT location_city, COUNT(*) AS count
FROm project_hr.`human resources`
WHERE termdate IS NULL
GROUP BY location_city;

-- 10. What is the tenure distribution for each dept.
SELECT department, round(avg(datediff(termdate,hire_date)/365),0) AS avg_tenure
FROM project_hr.`human resources`
WHERE termdate IS NOT NULL AND termdate<= curdate()
GROUP BY department;