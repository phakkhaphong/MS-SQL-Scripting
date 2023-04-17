--ContinueBreakLoop

DECLARE @cnt int=(SELECT MAX(database_id) FROM sys.databases)
WHILE @cnt>0
BEGIN
	IF EXISTS
		(
		SELECT * FROM sys.databases
		WHERE database_id=@cnt
		AND (name IN ('master', 'tempdb', 'model', 'msdb') OR name LIKE 'ReportServer%')
		)
		BREAK
		
		DECLARE @dbnm varchar(200)=(SELECT name FROM sys.databases WHERE database_id=@cnt)
		PRINT @dbnm
	
	SET @cnt-=1 
END