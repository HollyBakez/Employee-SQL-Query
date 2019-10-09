/* Number 1 Answer */
SELECT DISTINCT Course_sid AS 'Student ID'
FROM Enrollment
WHERE Course_cid in ( 
	SELECT Course_cid 
	FROM Enrollment
	GROUP BY Course_cid HAVING count(Course_sid) >1
);

/* Number 2 Answer */ 
SELECT s.Sid,
	COUNT(DISTINCT CASE WHEN ec.Course_sid <> s.Sid THEN ec.Course_sid END) AS 'Total Number of Different Classmates'
FROM 
	Student s LEFT JOIN 
	Enrollment e
	ON e.Course_sid = s.Sid LEFT JOIN
	Enrollment  ec
	ON ec.Course_cid = e.Course_cid
GROUP BY s.sid;
/* Number 3 */
SELECT AVG(Hours)
FROM WORKS_ON 
WHERE Dno

/* Number 4 */ 
SELECT Fname + ' ' + Lname AS 'Employees'
FROM Employee 
WHERE Dno = (
	SELECT Dno 
	FROM Employee
	WHERE Ssn = (
		SELECT Essn
		FROM (
			SELECT TOP 1 Essn,
			SUM(Hours) AS Total_Hours
			FROM WORKS_ON 
			GROUP BY Essn 
			ORDER BY Total_Hours
		DESC
		) AS SQ
	)
);