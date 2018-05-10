-- <Migration ID="6e64c8e4-5bc2-4fc4-a91e-c38656d3153b" />
GO

PRINT N'Rename [dbo].[Products].[Price] to PriceUSD';
GO
EXECUTE sp_rename @objname = N'[dbo].[Products].[Price]', @newname = N'PriceUSD', @objtype = N'COLUMN';
GO


PRINT N'Altering [dbo].[Products]'
GO
ALTER TABLE [dbo].[Products] ADD
[PriceGBP] [decimal] (18, 2) NULL
GO

UPDATE dbo.Products SET PriceGBP = PriceUSD * 0.8
GO

PRINT N'Altering [dbo].[Products]...';
GO
ALTER TABLE [dbo].[Products] ALTER COLUMN [PriceGBP] DECIMAL (18, 2) NOT NULL;
GO


