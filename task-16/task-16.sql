CREATE DATABASE task16

USE TASK16

CREATE TABLE DEMO 
(
ID INT PRIMARY KEY,
NAME VARCHAR(25)
)

INSERT INTO DEMO VALUES (1,'SELVA'),(2,'GANAPATHI')

-- 1) Create a DML trigger to restrict DML operations on Saturday and Sunday.

CREATE TRIGGER DML_SS
ON DEMO
FOR INSERT,UPDATE,DELETE
AS
	BEGIN
		IF DATEPART(DW,GETDATE()) IN (6,1)
		BEGIN
			PRINT 'YOU DON`T HAVE ACCESS ON WEEKENDS'
			ROLLBACK TRANSACTION
		END
	END

-- 2) Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM

CREATE TRIGGER DML_DEL
ON DEMO
FOR INSERT,UPDATE,DELETE
AS 
	BEGIN
		IF DATEPART(HH,GETDATE()) BETWEEN 11 AND 15
		BEGIN
			PRINT 'YOU CHECK AFTER 15:00 PM'
			ROLLBACK TRANSACTION
		END
	END

-- 3) Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.

CREATE TRIGGER notify_db_change
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE, RENAME_TABLE
AS
	BEGIN
-- EVENTDATA() function retrive the information about the event that a trigger triggered
-- value is used to retrive the eventy type like CREATE_TABLE, ALTER_TABLE, DROP_TABLE, RENAME_TABLE and checked with the string
-- (/EVENT_INSTANCE/EventType)[1] this expression extract the event type and event type provide ddl fun
-- nvarchar specifies the extracted data type because value() requires the second argument as a string
		IF EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(128)') = 'CREATE_TABLE'
			PRINT 'Table created successfully !!.'
		ELSE IF EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(128)') = 'ALTER_TABLE'
			PRINT 'Table altered successfully !!.'
		ELSE IF EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(128)') = 'DROP_TABLE'
			PRINT 'Table dropped successfully !!.'
		ELSE IF EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(128)') = 'RENAME_TABLE'
			PRINT 'Table renamed successfully !!.'
	END

CREATE TABLE TEST1 (ID INT)

ALTER TABLE TEST1 ADD NAME VARCHAR(25)

DROP TABLE TEST1


