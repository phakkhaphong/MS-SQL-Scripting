--Create Scalar Function 1
USE AdventureWorks;
GO

CREATE FUNCTION Sales.udfGetTopSellProductID()RETURNS int
AS
BEGIN
	DECLARE @result int;
	
	SELECT TOP 1
		@result=productid
	FROM Sales.SalesOrderDetail as OD
	GROUP BY productid
	ORDER BY SUM(OrderQty) DESC;

	RETURN @result;
END
GO

--Test Scalar Function 1
SELECT 
* 
FROM Production.Product
WHERE productid=Sales.udfGetTopSellProductID()
GO

--Create Scalar Function 2

CREATE FUNCTION Sales.udfGetTopSellProductIDbyCategory(@catid int=1)RETURNS int
AS
BEGIN
	DECLARE @result int;
	
	SELECT TOP 1
		@result=OD.productid
	FROM Sales.SalesOrderDetail as OD
	INNER JOIN Production.Product as P ON P.productid=OD.productid
	INNER JOIN Production.ProductSubcategory as SC ON P.ProductSubcategoryID=SC.ProductSubcategoryID
	WHERE SC.ProductCategoryID=@catid
	GROUP BY OD.productid
	ORDER BY SUM(OD.OrderQty) DESC;

	RETURN @result;
END
GO
--Test Scalar Function 2
SELECT 
* 
FROM Production.Product
WHERE productid=Sales.udfGetTopSellProductIDbyCategory(3)
GO

--DROP Objects
DROP FUNCTION IF EXISTS Sales.udfGetTopSellProductID;
DROP FUNCTION IF EXISTS Sales.udfGetTopSellProductIDbyCategory; 