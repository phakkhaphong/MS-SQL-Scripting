CREATE OR ALTER FUNCTION Production.udfGetBestRevenueProductByYear2(@year int)RETURNS varchar(200)
AS
BEGIN
	RETURN 
		(
		SELECT TOP 1
			P.Name
		FROM Sales.SalesOrderDetail as OD
		INNER JOIN Production.Product as P ON OD.ProductID=P.ProductID
		INNER JOIN Sales.SalesOrderHeader as O ON O.SalesOrderID=OD.SalesOrderID
		WHERE O.OrderDate>='Jan 1,'+CAST(@year as char(4)) AND O.OrderDate<'Jan 1,'+CAST(@year+1 as char(4))
		GROUP BY P.Name
		ORDER BY SUM(OD.UnitPrice*OD.OrderQty*(1-OD.UnitPriceDiscount))  DESC
		)
END
GO
--Test

SELECT Production.udfGetBestRevenueProductByYear2(2005)