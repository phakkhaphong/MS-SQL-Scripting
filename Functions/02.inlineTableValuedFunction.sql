--Create Inline table-valued function Function
USE AdventureWorks;
GO

CREATE OR ALTER FUNCTION Production.udfGetProductByCatID(@catid int,@rowno int)RETURNS TABLE
AS
	RETURN
		SELECT TOP(@rowno) 
			P.ProductID
		,	P.[Name]
		,	P.ProductNumber
		,	P.Color
		,	P.StandardCost
		,	P.ListPrice
		,	P.SellStartDate
		,	P.ModifiedDate
		FROM Production.Product as P
		INNER JOIN Production.ProductSubcategory as SC ON P.ProductSubcategoryID=SC.ProductSubcategoryID
		WHERE SC.ProductCategoryID=@catid
		ORDER BY P.ListPrice DESC
GO

--Test Inline table-valued function Function
SELECT 
*
FROM Production.udfGetProductByCatID(4,3)
GO

--DROP Objects
DROP FUNCTION IF EXISTS Production.udfGetProductByCatID;
