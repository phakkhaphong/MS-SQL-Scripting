--Create Multi-Statements table-valued function Function
USE AdventureWorks;
GO

CREATE OR ALTER FUNCTION Production.udfGetProductByCatID2(@catid int,@rowno int)
RETURNS @Result TABLE
	(
		ProductID int NOT NULL
	,	[Name] dbo.[Name] NOT NULL
	,	ProductNumber nvarchar(25) NOT NULL
	,	Color nvarchar(15) NULL
	,	StandardCost money NOT NULL
	,	ListPrice money NOT NULL
	,	SellStartDate datetime NOT NULL
	,	ModifiedDate datetime NOT NULL
	)
AS
BEGIN
	INSERT INTO @Result
	SELECT TOP(@rowno) 
		P.ProductID
	,	P.Name
	,	P.ProductNumber
	,	P.Color
	,	P.StandardCost
	,	P.ListPrice
	,	P.SellStartDate
	,	P.ModifiedDate
	FROM Production.Product as P
	INNER JOIN Production.ProductSubcategory as SC ON P.ProductSubcategoryID=SC.ProductSubcategoryID
	WHERE SC.ProductCategoryID=@catid
	ORDER BY P.ListPrice DESC;

	RETURN
END
GO

--Test Multi-Statements table-valued function Function
SELECT 
*
FROM Production.udfGetProductByCatID2(4,3)
GO

--DROP Objects
DROP FUNCTION IF EXISTS Production.udfGetProductByCatID2;
