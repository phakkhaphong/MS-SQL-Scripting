USE AdventureWorks;
GO

--Step 1 
--Note : The value of the PhoneNumber column is 555-555-0113

SELECT * FROM Person.PersonPhone WHERE BusinessEntityID=105;

--Step 2 ==> 02.ReadCommittedSession2.sql

--Step 3 Demonstrate Dirty Read
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO

SELECT * FROM Person.PersonPhone WHERE BusinessEntityID=105;
GO

--Step 4 ==> 02.ReadCommittedSession2.sql

--Once the blocking session is rolled back, this query returns a value


