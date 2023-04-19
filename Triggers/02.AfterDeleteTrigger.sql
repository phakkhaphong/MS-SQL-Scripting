--Create After Delete Trigger
USE AdventureWorks;
GO

CREATE TRIGGER Sales.tg_SalesTerritoryHistory_Delete
ON Sales.SalesTerritoryHistory AFTER DELETE AS 
BEGIN
  IF EXISTS(SELECT 1
            FROM deleted AS d
            WHERE d.EndDate IS NULL) 
	BEGIN
		PRINT 'Current Sales Territory History rows cannot be deleted';
		ROLLBACK;
	END;
END;

--Test After Delete Trigger

DELETE Sales.SalesTerritoryHistory WHERE BusinessEntityID=283

--DROP Trigger

DROP TRIGGER IF EXISTS Sales.tg_SalesTerritoryHistory_Delete;
