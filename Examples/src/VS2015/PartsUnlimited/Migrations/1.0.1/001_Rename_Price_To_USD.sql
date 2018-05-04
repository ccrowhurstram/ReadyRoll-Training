-- <Migration ID="6a8a5cb7-8187-467e-b5bb-2f457ffac57a" />
GO


GO
PRINT N'Rename [dbo].[Products].[Price] to PriceUSD';


GO
EXECUTE sp_rename @objname = N'[dbo].[Products].[Price]', @newname = N'PriceUSD', @objtype = N'COLUMN';


GO

