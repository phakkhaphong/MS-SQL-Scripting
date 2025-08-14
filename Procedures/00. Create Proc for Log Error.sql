-- =============================================
-- Author:      Phakkhaphong Krittawat
-- Create date: 2025-08-14
-- Description: Logs errors from a TRY...CATCH block to the ErrorLog table.
-- =============================================
CREATE OR ALTER PROCEDURE dbo.usp_LogError
AS
BEGIN
    SET NOCOUNT ON;

    -- ตรวจสอบว่าอยู่นอก Transaction หรือไม่ ถ้าใช่ก็บันทึก Log
    -- XACT_STATE() = -1 หมายถึงมี Active Transaction ที่ไม่สามารถ Commit ได้ (Uncommittable)
    -- XACT_STATE() = 1 หมายถึงมี Active Transaction ที่สามารถ Commit ได้
    -- XACT_STATE() = 0 หมายถึงไม่มี Active Transaction

    -- บันทึก Log เมื่อมีข้อผิดพลาดเกิดขึ้น
    INSERT INTO dbo.ErrorLog (
        [UserName],
        [ErrorNumber],
        [ErrorSeverity],
        [ErrorState],
        [ErrorProcedure],
        [ErrorLine],
        [ErrorMessage]
    )
    VALUES (
        SUSER_SNAME(),
        ERROR_NUMBER(),
        ERROR_SEVERITY(),
        ERROR_STATE(),
        ERROR_PROCEDURE(),
        ERROR_LINE(),
        ERROR_MESSAGE()
    );
END;
GO

PRINT 'Stored Procedure [dbo.usp_LogError] created or altered successfully.';
GO
