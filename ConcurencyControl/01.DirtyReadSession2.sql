USE AdventureWorks;
GO

--Step 2
BEGIN TRANSACTION
	UPDATE Person.PersonPhone 
	SET PhoneNumber = N'999-555-9999'
	WHERE BusinessEntityID=105

--Step 3 ==> 01.DirtyReadSession1.sql

--Step 4
ROLLBACK

--Step 5 ==> 01.DirtyReadSession1.sql
