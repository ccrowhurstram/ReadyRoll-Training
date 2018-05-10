-- <Migration ID="2e09d88d-d7d3-422b-9e45-0e373101ec68" />
GO

PRINT N'Adding constraints to [dbo].[Products]'
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [CHK_Products] CHECK (([Price]<=(10000.00) AND [RecommendationId]<=(100)))
GO
