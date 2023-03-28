CREATE DATABASE TASK10

USE TASK10

CREATE TABLE employees (
  EMPLOYEE_ID INT PRIMARY KEY IDENTITY (1,1),
  FIRST_NAME VARCHAR(25) NOT NULL,
  LAST_NAME VARCHAR(25) NOT NULL,
  EMAIL VARCHAR(50) UNIQUE,
  PHONE_NUMBER VARCHAR(20),
  HIRE_DATE DATETIME,
  JOB_ID VARCHAR(10),
  SALARY DECIMAL(10,2)
);


INSERT INTO employees (FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY) VALUES
('Selva','Ganapathi','selva.ganapathik@gmail.com',1234567890,'2023-01-12 09:38:00','emp_1',100000),
('Dhana','Prakash','dhana@gmail.com',9807654321,'2022-09-12 09:34:00','emp_3',73000),
('Arun','Joesph','arun.@gmail.com',1234509876,'2023-01-03 09:30:00','emp_2',23000),
('Arjun','venkitraman','arjunk@gmail.com',1290345678,'2023-01-31 09:30:00','emp_6',50000),
('Vignesh','Kumar','vicky@gmail.com',9218076543,'2022-01-12 09:38:00','emp_5',33000),
('Dhivya','prakash','divi@gmail.com',9876123450,'2023-11-03 09:00:00','emp_4',73000),
('Ranita','Nagarajan','ranita@gmail.com',5678901234,'2023-01-23 09:30:00','emp_7',100000),
('Yamini','.','yam@gmail.com',9832107654,'2023-09-12 09:34:00','emp_8',73000),
('Harishmitha','.','harish.@gmail.com',9876123450,'2023-06-03 09:30:00','emp_10',23000),
('Harita','Nagarajan','hari@gmail.com',9034567812,'2023-03-31 09:30:00','emp_9',50000),
('Shri','Kanth','sri@gmail.com',9543218076,'2023-01-12 09:38:00','emp_11',33000),
('Priya','Dharshan','priya@gmail.com',9123450876,'2023-11-03 09:00:00','emp_12',73000),
('Vikram','R','vikram@gmail.com',9012345678,'2023-11-23 09:30:00','emp_13',49000),
('Vasanth','Kumar','Vasanth@gmail.com',9832076541,'2022-10-12 09:34:00','emp_14',53000),
('Hari','Karthi','hari.@gmail.com',9812345076,'2023-01-03 09:30:00','emp_15',13000),
('Sharon','David','sharon@gmail.com',4512903678,'2022-01-31 09:30:00','emp_16',30000),
('siva','bharath','siva@gmail.com',9765421803,'2022-01-02 09:38:00','emp_17',33000),
('Karthi','keyan','karthi@gmail.com',9861273450,'2023-10-03 09:00:00','emp_18',73000),
('Hemanth','.','hema@gmail.com',9012567834,'2023-01-23 09:30:00','emp_19',20000),
('Hashan','.','harshan@gmail.com',9807632154,'2023-01-12 09:38:00','emp_20',73000)

SELECT * FROM employees 

-- 1) Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE SALARY > (SELECT SALARY FROM employees WHERE EMPLOYEE_ID = 16)

-- 2) Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID.

SELECT FIRST_NAME,LAST_NAME,JOB_ID
FROM employees
WHERE HIRE_DATE = (SELECT HIRE_DATE FROM employees WHERE EMPLOYEE_ID= 11)

-- 3) Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME
FROM employees 
WHERE SALARY > (SELECT AVG(SALARY) FROM employees)

SELECT * FROM employees

-- 4) Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.

SELECT FIRST_NAME,LAST_NAME,EMPLOYEE_ID,SALARY
FROM employees
WHERE FIRST_NAME = (SELECT FIRST_NAME FROM employees WHERE FIRST_NAME = 'Yamini')

-- 5) Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.

SELECT * FROM
employees 
WHERE SALARY BETWEEN (SELECT MIN(SALARY) FROM employees) and 25000 -- insted of 2500 i used 25000 just to see the working bcoz i dont have salary below 10000