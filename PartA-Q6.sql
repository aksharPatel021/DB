
-- 6a
SELECT 	 * 
FROM 	 STUDENT 
ORDER BY lastName, firstName;

-- 6b
SELECT	 houseName, animal, trait 
FROM 	 HOUSE 
ORDER BY houseName DESC;

-- 6c
SELECT 	 title 
FROM 	 SUBJECT 
WHERE 	 title LIKE '%tion%';

-- 6d
SELECT 	 lastName 
FROM 	 STUDENT JOIN ENROLMENT ON sId=studentId
WHERE 	 subjectId=8 
ORDER BY houseId, lastName;

-- 6e
(SELECT  firstName, lastName 
 FROM 	 STUDENT JOIN HOUSE ON houseId=hId
 WHERE 	 houseName='Gryffindor')
UNION
(SELECT  firstName, lastName 
 FROM 	 TEACHER JOIN HOUSE ON houseId=hId
 WHERE 	 houseName='Gryffindor');
