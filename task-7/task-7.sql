create database task7_

use task7_

--STUDENT TABLE

CREATE TABLE STUDENT
(
STUDENT_ID INT IDENTITY(1,1) PRIMARY KEY,
STUDENT_NAME VARCHAR(25),
DEPARTMENT VARCHAR(15),
SCORE INT
)

--STUDENT TABLE  VALUES

INSERT INTO STUDENT VALUES ('John Smith', 'IT', 85),('Jane Doe', 'CT', 92),('Michael Lee', 'BCA', 78),
('Sarah Kim', 'Chemistry', 89),('David Wong', 'BCOM', 76),('Emily Chen', 'Physics', 94),('Tom Wilson', 'IT', 81),
('Ava Hernandez', 'CT', 87),('Ethan Davis', 'BCA', 73),('Liam Brown', 'Chemistry', 91),('Olivia Garcia', 'BCOM', 85),
('Sophia Rodriguez', 'Physics', 88),('Noah Martinez', 'IT', 77),('Isabella Jackson', 'CT', 90),('Mia Perez', 'BCA', 82),
('Charlotte Taylor', 'Chemistry', 94),('Benjamin Anderson', 'BCOM', 79),('Lucas Thomas', 'Physics', 86),('Evelyn Martin', 'IT', 88),
('William White', 'CT', 83),('Harper Thompson', 'BCA', 90),('James Harris', 'Chemistry', 76),('Amelia Young', 'BCOM', 91),
('Logan Scott', 'Physics', 84),('Natalie Allen', 'IT', 79)

SELECT * FROM STUDENT

-- 1) Create a non-clustered index for department.

CREATE NONCLUSTERED INDEX DEP_NC ON STUDENT(DEPARTMENT);

-- 2) Create a filtered index for department='BCA'

CREATE NONCLUSTERED INDEX DEP_BCA ON STUDENT(DEPARTMENT)WHERE DEPARTMENT='BCA';

-- 3) Create a view for students in BCA department.

CREATE VIEW BCA_DEPT 
AS
SELECT * FROM 
STUDENT WHERE DEPARTMENT='BCA'

SELECT * FROM BCA_DEPT

-- 4) Apply Rank() for all the students based on score.

SELECT STUDENT_ID,STUDENT_NAME,DEPARTMENT,SCORE,
RANK () OVER(ORDER BY SCORE DESC) AS RANK
FROM STUDENT;

-- 5) Apply Dense_Rank() for students in each department based on score.

SELECT *,
DENSE_RANK () OVER(PARTITION BY DEPARTMENT ORDER BY SCORE DESC) AS RANK
FROM STUDENT;

--------------------------------------------------------------------------------------------------------------------------------

--MANAGER TABLE

CREATE TABLE MANAGER
(
MANAGER_ID INT PRIMARY KEY,
MANAGER_NAME VARCHAR(25)
)

--MANAGER VALUES

INSERT INTO MANAGER VALUES(1,'Peter'),(2,'Tony stark'),(3,'Strange'),(4,'Wanda'),(5,'Smith')

--EMPLOYEE TABLE

CREATE TABLE EMPLOYEE
(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(25),
M_ID INT REFERENCES MANAGER(MANAGER_ID)
)

--EMPLOYEE VALUES

INSERT INTO EMPLOYEE VALUES (101,'Adam',3),(102,'Sazham',2),(103,'Moon knight',1),(104,'Panther',4),(105,'Hulk',5)

-- COMPLEX VIEW

CREATE VIEW MAN_EMP
AS
SELECT M.MANAGER_ID,M.MANAGER_NAME,E.EMP_ID,E.EMP_NAME FROM 
MANAGER AS M
FULL JOIN
EMPLOYEE AS E
ON M.MANAGER_ID=E.M_ID

SELECT * FROM MAN_EMP

--ON DELETE CASCADE ON UPDATE SET DEFAULT

--drop constraints 
ALTER TABLE EMPLOYEE DROP CONSTRAINT FK__EMPLOYEE__M_ID__5535A963

--DROP THE COLUMN
ALTER TABLE EMPLOYEE DROP COLUMN M_ID

--add constraint (on delete cascade on update set default)
ALTER TABLE EMPLOYEE ADD M_ID INT DEFAULT 3 CONSTRAINT FK__EMPLOYEE__M_ID__ FOREIGN KEY (M_ID) REFERENCES MANAGER(MANAGER_ID) ON DELETE CASCADE ON UPDATE SET DEFAULT 

SELECT * FROM EMPLOYEE
SELECT * FROM MANAGER

UPDATE EMPLOYEE SET M_ID = 3 WHERE EMP_ID=101
UPDATE EMPLOYEE SET M_ID = 2 WHERE EMP_ID=103
UPDATE EMPLOYEE SET M_ID = 5 WHERE EMP_ID=105
UPDATE EMPLOYEE SET M_ID = 1 WHERE EMP_ID=102
UPDATE EMPLOYEE SET M_ID = 4 WHERE EMP_ID=104

--UPDATE

UPDATE MANAGER SET MANAGER_ID=6 WHERE MANAGER_ID=5;

--DELETE 

DELETE FROM MANAGER WHERE MANAGER_ID=6

DELETE FROM MANAGER WHERE MANAGER_ID=3


