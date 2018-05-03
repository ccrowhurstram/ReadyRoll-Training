CREATE TABLE [dbo].[RainChecks]
(
[RaincheckId] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (max) NULL,
[ProductId] [int] NOT NULL,
[Quantity] [int] NOT NULL,
[SalePrice] [float] NOT NULL,
[StoreId] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[RainChecks] ADD CONSTRAINT [PK_RainChecks] PRIMARY KEY CLUSTERED  ([RaincheckId])
GO
CREATE NONCLUSTERED INDEX [IX_RainChecks_ProductId] ON [dbo].[RainChecks] ([ProductId])
GO
CREATE NONCLUSTERED INDEX [IX_RainChecks_StoreId] ON [dbo].[RainChecks] ([StoreId])
GO
ALTER TABLE [dbo].[RainChecks] ADD CONSTRAINT [FK_RainChecks_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RainChecks] ADD CONSTRAINT [FK_RainChecks_Stores_StoreId] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[Stores] ([StoreId]) ON DELETE CASCADE
GO
