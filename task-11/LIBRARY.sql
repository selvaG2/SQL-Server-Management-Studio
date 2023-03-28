CREATE DATABASE LIBRARY_MANAGE

--BOOK TABLE

CREATE TABLE BOOK
(
 B_ID INT PRIMARY KEY,
 B_NAME VARCHAR(50),
 AUTHOR VARCHAR(30),
 SPONSER VARCHAR(30),
 DOI DATE,
 DOR DATE
)

INSERT INTO BOOK (B_ID, B_NAME, AUTHOR, SPONSER, DOI, DOR)
VALUES (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', '2023-04-10', '2023-05-10'),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '2023-07-11', '2023-08-11'),
(3, '1984', 'George Orwell', 'Secker & Warburg', '2023-06-08', '2023-07-09'),
(4, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '2022-12-28', '2023-01-28'),
(5, 'The Hobbit', 'J. R. R. Tolkien', 'George Allen & Unwin', '2022-12-01', '2023-01-01')

----------------------------------------------------------------------------------------------------------------

--LIBRARIEN TABLE 

CREATE TABLE LIBRARIEN
(
L_ID INT PRIMARY KEY,
L_NAME VARCHAR(25),
L_PH BIGINT,
L_MAIL VARCHAR(25)
)

INSERT INTO LIBRARIEN VALUES
(1,'Gopal',987643525,'gopal@gmail.com'),
(2,'Kunthavai',9342178567,'kunthavai@gmail.com'),
(3,'Karikalan',9371527842,'karikalan@gmail.com')
----------------------------------------------------------------------------------------------------------------

--STUDENT TABLE

CREATE TABLE STUDENT
(
S_ID INT PRIMARY KEY,
S_NAME VARCHAR(25) NOT NULL,
S_PH BIGINT,
S_MAIL VARCHAR(30),
DEPT VARCHAR(15),
YEAR INT,
DOR DATE,
BOOK_ID INT DEFAULT 3 REFERENCES BOOK(B_ID) ON UPDATE SET DEFAULT,
LIB_ID INT DEFAULT 3 REFERENCES LIBRARIEN(L_ID) ON UPDATE SET DEFAULT
)

INSERT INTO STUDENT VALUES 
(1,'Selva','9462781658','selva@gmail.com','BCA',3,'2023-05-10',1,2),
(2,'Prakash','9816584627','Prakash@gmail.com','IT',3,'2023-01-01',5,1),
(3,'Vikram','9584628167','Vikram@gmail.com','CT',2,'2023-01-28',4,3),
(4,'Karthi','9814627658','Karthi@gmail.com','BCA',1,'2023-07-09',3,2),
(5,'Hemanth','9658814627','Hemanth@gmail.com','IT',1,'2023-08-11',2,1)

SELECT * FROM BOOK
SELECT * FROM LIBRARIEN
SELECT * FROM STUDENT

UPDATE BOOK SET B_ID = 7 WHERE B_ID=5 

UPDATE LIBRARIEN SET L_ID = 4 WHERE L_ID=1