USE AdventureWorks;
GO

CREATE FUNCTION Sales.udfGetLargeAmountProductIDByYear(@year int)RETURNS int
AS
BEGIN
	DECLARE @result int
	SELECT
		@result=ProductID
	FROM Sales.SalesOrderDetail as OD
	INNER JOIN Sales.SalesOrderHeader as O ON O.SalesOrderID=OD.SalesOrderID
	WHERE O.OrderDate>='Jan 1,'+CAST(@year as char(4))
	AND O.OrderDate<'Jan 1,'+CAST(@year+1 as char(4))
	GROUP BY ProductID
	ORDER BY SUM(OD.UnitPrice*OD.OrderQty*(1-OD.UnitPriceDiscount)) DESC
	OFFSET 0 ROW FETCH NEXT 1 ROW ONLY

	RETURN @result
END

