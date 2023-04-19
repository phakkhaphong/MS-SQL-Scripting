USE AdventureWorks;
GO

--Create Database user without login and not grant any permission
CREATE USER NoPrivileges WITHOUT LOGIN;
GO

--Create Test Privileges Procedure
CREATE OR ALTER PROCEDURE dbo.udpTestPrivileges
AS
BEGIN
	EXECUTE AS USER='NoPrivileges';
	BACKUP DATABASE AdventureWorks TO DISK='D:\Backups\adv.bak';
END

--Test
EXEC dbo.udpTestPrivileges;