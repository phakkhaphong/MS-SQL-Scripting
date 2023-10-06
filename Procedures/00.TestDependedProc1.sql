USE [AdventureWorks]
GO

CREATE PROCEDURE [Sales].[udpGetCustomerIDbySalesOrderID]
	@SalesOrderID int
,	@customerID int OUTPUT
AS

SET NOCOUNT ON
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

IF EXISTS (SELECT 1 FROM Sales.SalesOrderHeader as O WHERE O.SalesOrderID=@SalesOrderID)

	SELECT
		@customerID=C.CustomerID
	FROM Sales.SalesOrderHeader as O
	INNER JOIN Sales.Customer as C ON O.CustomerID=C.CustomerID
	WHERE O.SalesOrderID=@SalesOrderID 

ELSE THROW 77777,'Record Not Found',111
