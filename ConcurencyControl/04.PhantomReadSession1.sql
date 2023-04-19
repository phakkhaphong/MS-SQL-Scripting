USE AdventureWorks;
GO

--Step 1 Demonstrate that REPEATABLE READ isolation allows a phantom read

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
GO
BEGIN TRANSACTION
	SELECT COUNT(*) AS CatCount 
	FROM Production.ProductCategory
	

--Step 2 ==> 04.PhantomReadSession2.sql

--Step3
	SELECT COUNT(*) AS CatCount 
	FROM Production.ProductCategory
COMMIT TRANSACTION;

--Step 4  Demonstrate that SERIALIZABLE isolation prevents a phantom read

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
GO
BEGIN TRANSACTION
	SELECT COUNT(*) AS CatCount 
	FROM Production.ProductCategory

--Step 5 ==> 04.PhantomReadSession2.sql

--Step6
	SELECT COUNT(*) AS CatCount 
	FROM Production.ProductCategory
COMMIT TRANSACTION;

--Setp 7
	SELECT COUNT(*) AS CatCount 
	FROM Production.ProductCategory
