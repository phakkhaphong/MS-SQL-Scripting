--Create Recursive Procedure
CREATE PROCEDURE dbo.udpTestRecursive
AS
BEGIN
	SET NOCOUNT ON;

	PRINT 'Nest Level ' + CAST(@@NESTLEVEL as varchar(3))
	IF @@NESTLEVEL=20 RETURN

	EXEC dbo.udpTestRecursive

END;

--Test Recursive Procedure
EXEC dbo.udpTestRecursive;