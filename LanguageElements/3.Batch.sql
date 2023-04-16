--Temporary Table
USE AdventureWorks;
GO

CREATE TABLE #TempSalesOrderHeader 
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
GO

INSERT INTO #TempSalesOrderHeader
SELECT 
	SalesOrderID,OrderDate,DueDate,ShipDate,SalesOrderNumber
,	PurchaseOrderNumber,AccountNumber,CustomerID,SalesPersonID
,	TerritoryID,BillToAddressID,ShipToAddressID,ShipMethodID
,	SubTotal,TaxAmt,Freight,TotalDue
FROM Sales.SalesOrderHeader;
GO

/* 
	ให้ทำการ Run ตั้งแต่ต้นจนถึงจุดนี้ จากนั้น

	ให้ทำการ Display Estimate Execution Plan คำสั่ง SELECT ด้านล่าง
	จะพบว่าการคาดคะเนจำนวนแถวข้อมูล มีการใช้งาน Statistics 
*/

SELECT * FROM #TempSalesOrderHeader;
