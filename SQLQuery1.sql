CREATE DATABASE PRACTICE1
USE PRACTICE1;
GO
CREATE TABLE STUDENTS 
(
[ID] INT PRIMARY KEY IDENTITY (1,1),
[NAME] NVARCHAR (50),
[SURNAME] NVARCHAR (50) NOT NULL,
[EMAIL] NVARCHAR (50) UNIQUE,
[AGE] INT CHECK( AGE BETWEEN 18 AND 60),
)
ALTER TABLE STUDENTS
ADD [FINCODE] NVARCHAR (60) DEFAULT 'SSSS';

EXEC sp_help STUDENTS;
ALTER TABLE STUDENTS 
ADD [BOOK] NVARCHAR (50) ;
INSERT INTO STUDENTS([NAME], [SURNAME],[EMAIL],[AGE])
VALUES
('RASHAD', 'TAGHIZADA', 'TAGHIZADA.@GMAIL.COM', 21),
('ZLI', 'BXZ', 'ZX.@GMAIL.COM', 25)


SELECT* FROM STUDENTS

UPDATE STUDENTS
SET [NAME]='ALI' WHERE [ID]=2

UPDATE STUDENTS
SET [SURNAME]= 'ALIYEV' WHERE [ID]=2
UPDATE STUDENTS
SET [BOOK]='LITTLE PRINCE' WHERE [ID]=2

INSERT INTO STUDENTS([NAME], [SURNAME],[EMAIL],[AGE])
VALUES
('ZAUR', 'NURIYEV', 'ZAUR.@GMAIL.COM', 31),
('ELMIR', 'ABBASOV', 'ELMIR.@GMAIL.COM', 45)

SELECT [NAME], [SURNAME] AS
FROM STUDENTS

SELECT * FROM STUDENTS WHERE [AGE]>=30 AND [AGE] <=40
SELECT* FROM STUDENTS WHERE [AGE] BETWEEN 20 AND 30
SELECT * FROM STUDENTS WHERE[NAME] LIKE 'R%'
SELECT * FROM STUDENTS WHERE [SURNAME] LIKE '%V'
SELECT TOP 1* FROM STUDENTS
ORDER BY[ID] DESC
--------------------------------------------------------


USE PRACTICE1;
GO

DROP DATABASE CompanyDb;
--CompanyDb database qurursuz, Employees Table olacaq (Id, FullName, Age, Email, Address). 

CREATE TABLE EMPLOYEESZ
(
[ID] INT PRIMARY KEY IDENTITY(1,1),
[FULLNAME] NVARCHAR (60) NOT NULL,
[AGE] INT ,
[EMAIL] NVARCHAR(60) UNIQUE,
[ADDRESS] NVARCHAR (100)
)
EXEC sp_rename 'EMPLOYEE', 'EMPLOYEES';

