CREATE DATABASE TASK14

USE TASK14

CREATE TABLE HOBBIES
(
HOBBY_ID INT PRIMARY KEY,
HOBBY_NAME VARCHAR(25) UNIQUE
)

-- A) 1. insert records into the table using a stored procedure.

ALTER PROCEDURE sp_insert @ID INT ,@NAME VARCHAR(25)
AS
BEGIN
 SET NOCOUNT ON;
	INSERT INTO HOBBIES(HOBBY_ID,HOBBY_NAME)
			VALUES (@ID, @NAME)
	SELECT * FROM HOBBIES
END

EXEC sp_insert 1,'READING'

-- 2. insert duplicate records into the table and show the working of exception handling using Try/catch blocks.

CREATE PROCEDURE sp_duplicate @ID INT ,@NAME VARCHAR(25)
AS
BEGIN
	BEGIN TRY
		INSERT INTO HOBBIES(HOBBY_ID,HOBBY_NAME)
			VALUES (@ID, @NAME)
		SELECT * FROM HOBBIES
	END TRY

	BEGIN CATCH
		PRINT('DUPLICATE FOUND YOU CAN`T INSERT')
	END CATCH
END

EXEC sp_duplicate 1,'READING'

-- 3. Store the error details in an errorbackup table.

CREATE TABLE ERR_TABLE
(ErrorID INT IDENTITY(1, 1),
 UserName  VARCHAR(50),
 ErrorNumber INT,
 ErrorState INT,
 ErrorSeverity INT,
 ErrorLine INT,
 ErrorProcedure VARCHAR(200),
 ErrorMessage VARCHAR(200),
 ErrorDateTime DATETIME
)

CREATE PROCEDURE sp_err @ID INT ,@NAME VARCHAR(25)
AS
BEGIN
	BEGIN TRY
		INSERT INTO HOBBIES(HOBBY_ID,HOBBY_NAME)
			VALUES (@ID, @NAME)
		SELECT * FROM HOBBIES
	END TRY

	BEGIN CATCH
		INSERT INTO dbo.ERR_TABLE 
		VALUES(SUSER_SNAME(),
		ERROR_NUMBER(),
		ERROR_STATE(),
		ERROR_SEVERITY(),
		ERROR_LINE(),
		ERROR_PROCEDURE(),
		ERROR_MESSAGE(),
		GETDATE());
	END CATCH
END

EXEC sp_err 1,'READING'

SELECT * FROM ERR_TABLE

-------------------------------------------------------------------------------

-- b. Create a procedure to accept 2 numbers, if the numbers are equal then calculate the product else 
-- use RAISERROR to show the working of exception handling.

CREATE PROCEDURE sp_product @NUM1 INT , @NUM2 INT
AS 
BEGIN
	DECLARE @RESULT INT
	SET @RESULT=0

	BEGIN TRY
		IF @NUM1 != @NUM2
		BEGIN
			RAISERROR ('BOTH THE NUMBERS ARE NOT EQUAL',16,1)
		END
		ELSE
		BEGIN
			SET @RESULT=@NUM1*@NUM2
			PRINT 'THE PRODUCT OF TWO NUMBER IS '+CAST(@RESULT AS VARCHAR(10))
		END
	END TRY
	BEGIN CATCH
		PRINT ERROR_NUMBER()
		PRINT ERROR_MESSAGE()
		PRINT ERROR_SEVERITY()
		PRINT ERROR_STATE()
	END CATCH
END

EXEC sp_product 5,5

---------------------------------------------------------------------------------------

-- C. Create a table Friends(id(identity), name (uk)) and insert records into the table using a stored procedure.

CREATE TABLE FRIENDS
(
ID INT IDENTITY(1,1),
F_NAME VARCHAR(25)
)

CREATE PROCEDURE sp_frndsinsert @NAME VARCHAR(25)
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		
		IF @NAME LIKE '[ADHKPRSTVY]%'
			BEGIN
				INSERT INTO FRIENDS(F_NAME)
				VALUES (@NAME)

				SELECT * FROM FRIENDS
			END
		ELSE
			BEGIN
				PRINT 'NAME SHOULD START WITH A,D,H,K,P,R,S,T,V,Y'
			END
	END TRY

	BEGIN CATCH

		PRINT 'ERROR OCCURRED'

	END CATCH
END

EXEC sp_frndsinsert 'selva'k-
EXEC sp_frndsinsert 'baskar'
