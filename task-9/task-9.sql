CREATE DATABASE TASK9

USE TASK9

CREATE TABLE STUDENT
(
STD_ID INT PRIMARY KEY,
STD_NAME VARCHAR(25),
SEMESTER VARCHAR(15),
SEC_MARK INT,
TOTAL INT
)

INSERT INTO STUDENT VALUES
	   (1, 'John Smith', 'Sem-1', 85, 175),
       (2, 'Jane Doe', 'Sem-2', 90, 180),
       (3, 'Bob Johnson', 'Sem-3', 80, 170),
       (4, 'Sarah Lee', 'Sem-2', 95, 190),
       (5, 'David Kim', 'Sem-1', 87, 177),
       (6, 'Emily Chen', 'Sem-3', 92, 184),
       (7, 'Michael Jones', 'Sem-3', 89, 179),
       (8, 'Jessica Wang', 'Sem-2', 93, 186)

-- 1) Write a Stored Procedure in SQL using conditional statements to search for a record from the students 
--    table (created in SQL Task 8) based on studentname column.

CREATE PROCEDURE sp_name(@NAME VARCHAR(25))
AS 
BEGIN
IF((SELECT STD_NAME FROM STUDENT WHERE STD_NAME=@NAME)=@NAME)
PRINT 'THE STUDENT '+@NAME+' IS AVAILABLE'
ELSE
PRINT 'SORRY STUDENT NOT AVAILABLE IN THE RECORD'
END

sp_name 'selva'
sp_name 'John Smith'

-- 2)  Write a Stored procedure in SQL to give remarks for the secured marks column in the students table 
--     (created in SQL Task 8) using CASE statement.

CREATE PROCEDURE sp_remark
AS 
SELECT STD_NAME,TOTAL,
CASE
    WHEN TOTAL >= 190 THEN 'VERY GOOD..!'
	WHEN TOTAL >= 180 THEN 'GOOD TRY TO GET ABOVE 190'
	ELSE 'TRY TO WORK HARD'
END AS REMARKS
FROM STUDENT;

EXEC sp_remark

-- 3)  Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)

-- LOCAL VARIABLE 

DECLARE @X INT
DECLARE @Y INT
SET @X=10
SET @Y=5

SELECT (@X + @Y) AS ADDITION

-- GLOBAL VARIABLE 

DECLARE @@X INT
DECLARE @@Y INT
SET @@X=10
SET @@Y=5

SELECT (@@X * @@Y) AS MULTIPLY

-- TEMPORARY TABLE 

CREATE TABLE ##TEMP_TABLE
(
ID INT,
NAME VARCHAR(20)
)

INSERT INTO ##TEMP_TABLE VALUES (1,'SELVA')

-- TEMP PROCEDURE

CREATE PROCEDURE ##sp_temp
AS 
BEGIN
SELECT * FROM ##TEMP_TABLE 
END

EXEC ##sp_temp



