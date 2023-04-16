--ContinueWhileLoop

DECLARE @cnt int=0
DECLARE @maxid int =(SELECT MAX(database_id) FROM sys.databases)
WHILE @cnt<@maxid
BEGIN
	SET @cnt+=1;
	IF EXISTS
		(
		SELECT * FROM sys.databases
		WHERE database_id=@cnt
		AND (name IN ('master', 'tempdb', 'model', 'msdb') OR name LIKE 'ReportServer%')
		)
		CONTINUE
		
		DECLARE @dbnm varchar(200)=(SELECT name FROM sys.databases WHERE database_id=@cnt)
		PRINT @dbnm
END