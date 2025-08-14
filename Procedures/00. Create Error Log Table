-- =============================================
-- Script to Create the ErrorLog Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorLog]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[ErrorLog](
        [ErrorLogID]   INT IDENTITY(1,1) NOT NULL, -- Primary Key
        [ErrorTime]    DATETIME2(7) NOT NULL CONSTRAINT [DF_ErrorLog_ErrorTime] DEFAULT (SYSDATETIME()), -- เวลาที่เกิด Error
        [UserName]     SYSNAME      NOT NULL, -- User ที่ทำให้เกิด Error
        [ErrorNumber]  INT          NULL,     -- หมายเลข Error
        [ErrorSeverity] INT         NULL,     -- ระดับความรุนแรง
        [ErrorState]   INT          NULL,     -- State ของ Error
        [ErrorProcedure] NVARCHAR(128) NULL,   -- ชื่อ Procedure หรือ Trigger ที่เกิด Error
        [ErrorLine]    INT          NULL,     -- บรรทัดที่เกิด Error
        [ErrorMessage] NVARCHAR(MAX) NOT NULL, -- ข้อความ Error
        CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED ([ErrorLogID] ASC)
    );
    PRINT 'Table [dbo].[ErrorLog] created successfully.';
END
ELSE
BEGIN
    PRINT 'Table [dbo.ErrorLog] already exists.';
END
GO
