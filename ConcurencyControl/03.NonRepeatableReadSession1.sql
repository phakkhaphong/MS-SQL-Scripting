USE AdventureWorks;
GO

--Step 1 Demonstrate that READ COMMITTED isolation allows a non-repeatable read

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
	SELECT * FROM Person.PersonPhone WHERE BusinessEntityID=105;

--Step 2 ==> 03.NonRepeatableReadSession2.sql

--Step3
	SELECT * FROM Person.PersonPhone WHERE BusinessEntityID=105;
COMMIT TRANSACTION;

--Step 4  Demonstrate that REPEATABLE READ isolation prevents a non-repeatable read

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION
	SELECT * FROM Person.PersonPhone WHERE BusinessEntityID=105;

--Step 5 ==> 03.NonRepeatableReadSession2.sql

--Step6
	SELECT * FROM Person.PersonPhone WHERE BusinessEntityID=105;
COMMIT TRANSACTION;

--Setp 7
SELECT * FROM Person.PersonPhone WHERE BusinessEntityID=105;

