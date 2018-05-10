IF OBJECT_ID('[dbo].[vwProducts]') IS NOT NULL
	DROP VIEW [dbo].[vwProducts];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vwProducts]
AS
SELECT * FROM dbo.Products
GO
