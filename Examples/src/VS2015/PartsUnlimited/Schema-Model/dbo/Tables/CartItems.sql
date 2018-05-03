CREATE TABLE [dbo].[CartItems]
(
[CartItemId] [int] NOT NULL IDENTITY(1, 1),
[CartId] [nvarchar] (max) NOT NULL,
[Count] [int] NOT NULL,
[DateCreated] [datetime2] NOT NULL,
[ProductId] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[CartItems] ADD CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED  ([CartItemId])
GO
CREATE NONCLUSTERED INDEX [IX_CartItems_ProductId] ON [dbo].[CartItems] ([ProductId])
GO
ALTER TABLE [dbo].[CartItems] ADD CONSTRAINT [FK_CartItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId]) ON DELETE CASCADE
GO
