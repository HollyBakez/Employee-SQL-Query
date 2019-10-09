CREATE TABLE Student (
	Sname VARCHAR(20) NOT NULL,
	Sid CHAR(9) NOT NULL,
	CONSTRAINT PK_STUDENT PRIMARY KEY (Sid)
);

CREATE TABLE Course (
	Cname VARCHAR(20) NOT NULL,
	Cid Char(9) NOT NULL,
	CONSTRAINT PK_COURSE PRIMARY KEY (Cid)
);

/* Enrollment encodes students based on the sid and cid */
CREATE TABLE Enrollment (
	Course_cid CHAR(9) NOT NULL,
	Course_sid CHAR(9) NOT NULL,
	CONSTRAINT FK_ENROLLMENT_COURSE FOREIGN KEY (Course_cid) REFERENCES Course (Cid),
	CONSTRAINT FK_ENROLLMENT_STUDENT FOREIGN KEY (Course_sid) REFERENCES Student (Sid)
);

INSERT INTO Student( Sname, Sid)
VALUES 
	('Richard',123456678),
	('Kevin',776543213),
	('Nam',434567876),
	('Sheong',887122344),
	('Ryan',122334556),
	('Richy',456654765),
	('Oofer', 000111222);

INSERT INTO Course (Cname, Cid)
VALUES 
	('BIO 101', 2334),
	('CPSC 121', 1227),
	('CPSC 254', 1225),
	('MATH 150A', 1502);

INSERT INTO Enrollment(Course_sid, Course_cid)
VALUES 
	(123456678, 2334),
	(123456678, 1227),
	(776543213, 2334),
	(434567876, 2334),
	(887122344, 1225),
	(434567876, 1225),
	(122334556, 1502),
	(456654765,1227);


SELECT * FROM Course 

SELECT * FROM Student 

SELECT * FROM Enrollment



/*------ Number 1 Answer ------*/
SELECT DISTINCT Course_sid AS 'Student ID'
FROM Enrollment
WHERE Course_cid in ( 
	SELECT Course_cid 
	FROM Enrollment
	GROUP BY Course_cid HAVING count(Course_sid) >1
);
/*------------------ */	
/* Test case 1, inserting another classmate */
INSERT INTO Student( Sname, Sid)
VALUES 
	('Oofer', 333111222);

INSERT INTO Enrollment(Course_sid, Course_cid)
VALUES
	(333111222, 1502);
                        
/* Number 2 */
/* student id | number of classmates total*/

SELECT * FROM Enrollment 
/* Answer Works */
SELECT s.Sid,
	COUNT(DISTINCT CASE WHEN ec.Course_sid <> s.Sid THEN ec.Course_sid END) AS 'Total Number of Different Classmates'
FROM 
	Student s LEFT JOIN 
	Enrollment e
	ON e.Course_sid = s.Sid LEFT JOIN
	Enrollment  ec
	ON ec.Course_cid = e.Course_cid
GROUP BY s.sid;

INSERT INTO Student (Sname, Sid)
VALUES
	('Monkas', 887999888);

INSERT INTO Course (Cname, Cid)
VALUES 
	('POSC 100', 2145);

INSERT INTO Enrollment (Course_cid, Course_sid)
VALUES
	(2145, 887999888);

