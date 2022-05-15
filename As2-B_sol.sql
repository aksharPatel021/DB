
-- Q1a
SELECT 	D.Dname, E.Fname, E.Lname, E.Office 
FROM 	DEPARTMENT D LEFT JOIN EMPLOYEE E ON D.Mgr_ssn=E.Ssn
ORDER BY D.Dname;

-- Q1b
SELECT 	S.Lname, E.Lname 
FROM  	EMPLOYEE S INNER JOIN EMPLOYEE E ON S.Ssn=E.Super_ssn 
ORDER BY S.Lname, E.Lname;

-- Q1c

-- Using IN
SELECT E.Lname 
FROM EMPLOYEE E INNER JOIN DEPENDENT D ON E.Ssn=D.Essn 
WHERE Relationship IN ('Daughter') 
ORDER BY Lname;

-- Using Exists
SELECT Lname
FROM EMPLOYEE JOIN DEPENDENT ON ssn=essn
WHERE EXISTS (SELECT Lname
              FROM EMPLOYEE 
              WHERE Relationship='Daughter');

-- Using sigle block
SELECT 	E.Lname FROM EMPLOYEE E, DEPENDENT D 
WHERE 	E.Ssn=D.Essn AND Relationship='Daughter' 
ORDER BY Lname;

-- Q1d
CREATE VIEW p_hours AS 
SELECT Pno, SUM(Hours) 
FROM WORKS_ON 
GROUP BY Pno;

-- Q1e
SELECT E.Ssn, E.Fname, E.Lname 
FROM EMPLOYEE E INNER JOIN WORKS_ON W ON E.Ssn=W.Essn
WHERE W.Pno=(SELECT Pno 
			FROM p_hours 
			WHERE sum=(SELECT MIN(sum) FROM p_hours));
                       
-- Q2a
WITH XYZ AS ( 
SELECT 	DISTINCT E.Ssn, E.Lname 
FROM 	(EMPLOYEE E INNER JOIN WORKS_ON W ON E.Ssn=W.Essn) 
  			INNER JOIN PROJECT P ON W.Pno=P.Pnumber 
WHERE 	P.Pname IN ('ProductX','ProductY','ProductZ')
)

SELECT 	XYZ.Lname, COUNT(D.Essn) 
FROM 	XYZ LEFT OUTER JOIN DEPENDENT D ON XYZ.Ssn=D.Essn 
GROUP BY XYZ.Lname;

-- Q2b
WITH RECURSIVE SUBORDINATES AS(
(SELECT Ssn, Lname 
 FROM 	EMPLOYEE 
 WHERE 	Ssn='999999999')
UNION
(SELECT E.Ssn, E.Lname 
 FROM 	EMPLOYEE E INNER JOIN SUBORDINATES S 
 			ON E.Super_ssn=S.Ssn)
)
SELECT 	Lname 
FROM 	SUBORDINATES 
WHERE 	Ssn!='999999999' 
ORDER BY Lname;                       
                       
-- Q2c                 
WITH RECURSIVE SUBORDINATES AS(
(SELECT Ssn, Lname, Salary 
 FROM 	EMPLOYEE 
 WHERE Ssn='999999999')
UNION
(SELECT	E.Ssn, E.Lname, E.Salary 
 FROM 	EMPLOYEE E INNER JOIN SUBORDINATES S 
 			ON E.Super_ssn=S.Ssn)
)
SELECT 	SUM(SUBORDINATES.Salary)
FROM 	SUBORDINATES 
WHERE 	Ssn!='999999999';

-- Q2d
WITH RECURSIVE SUBORDINATES(Ssn, Lname, Fname, Bdate) AS(
(SELECT Ssn, Lname, Fname, Bdate 
 FROM 	EMPLOYEE 
 WHERE 	ssn='987654321')
UNION
(SELECT E.Ssn, E.Lname, E.Fname, E.Bdate  
 FROM 	EMPLOYEE E, SUBORDINATES S 
 WHERE 	E.Super_ssn=S.ssn)
)
SELECT 	Fname, Lname 
FROM 	SUBORDINATES WHERE Ssn!='987654321' 
ORDER BY SUBORDINATES.bdate DESC
LIMIT 1;
                       
-- Q2e
WITH RECURSIVE SUPERVISOR(Ssn, Super_ssn, Lname) AS(
(SELECT	Ssn, Super_ssn, Lname 
 FROM 	EMPLOYEE 
 WHERE 	Ssn='101010101')
UNION
(SELECT	E.Ssn, E.Super_ssn, E.Lname 
 FROM 	EMPLOYEE E INNER JOIN SUPERVISOR S ON E.Ssn=S.Super_ssn)
)
SELECT 	Lname 
FROM 	SUPERVISOR 
WHERE 	Ssn!='101010101' AND Super_ssn IS NULL;

-- Q3
WITH RECURSIVE T(N) AS(
(SELECT '*')
UNION
(SELECT CONCAT(N,'*') 
 FROM T 
 WHERE LENGTH(N)<=20)
)
SELECT * 
FROM T;












