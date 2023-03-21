create database task5

use task5

CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Trainees
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

-- 1)  SQL query to get the count of employees in each department.

SELECT COUNT(FIRST_NAME) AS 'EMPLOYEE_COUNT' ,DEPARTMENT FROM Trainees GROUP BY DEPARTMENT

-- 2) SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.

SELECT FIRST_NAME AS NAME, DATEADD(DAY,5,JOINING_DATE) AS 'INDUCTION PROGRAM' FROM Trainees

-- 3)  SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.

SELECT TRAINEE_ID,FIRST_NAME AS 'NAME', CHOOSE(MONTH([JOINING_DATE]),'January','February','March','April','May','June',
      'July','August','September','October','November','December') AS 'JOINING MONTH' FROM Trainees;

-- 4) SQL query to perform the total and subtotal of salary in each department

SELECT COALESCE(DEPARTMENT, 'ALL DEPARTMENT`S TOTAL') AS DEPARTMENT, SUM(SALARY) AS TOTALSALARY
FROM Trainees GROUP BY ROLLUP (DEPARTMENT);

-- 5) SQL query to perform the total and subtotal of salary in each department

SELECT TOP 3 * FROM Trainees ORDER BY NEWID()

-- 6) the working of composite key with any example.
	
CREATE TABLE TEST1
(
STD_ID INT,
STD_NAME VARCHAR(25),
STD_NUMBER BIGINT

PRIMARY KEY(STD_ID,STD_NUMBER)
)

INSERT INTO TEST1 VALUES(100,'SELVA',12345678990),(101,'KANAKARAJ',0987654321)

SELECT * FROM TEST1

INSERT INTO TEST1 VALUES(100,'SELVA',12345678990) -- IT WILL THROW ERROR BCOZ ID AND NUMBER IS A PRIMARY KEY


-- 7) The working of IIF and CASE for the above table.

--IIF

SELECT FIRST_NAME AS NAME,IIF(SALARY > 100000,'SENIOR','JUNIOUR') AS POSITION FROM Trainees;


--CASE

SELECT FIRST_NAME,SALARY,
CASE
		WHEN SALARY >=100000 AND SALARY<=300000 THEN 'SENIOR'
		WHEN SALARY >300000 THEN 'BOARD MEMBERS'
		ELSE 'JUNIOUR'
END AS DESIGNATION
FROM Trainees;

-- 8) the working of Sequence.

CREATE SEQUENCE [dbo].[sequenceobj]
AS INT
START WITH 1
INCREMENT BY 1

create table test
(
std_id int primary key,
std_name varchar(25)
)

insert into test values(NEXT VALUE FOR [dbo].[sequenceobj],'selva'),(NEXT VALUE FOR [dbo].[sequenceobj],'ganapathi'),(NEXT VALUE FOR [dbo].[sequenceobj],'kanakaraj')

select * from test

drop sequence [dbo].[sequenceobj]
drop table test

-- 9) the working of creation of Synonym for a table in DB1 from DB2.

create synonym T for Trainees.dbo.test

select * from T

-- 10) the working of IDENTITY_INSERT.

create table Departments
(
id int IDENTITY (1,1) primary key,
Dept_id int,
Dept_name varchar(25)
)

insert into Departments(Dept_id,Dept_name) values(100,'frontend'),(101,'backend'),(102,'database'),(103,'Testing'),(104,'HR')

-- to explicitly add the values on/off the identity insert

SET IDENTITY_INSERT Departments off 

insert into Departments(Dept_id,Dept_name) values(105,'frontend')

select * from Departments

SET IDENTITY_INSERT Departments on

insert into Departments(id,Dept_id,Dept_name) values(7,105,'frontend')