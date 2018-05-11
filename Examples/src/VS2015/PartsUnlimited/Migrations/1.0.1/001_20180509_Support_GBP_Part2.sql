-- <Migration ID="8a238e2a-ae93-4342-848e-615627111a5c" />
GO
PRINT N'Rename [dbo].[Products].[Price] to PriceUSD';
GO
EXECUTE sp_rename @objname = N'[dbo].[Products].[Price]', @newname = N'PriceUSD', @objtype = N'COLUMN';
GO

UPDATE dbo.Products SET PriceGBP = 31.2 WHERE ProductId = 19

PRINT N'Altering [dbo].[Products]...';
GO
ALTER TABLE [dbo].[Products] ALTER COLUMN [PriceGBP] DECIMAL (18, 2) NOT NULL;
GO