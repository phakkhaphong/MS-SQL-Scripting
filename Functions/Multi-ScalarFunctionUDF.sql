CREATE OR ALTER FUNCTION Production.udfGetBestRevenueProductByYear(@year int)RETURNS varchar(200)
AS
BEGIN 
	DECLARE @result varchar(200)

	SELECT TOP 1
		@result=P.Name
	FROM Sales.SalesOrderDetail as OD
	INNER JOIN Production.Product as P ON OD.ProductID=P.ProductID
	INNER JOIN Sales.SalesOrderHeader as O ON O.SalesOrderID=OD.SalesOrderID
	WHERE O.OrderDate>='Jan 1,'+CAST(@year as char(4)) AND O.OrderDate<'Jan 1,'+CAST(@year+1 as char(4))
	GROUP BY P.Name
	ORDER BY SUM(OD.UnitPrice*OD.OrderQty*(1-OD.UnitPriceDiscount))  DESC

	RETURN @result
END
GO
--Test

SELECT Production.udfGetBestRevenueProductByYear(2005)