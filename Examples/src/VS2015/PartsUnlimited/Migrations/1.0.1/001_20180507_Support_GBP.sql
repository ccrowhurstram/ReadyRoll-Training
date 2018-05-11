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


SET DATEFORMAT YMD;


GO
PRINT (N'Add 1 row to [dbo].[Products]');

SET IDENTITY_INSERT [dbo].[Products] ON;

INSERT  INTO [dbo].[Products] ([ProductId], [CategoryId], [Created], [Description], [Inventory], [LeadTime], [PriceUSD], [ProductArtUrl], [ProductDetails], [RecommendationId], [SalePrice], [SkuNumber], [Title], [PriceGBP])
VALUES                       (19, 2, '2018-05-09 11:13:53.1574600', N'Patio Floodlight; mounted on stand', 10, 0, 38.99, N'product_lighting_floodlight.jpg', N'{ "Light Source" : "LED", "Assembly Required": "No", "Color" : "Clear", "Exterior" : "Chrome", "Beam": "low and high", "Wiring harness included" : "Yes", "Bulbs Included" : "No",  "Includes Parking Signal" : "Yes"}', 1, 38.99, N'LIG-0001', N'Patio Floodlight', 31.20);

SET IDENTITY_INSERT [dbo].[Products] OFF;


GO