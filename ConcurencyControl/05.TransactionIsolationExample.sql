--Example 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
SET XACT_ABORT ON
BEGIN TRY
	BEGIN TRANSACTION
		INSERT INTO Sales.MiniCustomers 
		(
			CompanyName,ContactName,ContactTitle,[Address]
		,	City,Region,PostalCode,Country,Phone
		)
		VALUES
		(
			'Data Meccanica Co.,Ltd.','Phakkhaphong K.','Owner'
		,	'109/6 M9','Paris',NULL,10058,'France','(66) 789-0123'
		)
		INSERT INTO Sales.MiniOrders (CustID,OrderDate,Freight)
		VALUES (@@IDENTITY,GETDATE(),32.38)

		INSERT INTO Sales.MiniOrderDetails 
		(OrderID,ProductID,UnitPrice,Quantity,Discount)
		VALUES
		(@@IDENTITY,854,27,30,0.2),(@@IDENTITY,859,97,2,0),(@@IDENTITY,860,19,3,0);

		UPDATE Production.MiniProducts SET Quantity=Quantity-30 WHERE productid=854;
		UPDATE Production.MiniProducts SET Quantity=Quantity-2 WHERE productid=859;
		UPDATE Production.MiniProducts SET Quantity=Quantity-3 WHERE productid=860;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF (XACT_STATE())=-1 ROLLBACK TRANSACTION
END CATCH 
SET XACT_ABORT OFF
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

--Example 2
SET XACT_ABORT ON
BEGIN TRY
	BEGIN TRANSACTION
		INSERT INTO Sales.MiniCustomers 
		(
			CompanyName,ContactName,ContactTitle,[Address]
		,	City,Region,PostalCode,Country,Phone
		)
		VALUES
		(
			'Data Meccanica Co.,Ltd.','Phakkhaphong K.','Owner'
		,	'109/6 M9','Paris',NULL,10058,'France','(66) 789-0123'
		)
		INSERT INTO Sales.MiniOrders (CustID,OrderDate,Freight)
		VALUES (@@IDENTITY,GETDATE(),32.38)

		INSERT INTO Sales.MiniOrderDetails WITH (SERIALIZABLE)
		(OrderID,ProductID,UnitPrice,Quantity,Discount)
		VALUES
		(@@IDENTITY,854,27,30,0.2),(@@IDENTITY,859,97,2,0),(@@IDENTITY,860,19,3,0);

		UPDATE Production.MiniProducts WITH (SERIALIZABLE) SET Quantity=Quantity-30 WHERE productid=854;
		UPDATE Production.MiniProducts WITH (SERIALIZABLE) SET Quantity=Quantity-2 WHERE productid=859;
		UPDATE Production.MiniProducts WITH (SERIALIZABLE) SET Quantity=Quantity-3 WHERE productid=860;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF (XACT_STATE())=-1 ROLLBACK TRANSACTION
END CATCH 
SET XACT_ABORT OFF
