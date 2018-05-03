CREATE TABLE [dbo].[Categories]
(
[CategoryId] [int] NOT NULL IDENTITY(1, 1),
[Description] [nvarchar] (max) NULL,
[ImageUrl] [nvarchar] (max) NULL,
[Name] [nvarchar] (max) NOT NULL
)
GO
ALTER TABLE [dbo].[Categories] ADD CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED  ([CategoryId])
GO
