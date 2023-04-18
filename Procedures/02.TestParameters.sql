--Create Test Parameter Procedure
CREATE OR ALTER PROCEDURE dbo.udpTestParams
	@param1 decimal(18,2)
,	@param2 decimal(18,2) OUTPUT
AS
BEGIN
	IF @param2=0 RETURN 1;

	SET @param2=@param1/@param2;

	RETURN 2;
END
GO

--Execute 1
DECLARE @returnInt int;
DECLARE @result decimal(18,2)=30;

EXEC @returnInt=dbo.udpTestParams @param1=10,@param2=@result OUTPUT;

SELECT @returnInt as [Return Integer], @result as Result;
GO

--Execute 2
DECLARE @returnInt int;
DECLARE @result decimal(18,2)=0;

EXEC @returnInt=dbo.udpTestParams @param1=10,@param2=@result OUTPUT;

SELECT @returnInt as [Return Integer], @result as Result;
GO