INSERT INTO EMPLOYEESZ
([FULLNAME], [AGE], [EMAIL], [ADDRESS])
VALUES
('RASHAD TAGHIZADA', 21,'TAGHIZADA4@GMAIL.COM', 'POLAND KRAKOW'),
('VALI ALIYEV', 41,'VALIYEV4@GMAIL.COM', 'BAKU AZERBAIJAN'),
('ARZU MAMMADOVA', 31,'MAMMADOVA@GMAIL.COM', 'SUMQAYIT AZERBAIJAN'),
('NIGAR ALIZADE', 26,'NIGAR@GMAIL.COM', 'LENKERAN AZERBAIJAN')
SELECT * FROM EMPLOYEESZ
UPDATE EMPLOYEESZ
SET[ADDRESS]='SUMGAYIT AZERBAIJAN' WHERE [ID]=3
INSERT INTO EMPLOYEESZ
([FULLNAME], [AGE], [EMAIL], [ADDRESS])
VALUES
('MEHRIBAN OSMANOVA', 42,'MEHRIBAN@GMAIL.COM', 'GERMANY BERLIN'),
('ALIYE NEMETLI', 19,'ALIYE@GMAIL.COM', 'BAKU AZERBAIJAN')
--1) Ishcilerin butun melumatlarini getirin.
--Retrieve all information about the employees.
SELECT * FROM EMPLOYEES
--2) Ishcilerin yashlarinin cemini tapin
--Find the sum of the employees' ages.
SELECT SUM([AGE]) FROM EMPLOYEES
--3) Ishcilerin yashlarinin ortalamasini tapin
--Find the average age of the employees.
SELECT AVG ([AGE]) FROM EMPLOYEES
--4) Ad ve soyadinda d herfi olan ishcilerin melumatlarini getirin.
--Retrieve the information of employees whose full name contains the letter "d".
SELECT * FROM EMPLOYEES WHERE [FULLNAME] LIKE '%D%'
--5) En son elave edilmish 5 ishcinin Ad soyadini ve yashini getirin.
--Retrieve the full name and age of the last 5 employees added.
SELECT TOP 5 [FULLNAME], [AGE] FROM EMPLOYEES
ORDER BY [ID] DESC
--6) Ishcilerin yashlarinin cemi ile yashlarinin ortalamasinin umumi cemini tapin.
--Find the total sum of the employees' age sum and average age.
SELECT SUM([AGE]) +AVG([AGE]) FROM EMPLOYEES  
--7) Yaşı 25-dən böyük olan işçilərin adını, emailini və ünvanını gətirin.
--Retrieve the name, email, and address of employees older than 25.
SELECT [FULLNAME], [EMAIL], [ADDRESS] FROM EMPLOYEES WHERE [AGE]>25
--8) Ad və soyadı "A" hərfi ilə başlayan işçilərin bütün məlumatlarını gətirin.
--Retrieve all information of employees whose full name starts with the letter "A".
SELECT * FROM EMPLOYEES WHERE [FULLNAME] LIKE 'A%'
--9) Email ünvanında "gmail" sözü olan işçilərin adını və emailini gətirin.
--Retrieve the name and email of employees whose email contains the word "gmail".
SELECT [FULLNAME], [EMAIL] FROM EMPLOYEES WHERE [EMAIL] LIKE '%GMAIL%' 
--10) Yaşı 20 ilə 30 arasında olan işçilərin bütün məlumatlarını göstərin.
--Show all information of employees whose age is between 20 and 30.
 SELECT * FROM EMPLOYEES WHERE [AGE] BETWEEN 20 AND 30
--11) Ən gənc işçinin adını və yaşını gətirin.
--Retrieve the name and age of the youngest employee.
SELECT TOP 1 [FULLNAME], [AGE] FROM EMPLOYEES
ORDER BY[AGE] ASC
--12) Ən yaşlı işçinin bütün məlumatlarını gətirin.
--Retrieve all information of the oldest employee.
SELECT TOP 1 * FROM EMPLOYEES
ORDER BY[AGE] DESC
--13) Yaşı orta yaşdan böyük olan işçilərin adını və yaşını göstərin.
--Show the name and age of employees whose age is greater than the average age.
SELECT [FULLNAME], [AGE] FROM EMPLOYEES WHERE [AGE] >(SELECT AVG([AGE]) FROM EMPLOYEES)
--14) Email ünvanında "gmail" sözü olan işçilərin sayını tapın.
--Find the number of employees whose email contains the word "gmail".
SELECT COUNT([ID]) FROM EMPLOYEES WHERE [EMAIL] LIKE'%GMAIL%'
--15) Ad və soyadının uzunluğu 10 simvoldan çox olan işçilərin bütün məlumatlarını gətirin.
--Retrieve all information of employees whose full name length is more than 10 characters.
SELECT * FROM EMPLOYEES WHERE LEN([FULLNAME])>10
--16)Email ünvanı ".az" ilə bitən işçilərin adını və emailini göstərin.
--Show the name and email of employees whose email ends with ".az".
SELECT [FULLNAME], [EMAIL] FROM EMPLOYEES WHERE [EMAIL] LIKE '%.AZ' 
--17) Yaşı cüt olan işçilərin bütün məlumatlarını gətirin.
--Retrieve all information of employees whose age is even.
SELECT * FROM EMPLOYEES WHERE [AGE]%2=0
--18) Yaşı tək olan işçilərin adını və yaşını göstərin.
--Show the name and age of employees whose age is odd.
SELECT [FULLNAME], [AGE] FROM EMPLOYEES WHERE [AGE]%2=1
--19) Ən uzun ada (FullName) sahib işçinin bütün məlumatlarını gətirin.
--Retrieve all information of the employee with the longest full name.
SELECT TOP 1* FROM EMPLOYEES  
ORDER BY LEN([FULLNAME]) DESC
--20) Yaşı 5-ə tam bölünən işçilərin adını və yaşını gətirin.
--Retrieve the name and age of employees whose age is exactly divisible by 5.
 SELECT [FULLNAME], [AGE] FROM EMPLOYEES WHERE [AGE]%5=0
