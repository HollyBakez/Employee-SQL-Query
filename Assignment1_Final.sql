/* Number 1 Answer */
SELECT DISTINCT Course_sid AS 'Student ID'
FROM Enrollment
WHERE Course_cid in ( 
	SELECT Course_cid 
	FROM Enrollment
	GROUP BY Course_cid HAVING count(Course_sid) >1
);