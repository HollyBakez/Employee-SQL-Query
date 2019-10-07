SELECT Pnumber, Dnum, Lname, Address, Bdate
FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE Dnum = Dnumber AND Mgr_ssn = Ssn 
AND Plocation = 'Stafford';
/*
bad practice ^^^^^

good practice  vvvvvv
*/



/*
 Column in single line after SELECTING 

*/
SELECT 
	p.Pnumber, 
	p.Dnum, 
	e.Lname, 
	e.Address, 
	e.Bdate

FROM dbo.PROJECT AS p
	INNER JOIN dbo.DEPARTMENT AS d 
	ON p.Dnum = d.Dnumber 
	INNER JOIN dbo.EMPLOYEE AS e
	ON d.Mgr_ssn = e.ssn 
WHERE p.Plocation = 'Stafford';