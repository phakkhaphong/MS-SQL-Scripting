--IF-ELSE Flow Control

IF EXISTS
	(
	SELECT 1 FROM Sales.SalesOrderHeader
	WHERE TotalDue>3900 AND PurchaseOrderNumber IS NULL
	)
	BEGIN
		DECLARE @cnt int =(	SELECT COUNT(*) FROM Sales.SalesOrderHeader WHERE TotalDue>3900 AND PurchaseOrderNumber IS NULL)
		DECLARE @msg varchar(200)=CONCAT(CONVERT(varchar,@cnt),' ','Sales Orders is not valid.')
		
		RAISERROR(@msg,16,1)
	END

ELSE RAISERROR('All sales orders are valid.',10,1)

