USE AdventureWorks;
GO

--Create Database user without login and not grant any permission
CREATE USER BackupPrivileges WITHOUT LOGIN;
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [BackupPrivileges]
GO
GRANT IMPERSONATE ON USER:: BackupPrivileges TO superman;  
GO 

--Create Test Privileges Procedure
CREATE OR ALTER PROCEDURE dbo.udpTestPrivileges
AS
BEGIN
	EXECUTE AS USER='BackupPrivileges';
	BACKUP DATABASE AdventureWorks TO DISK='D:\Backups\adv.bak';
END

--Test
EXEC dbo.udpTestPrivileges;
