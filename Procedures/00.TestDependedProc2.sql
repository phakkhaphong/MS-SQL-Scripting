
CREATE PROCEDURE [Sales].[udpGetCustomerTypeBySalesOrderID]
	@SalesOrderID int
,	@CustomerType varchar(50) OUTPUT
,	@CustomerName varchar(100) OUTPUT
AS

BEGIN TRY
	DECLARE 
		@varCustomerID int


	EXEC Sales.udpGetCustomerIDbySalesOrderID @SalesOrderID,@customerID=@varCustomerID OUTPUT

	SELECT 
		@CustomerType=
		CASE
			WHEN C.PersonID IS NULL THEN 'Reseller Sale'
			ELSE 'Internet Sale'
		END
	,	@CustomerName=
		CASE
			WHEN C.PersonID IS NULL THEN (SELECT S.Name FROM Sales.Store as S WHERE S.BusinessEntityID=C.StoreID)
			ELSE (SELECT P.FirstName+' '+P.LastName FROM Person.Person as P WHERE P.BusinessEntityID=C.PersonID)
		END
	FROM Sales.Customer as C WHERE C.CustomerID=@varCustomerID  
END TRY
BEGIN CATCH
	IF ERROR_NUMBER()=77777 THROW 88888,'Record Not Found',111

END CATCH
