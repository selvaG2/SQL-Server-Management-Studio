create database practice

--Create table
CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

--Select 
select * from Trainees

--insert
insert into Trainees values(1,'Selva','ganapathi',28000,'2023-01-23 9:30:00','Full-stack developer')
insert into Trainees values(2,'dhana','prakash',25000,'2023-01-23 9:30:00','Designer')
insert into Trainees values(3,'Arun','joesph',27000,'2023-01-23 9:30:00','Developer')
insert into Trainees values(4,'venkit','raman',20000,'2023-01-23 9:30:00','Designer')
insert into Trainees values(5,'Vignesh','kumar',22000,'2023-01-23 9:30:00','Tester')
insert into Trainees values(6,'divya','prakash',18000,'2023-01-23 9:30:00','Tester')
insert into Trainees values(7,'Ranita','.',25000,'2023-01-23 9:30:00','Developer')
insert into Trainees values(8,'harishmitha','.',28000,'2023-01-23 9:30:00','Full-stack developer')
insert into Trainees values(9,'Yamini','.',24000,'2023-01-23 9:30:00','Developer')
insert into Trainees values(10,'harita','.',27000,'2023-01-23 9:30:00','Developer')
insert into Trainees values(11,'Sri','kanth',23000,'2023-01-23 9:30:00','Full-stack developer')
insert into Trainees values(12,'Priya','darshan',28000,'2023-01-23 9:30:00','Developer')
insert into Trainees values(13,'Vikram','.',24000,'2023-01-23 9:30:00','Full-stack developer')
insert into Trainees values(14,'Vasanth','kumar',28000,'2023-01-23 9:30:00','Developer')
insert into Trainees values(15,'Hari','karthi',22000,'2023-01-23 9:30:00','Designer')
insert into Trainees values(16,'sharon','ganapathi',15000,'2023-01-23 9:30:00','Traineer')
insert into Trainees values(17,'Siva','bharath',18000,'2023-01-23 9:30:00','Tester')
insert into Trainees values(18,'Karthi','keyan',21000,'2023-01-23 9:30:00','Full-stack developer')
insert into Trainees values(19,'hemanth','.',28000,'2023-01-23 9:30:00','Full-stack developer')
insert into Trainees values(20,'Harsha','S',25000,'2023-01-23 9:30:00','Designer')

--between
select FIRST_NAME,SALARY from Trainees where SALARY between 20000 and 50000

--like
select FIRST_NAME from Trainees where FIRST_NAME like '%i'

--distinct
select distinct SALARY from Trainees

--or
select FIRST_NAME,DEPARTMENT from Trainees where DEPARTMENT='Developer' or DEPARTMENT='Designer'order by DEPARTMENT desc

--relational operator
select * from Trainees where Trainee_ID<5

--offset & fetch
select * from Trainees order by Trainee_ID offset 5 rows fetch next 10 rows only

--tie with top
select top 5 with ties * from Trainees order by SALARY 

--desc
select Trainee_ID,FIRST_NAME,DEPARTMENT from Trainees order by DEPARTMENT desc

--like
select LAST_NAME from Trainees where LAST_NAME like '__a%'

--like 
select FIRST_NAME from Trainees where FIRST_NAME='Siva' COLLATE SQL_Latin1_General_CP1_CS_AS;
select FIRST_NAME from Trainees where FIRST_NAME='siva' COLLATE SQL_Latin1_General_CP1_CS_AS;



insert into Trainees values(21,'siva','kumar',18000,'2023-01-23 9:30:00','Tester')


