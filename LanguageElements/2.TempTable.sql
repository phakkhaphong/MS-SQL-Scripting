--Table Variable
USE AdventureWorks;
GO

DECLARE @vSalesOrderHeader TABLE
(
	SalesOrderID int NOT NULL
,	OrderDate datetime NOT NULL
,	DueDate datetime NOT NULL
,	ShipDate datetime NULL
,	SalesOrderNumber  nvarchar(25) NOT NULL
,	PurchaseOrderNumber nvarchar(25) NULL
,	AccountNumber nvarchar(15) NOT NULL
,	CustomerID int NOT NULL
,	SalesPersonID int NULL
,	TerritoryID int NULL
,	BillToAddressID int NOT NULL
,	ShipToAddressID int NOT NULL
,	ShipMethodID int NOT NULL
,	SubTotal money NOT NULL
,	TaxAmt money NOT NULL
,	Freight money NOT NULL
,	TotalDue  money NOT NULL
);

INSERT INTO @vSalesOrderHeader
SELECT 
	SalesOrderID,OrderDate,DueDate,ShipDate,SalesOrderNumber
,	PurchaseOrderNumber,AccountNumber,CustomerID,SalesPersonID
,	TerritoryID,BillToAddressID,ShipToAddressID,ShipMethodID
,	SubTotal,TaxAmt,Freight,TotalDue
FROM Sales.SalesOrderHeader;


SELECT * FROM @vSalesOrderHeader;

/*
	ให้ทำการ Display Estimate Execution Plan ในคราวเดียว เพราะเป็นตัวแปรจะพบว่ากลไกคาดคะเนจำนวนแถวข้อมูล
	Cardinality Estimator ใช้ค่าคงที่เป็น 1 แถวข้อมูลซึ่งคาดเคลื่อนจากความจริงมาก
*/