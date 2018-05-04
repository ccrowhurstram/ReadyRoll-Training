-- <Migration ID="3d99a510-b0fb-462f-b3ca-8f39ead8f299" />
GO

PRINT N'Altering [dbo].[Products]'
GO
ALTER TABLE [dbo].[Products] ADD
[PriceGBP] [decimal] (18, 2) NULL
GO

UPDATE dbo.Products SET PriceGBP = PriceUSD * 0.8
GO
