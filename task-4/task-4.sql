--TRAINEES DATABASE	
create database Trainees


--WORKER TABLE
CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT VARCHAR(25)
)

--WORKER TABLE ENTRIES
INSERT INTO Worker VALUES
(002, 'Niharika', 'Verma', 80000, '2000-02-02', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2000-02-02', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2000-02-02', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2000-02-02', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2000-02-02', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2000-02-02', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2000-02-02', 'Admin')

INSERT INTO Worker VALUES
(001, 'Mahendra singh', 'Dhoni', 85000, '2000-02-02', 'Admin')

--BONOUS TABLE
CREATE TABLE Bonus 
(
WORKER_REF_ID INT, 
BONUS_AMOUNT INT, 
BONUS_DATE DATETIME, 
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
)

--BONOUS TABLE ENTRIES
INSERT INTO Bonus VALUES
(001,	5000,	'2016-02-02'),
(002,	3000,	'2016-06-01'),
(003,	4000,	'2016-02-02'),
(001,	4500,	'2016-02-02'),
(002,	3500,	'2016-06-01')

--TITLE TABLE

CREATE TABLE Title 
(
WORKER_REF_ID INT, 
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
)

--TITLE TABLE ENTRIES
INSERT INTO Title VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00')

SELECT * FROM Worker
SELECT * FROM Bonus
SELECT * FROM Title

-- 1) SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

SELECT FIRST_NAME AS WORKER_NAME FROM Worker 

-- 2) SQL query to fetch “FIRST_NAME” from Worker table in upper case

SELECT UPPER(FIRST_NAME) AS WORKER_NAME FROM Worker 

-- 3) SQL query to fetch unique values of DEPARTMENT from Worker table.

SELECT DISTINCT DEPARTMENT FROM Worker

-- 4) SQL query to print the first three characters of FIRST_NAME from Worker table.

SELECT SUBSTRING (FIRST_NAME,1,3) AS FIRST_NAME from Worker

-- 5)  SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

SELECT DISTINCT DEPARTMENT, LEN(DEPARTMENT) AS LENGTH FROM Worker

-- 6) SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

SELECT CONCAT(FIRST_NAME, ' ' , LAST_NAME) AS FULL_NAME FROM Worker

-- 7) SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

SELECT * FROM Worker WHERE FIRST_NAME='Vipul' or FIRST_NAME='Satish'

-- ANOTHER METHOD
SELECT * FROM Worker WHERE FIRST_NAME IN ('Vipul','Satish')

-- 8) an SQL query to print details of Workers with DEPARTMENT name as “Admin”

SELECT * FROM Worker WHERE DEPARTMENT = 'Admin'

-- 9) an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select * from Worker where FIRST_NAME like '%a'

-- 10)  an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’

SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%';

