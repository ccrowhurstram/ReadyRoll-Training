-- <Migration ID="adafac65-afed-4b07-a39a-6131e5475b98" />
GO

PRINT N'Altering [dbo].[Categories]'
GO
ALTER TABLE [dbo].[Categories] ADD
[Code] [nvarchar] (50) NOT NULL CONSTRAINT [DF_Categories_Code] DEFAULT (N'')
GO
