/*
--Create MiniProducts Table

SELECT 
	P.ProductID,P.Name as ProductName
,	SUM(ISNULL(I.Quantity,0)) as Quantity
INTO Production.MiniProducts
FROM Production.Product as P
INNER JOIN Production.ProductInventory as I ON P.ProductID=I.ProductID
GROUP BY P.ProductID,P.Name;
GO

ALTER TABLE Production.MiniProducts 
ADD CONSTRAINT PK_MiniProducts PRIMARY KEY CLUSTERED (ProductID ASC);
GO

ALTER TABLE Production.MiniProducts 
ADD  CONSTRAINT CK_StockCount CHECK ((Quantity>=(0)));
GO


*/

SELECT * FROM Production.MiniProducts WHERE ProductID IN (854,859,860);
GO

/*
--Create MiniCustomers Table

CREATE TABLE Sales.MiniCustomers
(
	CustID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_MiniCustomers PRIMARY KEY
,	CompanyName nvarchar(40) NOT NULL
,	ContactName nvarchar(30) NOT NULL
,	ContactTitle nvarchar(30) NOT NULL
,	Address nvarchar(60) NOT NULL
,	City nvarchar(15) NOT NULL
,	Region nvarchar(15) NULL
,	PostalCode nvarchar(10) NULL
,	Country nvarchar(15) NOT NULL
,	Phone nvarchar(24) NOT NULL
);
GO

--Create MiniOrders Table

CREATE TABLE Sales.MiniOrders
(
	OrderID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_MiniOrders PRIMARY KEY CLUSTERED 
,	CustID int NULL CONSTRAINT FK_MiniOrders_MiniCustomers FOREIGN KEY(CustID) REFERENCES Sales.MiniCustomers (CustID)
,	OrderDate datetime NOT NULL
,	Freight money NOT NULL CONSTRAINT DFT_Orders_Freight  DEFAULT ((0))
) ;
GO

CREATE TABLE Sales.MiniOrderDetails
(
	OrderID int NOT NULL CONSTRAINT FK_MiniOrderDetails_Orders FOREIGN KEY(orderid) REFERENCES Sales.MiniOrders (orderid)
,	ProductID int NOT NULL CONSTRAINT FK_OrderDetails_Products FOREIGN KEY(productid) REFERENCES Production.MiniProducts (productid)
,	UnitPrice money NOT NULL CONSTRAINT DFT_MiniOrderDetails_unitprice  DEFAULT ((0)) 
,	Quantity smallint NOT NULL CONSTRAINT DFT_MiniOrderDetails_Quantity  DEFAULT ((1)) 
,	Discount numeric(4,3) NOT NULL CONSTRAINT DFT_MiniOrderDetails_discount  DEFAULT ((0)) 
,	CONSTRAINT PK_MiniOrderDetails PRIMARY KEY CLUSTERED 
	(
		orderid ASC,
		productid ASC
	)
);

*/

--Test 01

USE AdventureWorks
GO

INSERT INTO Sales.MiniCustomers (CompanyName,ContactName,ContactTitle,[Address],City,Region,PostalCode,Country,Phone)
VALUES
('Data Meccanica Co.,Ltd.','Phakkhaphong K.','Owner','109/6 M9','Paris',NULL,10058,'France','(66) 789-0123')

INSERT INTO Sales.MiniOrders (CustID,OrderDate,Freight)
VALUES (@@IDENTITY,GETDATE(),32.38)

INSERT INTO Sales.MiniOrderDetails (OrderID,ProductID,UnitPrice,Quantity,Discount)
VALUES
(@@IDENTITY,854,27,30,0.2),(@@IDENTITY,859,97,2,0),(@@IDENTITY,860,19,3,0);

UPDATE Production.MiniProducts SET Quantity=Quantity-30 WHERE productid=854;
UPDATE Production.MiniProducts SET Quantity=Quantity-2 WHERE productid=859;
UPDATE Production.MiniProducts SET Quantity=Quantity-3 WHERE productid=860;
GO

SELECT * FROM Sales.MiniOrders;
SELECT * FROM Sales.MiniOrderDetails;
SELECT * FROM Production.MiniProducts WHERE ProductID IN (854,859,860);
GO

--DROP ALL Test Tables

IF OBJECT_ID('Sales.MiniOrderDetails') IS NOT NULL
	DROP TABLE Sales.MiniOrderDetails;

IF OBJECT_ID('Sales.MiniOrders') IS NOT NULL
	DROP TABLE Sales.MiniOrders;

IF OBJECT_ID('Sales.MiniCustomers') IS NOT NULL
	DROP TABLE Sales.MiniCustomers;

IF OBJECT_ID('Production.MiniProducts') IS NOT NULL
	DROP TABLE Production.MiniProducts;
