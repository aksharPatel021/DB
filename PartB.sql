
-- Q1
SELECT 	 AVG(salary)
FROM	 EMPLOYEE LEFT OUTER JOIN DEPENDENT ON Ssn=Essn
WHERE 	 Essn IS NULL;

-- Q2
SELECT 	 S.Fname, S.Lname
FROM 	 EMPLOYEE AS E RIGHT OUTER JOIN EMPLOYEE AS S ON E.Super_ssn=S.ssn
WHERE 	 E.Fname IS NULL
ORDER BY S.bdate LIMIT 1;

-- ALT

SELECT 	 Fname, Lname
FROM 	 EMPLOYEE
WHERE 	 bdate = (SELECT MIN(S.bdate)
				  FROM 	 EMPLOYEE AS E RIGHT OUTER JOIN EMPLOYEE AS S ON E.Super_ssn=S.ssn
				  WHERE  E.Fname IS NULL);

-- Q3
SELECT 	 S.Lname, COUNT(E.Ssn) AS COUNT_SUBS
FROM 	 EMPLOYEE AS S LEFT OUTER JOIN EMPLOYEE AS E ON S.Ssn=E.Super_ssn
GROUP BY S.Lname, S.Ssn
ORDER BY COUNT_SUBS DESC, S.lname;

-- Q4
SELECT 	 Dname, AVG(Salary) AS AVG_SALARY
FROM 	 DEPARTMENT INNER JOIN EMPLOYEE ON Dnumber=Dno
GROUP BY Dname 
ORDER BY Dname;

-- Q5
SELECT 	 Fname, Lname
FROM 	 EMPLOYEE AS E INNER JOIN (SELECT 	Dno, AVG(Salary) AS AVG_SALARY 
								   FROM 	DEPARTMENT INNER JOIN EMPLOYEE ON Dnumber=Dno 
								   GROUP BY Dno) AS D ON E.dno=D.dno
WHERE 	 E.Salary >= D.AVG_SALARY;

-- Q6
SELECT 	 Fname, Hours
FROM 	 EMPLOYEE JOIN (SELECT	Mgr_ssn, Dnumber, Pnumber
						FROM 	DEPARTMENT JOIN PROJECT ON Dnumber=Dnum 
						WHERE 	Pname='ProductY') AS DP ON Ssn=DP.Mgr_ssn
								JOIN WORKS_ON ON Ssn=Essn AND Pnumber=Pno;
                                
-- Q7
SELECT 	 Fname, Ssn, SUM(Hours) AS TOTAL_HOURS
FROM	 EMPLOYEE JOIN WORKS_ON ON Ssn=Essn
GROUP BY Ssn 
HAVING 	 SUM(Hours) < 40 OR SUM(Hours) IS NULL;

-- Q8
SELECT 	 Pname, SUM(Hours) AS TOTAL_HOURS
FROM 	 PROJECT JOIN WORKS_ON ON pnumber=pno
GROUP BY Pnumber
HAVING 	 SUM(Hours) > 50;

-- Q9
SELECT 	 Pname 
FROM	 PROJECT JOIN WORKS_ON ON Pnumber=Pno
GROUP BY Pname 
HAVING 	 COUNT(Essn) >= 3
ORDER BY Pname;

-- Q10
SELECT 	 Lname, Dependent_name
FROM 	 DEPENDENT D INNER JOIN 
				(SELECT 	Essn, MIN(bdate) as Bdate 
				 FROM 		DEPENDENT 
				 GROUP BY 	Essn) as R ON D.essn=R.essn 
		INNER JOIN EMPLOYEE e on d.essn=e.ssn AND d.bdate=r.bdate 			
ORDER BY dependent_name;










