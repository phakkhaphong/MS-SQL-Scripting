/*

CREATE PROC Sales.udpGetLastOrderIDbyCustomerID
	@customerID int
,	@MaxOrderID int OUTPUT
AS
SELECT 
	@MaxOrderID=MAX(OI.SalesOrderID)
FROM Sales.SalesOrderHeader as OI
WHERE OI.CustomerID=@customerID

*/

DECLARE @varMaxOrderID int

EXEC Sales.udpGetLastOrderIDbyCustomerID @customerID=29898,@MaxOrderID=@varMaxOrderID OUTPUT

SELECT *
FROM Sales.SalesOrderDetail 
WHERE SalesOrderID=@varMaxOrderID

GO

/*

CREATE FUNCTION Sales.udfGetLastOrderIDbyCustomerID(@customerID int)RETURNS int
AS
BEGIN
	DECLARE @result int
	SELECT 
		@result=MAX(OI.SalesOrderID)
	FROM Sales.SalesOrderHeader as OI
	WHERE OI.CustomerID=@customerID

	RETURN @result
END

*/

SELECT *
FROM Sales.SalesOrderDetail 
WHERE SalesOrderID=Sales.udfGetLastOrderIDbyCustomerID(29898)

GO
