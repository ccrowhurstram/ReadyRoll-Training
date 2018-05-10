CREATE TABLE [dbo].[Products]
(
[ProductId] [int] NOT NULL IDENTITY(1, 1),
[CategoryId] [int] NOT NULL,
[Created] [datetime2] NOT NULL,
[Description] [nvarchar] (max) NOT NULL,
[Inventory] [int] NOT NULL,
[LeadTime] [int] NOT NULL,
[Price] [decimal] (18, 2) NOT NULL,
[ProductArtUrl] [nvarchar] (1024) NOT NULL,
[ProductDetails] [nvarchar] (max) NOT NULL,
[RecommendationId] [int] NOT NULL,
[SalePrice] [decimal] (18, 2) NOT NULL,
[SkuNumber] [nvarchar] (max) NOT NULL,
[Title] [nvarchar] (160) NOT NULL
)
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [CHK_Products] CHECK (([Price]<=(10000.00) AND [RecommendationId]<=(100)))
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED  ([ProductId])
GO
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([CategoryId]) ON DELETE CASCADE
GO
