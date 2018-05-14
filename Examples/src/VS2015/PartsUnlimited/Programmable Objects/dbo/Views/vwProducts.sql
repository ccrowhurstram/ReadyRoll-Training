IF OBJECT_ID('[dbo].[vwProducts]') IS NOT NULL
	DROP VIEW [dbo].[vwProducts];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vwProducts]
AS
     SELECT p.ProductId,
            p.CategoryId,
            p.Created,
            p.Description,
            p.Inventory,
            p.LeadTime,
            p.PriceUSD AS RRP,
            p.PriceGBP AS RRP_GBP,
            p.ProductArtUrl,
            p.ProductDetails,
            p.RecommendationId,
            p.SalePrice,
            p.SkuNumber,
            p.Title
     FROM dbo.Products p;
GO
