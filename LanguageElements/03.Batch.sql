--Temporary Table
USE AdventureWorks;
GO

CREATE TABLE Sales.MiniOrderDetail
(
	SalesOrderID int FOREIGN KEY REFERENCES Sales.SalesOrderHeader(SalesOrderID) NOT NULL
,	ProductID int FOREIGN KEY REFERENCES Production.Product(ProductID) NOT NULL
,	OrderQty smallint NOT NULL
)
GO

--Valid batch
INSERT INTO Sales.MiniOrderDetail VALUES(75123,1,10);
INSERT INTO Sales.MiniOrderDetail VALUES(75123,2,10);
GO
--invalid batch
INSERT INTO Sales.MiniOrderDetail VALUE(75123,1,10);
INSERT INTO Sales.MiniOrderDetail VALUES(75123,2,10);
GO

--Runtime Error batch
INSERT INTO Sales.MiniOrderDetail VALUES(00000,1,10);
INSERT INTO Sales.MiniOrderDetail VALUES(75123,3,10);
GO

SELECT * FROM Sales.MiniOrderDetail;
GO

IF OBJECT_ID('Sales.MiniOrderDetail') IS NOT NULL
	DROP TABLE Sales.MiniOrderDetail;
GO