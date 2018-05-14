-- <Migration ID="67f218c4-eb37-4596-a9a2-20147dbd5692" />
GO

PRINT N'Altering [dbo].[Products]'
GO
ALTER TABLE [dbo].[Products] ALTER COLUMN [Price] [decimal] (16, 2) NOT NULL
GO

SET DATEFORMAT YMD;


GO
PRINT (N'Add 1 row to [dbo].[Products]');

SET IDENTITY_INSERT [dbo].[Products] ON;

INSERT  INTO [dbo].[Products] ([ProductId], [CategoryId], [Created], [Description], [Inventory], [LeadTime], [Price], [ProductArtUrl], [ProductDetails], [RecommendationId], [SalePrice], [SkuNumber], [Title])
VALUES                       (19, 2, '2018-05-09 11:13:53.1574600', N'Patio Floodlight; mounted on stand', 10, 0, 38.99, N'product_lighting_floodlight.jpg', N'{ "Light Source" : "LED", "Assembly Required": "No", "Color" : "Clear", "Exterior" : "Chrome", "Beam": "low and high", "Wiring harness included" : "Yes", "Bulbs Included" : "No",  "Includes Parking Signal" : "Yes"}', 1, 38.99, N'LIG-0001', N'Patio Floodlight');

SET IDENTITY_INSERT [dbo].[Products] OFF;


GO
