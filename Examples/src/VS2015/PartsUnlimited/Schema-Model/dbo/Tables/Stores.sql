CREATE TABLE [dbo].[Stores]
(
[StoreId] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (max) NULL
)
GO
ALTER TABLE [dbo].[Stores] ADD CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED  ([StoreId])
GO
