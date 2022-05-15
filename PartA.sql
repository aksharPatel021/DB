
-- Q2
INSERT INTO STUDENT (firstName, lastName, houseId) VALUES ('Tom', 'Riddle', 1);
INSERT INTO SUBJECT (title) VALUES ('Data Structures and Incantations');

-- Q3
CREATE TABLE ENROLMENT (
	studentId	INT		NOT NULL,
	subjectId	INT		NOT NULL,
	PRIMARY KEY (studentId, subjectId),
	FOREIGN KEY (studentId) REFERENCES STUDENT(sId),
	FOREIGN KEY (subjectId) REFERENCES SUBJECT(subjectId)
);

CREATE TABLE TEACHING (
	subjectId	INT		NOT NULL,
	teacherId	INT		NOT NULL,
	PRIMARY KEY (subjectId, teacherId),
	FOREIGN KEY (subjectId) REFERENCES SUBJECT(subjectId),
	FOREIGN KEY (teacherId) REFERENCES TEACHER(tId)
);

-- Q4a
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (13, 3);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (1, 8);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (1, 9);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (2, 8);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (2, 9);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (3, 8);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (3, 9);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (10, 8);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (10, 6);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (11, 8);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (11, 6);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (12, 8);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (12, 6);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (2, 14);
INSERT INTO ENROLMENT (studentId, subjectId) VALUES (10, 14);

-- Q4b
INSERT INTO TEACHING (teacherId, subjectId) VALUES (8, 8);
INSERT INTO TEACHING (teacherId, subjectId) VALUES (8, 14);
INSERT INTO TEACHING (teacherId, subjectId) VALUES (6, 9);
INSERT INTO TEACHING (teacherId, subjectId) VALUES (9, 6);