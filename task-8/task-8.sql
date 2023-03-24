create database task8

use task8

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

-- 1) Scalar funtion to get the percentage

ALTER FUNCTION FN_PER(@SEC_MARK INT,@TOTAL INT)
RETURNS INT
AS
BEGIN
    DECLARE @PERCENTAGE INT
    SELECT @PERCENTAGE = (SEC_MARK * 100)/TOTAL FROM STUDENT WHERE SEC_MARK = @SEC_MARK AND TOTAL = @TOTAL
    RETURN @PERCENTAGE
END


SELECT STD_ID, STD_NAME,SEMESTER, SEC_MARK, TOTAL, dbo.FN_PER(SEC_MARK, TOTAL) AS PERCENTAGE
FROM STUDENT

-- 2) USER-DEFINED FUNCTION TO GET SEM 3 RESULTS

CREATE FUNCTION FN_SEM3()
RETURNS TABLE
AS
RETURN (SELECT * FROM STUDENT WHERE SEMESTER='Sem-3')

SELECT * FROM dbo.FN_SEM3()


-- 3) PROCEDURE TO RETRIVE STUDENTS DATA

CREATE PROCEDURE sp_stddata
AS 
BEGIN
SELECT * FROM STUDENT ORDER BY TOTAL
END

exec sp_stddata

-- 4) PROCEDURE TO RETRIVE SEM-1 DATA

CREATE PROCEDURE sp_stdsem1(@SEMESTER VARCHAR(15))
AS 
BEGIN
SELECT * FROM STUDENT WHERE SEMESTER=@SEMESTER
END

EXEC sp_stdsem1 'Sem-1'

-- 5) OUTPUT PARAMETER TO RETRIVE TOTAL NUMBER OF STUDENTS


CREATE PROCEDURE sp_totalstd(@TotalStudents INT OUTPUT)   
AS
BEGIN
    SELECT @TotalStudents = COUNT(*) FROM STUDENT
END

DECLARE @TotalStudents INT
EXEC sp_totalstd @TotalStudents OUTPUT
SELECT @TotalStudents AS TotalStudents

-- 6) MERGE TABLES

SELECT * INTO STUDENT_BACKUP FROM STUDENT 

SELECT * FROM STUDENT
SELECT * FROM STUDENT_BACKUP

MERGE STUDENT_BACKUP T
	USING STUDENT S
ON (S.SEMESTER = 'Sem-1')
WHEN MATCHED 
	THEN UPDATE SET
	    T.STD_ID = S.STD_ID,
		T.STD_NAME = S.STD_NAME,
		T.SEMESTER = S.SEMESTER,
		T.SEC_MARK = S.SEC_MARK,
		T.TOTAL = S.TOTAL
WHEN NOT MATCHED BY TARGET
	THEN INSERT(STD_ID,STD_NAME,SEMESTER,SEC_MARK,TOTAL)
	VALUES (S.STD_ID,S.STD_NAME,S.SEMESTER,S.SEC_MARK,S.TOTAL)
WHEN NOT MATCHED BY SOURCE
	THEN DELETE;


