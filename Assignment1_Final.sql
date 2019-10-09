/* 
Holland Ho 
CPSC 332
Assignment 1 SQL Script 
10/8/19
*/

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

/* Number 3 Answer */
SELECT e.Ssn, d.Dnumber, p.Pname, p.Pnumber, AVG(w.Hours) AS 'Average hours per project'
FROM EMPLOYEE AS e
INNER JOIN DEPARTMENT AS d
ON e.Dno = d.Dnumber
INNER JOIN PROJECT AS p
ON p.Dnum = d.Dnumber
INNER JOIN WORKS_ON AS w
ON w.Pno = p.Pnumber 
GROUP BY e.Ssn, d.Dnumber, p.Pname, p.Pnumber;

/* Number 4 Answer */ 
SELECT e.Fname, e.Lname
FROM EMPLOYEE AS e
INNER JOIN DEPARTMENT AS d
ON d.Dnumber = e.Dno
INNER JOIN PROJECT AS p
ON p.Dnum = d.Dnumber 
INNER JOIN WORKS_ON AS w
ON w.Pno = p.Pnumber 
GROUP BY Fname, Lname;

/* Number 5 */
SELECT a.Fname, a.Lname, a.Dnumber, a.NumOfProjects,
RANK() OVER (ORDER BY NumOfProjects ASC) AS PRank
FROM (
	SELECT e.Fname, e.Lname, d.Dnumber,
	COUNT(p.Pnumber) AS NumOfProjects
	FROM EMPLOYEE AS e
	INNER JOIN DEPARTMENT AS d
	ON e.Dno = d.Dnumber
	INNER JOIN PROJECT AS p
	ON p.Dnum = d.Dnumber
	GROUP BY e.Fname, e.Lname, d.Dnumber
) AS a;