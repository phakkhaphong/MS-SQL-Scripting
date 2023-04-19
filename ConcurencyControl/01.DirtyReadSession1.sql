USE AdventureWorks;
GO

--Step 1 
--Note : The value of the PhoneNumber column is 555-555-0113

SELECT * FROM Person.PersonPhone WHERE BusinessEntityID=105;

--Step 2 ==> 01.DirtyReadSession2.sql

--Step 3 Demonstrate Dirty Read
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
GO

SELECT * FROM Person.PersonPhone WHERE BusinessEntityID=105;
-- Note : The updated value for the PersonPhone column is shown, even through the transaction is not committed
GO

--Step 4 ==> 01.DirtyReadSession2.sql

--Step 5 

SELECT * FROM Person.PersonPhone WHERE BusinessEntityID=105;

