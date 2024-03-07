DECLARE 
	@a decimal(8,2) = 10
,   @b decimal(8,2) = 0
,	@result decimal(8,2)

BEGIN TRY
	SET @result = @a / @b;
END TRY
BEGIN CATCH
	IF ERROR_NUMBER() = 8134
		BEGIN
			DECLARE @msg nvarchar(300)=ERROR_MESSAGE();
			SET @msg=N'ข้อผิดพลาดหมายเลข '+CONVERT(nvarchar,ERROR_NUMBER())
				+ N' คือ '+ERROR_MESSAGE();
			
			THROW 99999,@msg,1;
		END
END CATCH
