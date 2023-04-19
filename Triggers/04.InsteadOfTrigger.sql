--Create Instead of Trigger
USE tempdb;
GO

CREATE TABLE dbo.CurrentPrice
(
	CurrentPriceID int IDENTITY(1,1) CONSTRAINT PK_CurrentPrice PRIMARY KEY
,	SellingPrice decimal(18,2) NOT NULL
,	LastModified datetime2 NOT NULL CONSTRAINT DF_CurrentPrice_LastModified DEFAULT (SYSDATETIME())
,	ModifiedBy sysname NOT NULL CONSTRAINT DF_CurrentPrice_ModifiedBy  DEFAULT (ORIGINAL_LOGIN())
,	IsValid bit NOT NULL CONSTRAINT DF_CurrentPrice_IsValid  DEFAULT (1)
);
GO

INSERT INTO dbo.CurrentPrice (SellingPrice)
VALUES (2.3), (4.3), (5);
GO

SELECT * FROM dbo.CurrentPrice;
GO

CREATE TRIGGER dbo.tg_CurrentPrice_Delete
ON dbo.CurrentPrice INSTEAD OF DELETE 
AS 
BEGIN
  SET NOCOUNT ON;
  UPDATE cp
  SET cp.IsValid = 0
  FROM dbo.CurrentPrice AS cp
  INNER JOIN deleted AS d
  ON cp.CurrentPriceID = d.CurrentPriceID;
END;
GO

--Test

SELECT * FROM CurrentPrice;
GO

DELETE CurrentPrice WHERE CurrentPriceID=2;
GO

SELECT * FROM CurrentPrice;
GO

--DROP TABLE

DROP TABLE IF EXISTS dbo.CurrentPrice;
