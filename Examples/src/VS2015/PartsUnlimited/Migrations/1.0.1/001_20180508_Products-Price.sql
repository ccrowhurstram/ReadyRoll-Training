-- <Migration ID="67f218c4-eb37-4596-a9a2-20147dbd5692" />
GO

PRINT N'Altering [dbo].[Products]'
GO
ALTER TABLE [dbo].[Products] ALTER COLUMN [Price] [decimal] (16, 2) NOT NULL
GO
