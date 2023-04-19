USE AdventureWorks;
GO

--Step 2
	UPDATE Person.PersonPhone 
	SET PhoneNumber = N'333-555-3333'
	WHERE BusinessEntityID=105

--Step 3 ==> 03.NonRepeatableReadSession1.sql

--Step 5
	UPDATE Person.PersonPhone 
	SET PhoneNumber = N'444-555-4444'
	WHERE BusinessEntityID=105

--Step 6 ==> 03.NonRepeatableReadSession1.sql


