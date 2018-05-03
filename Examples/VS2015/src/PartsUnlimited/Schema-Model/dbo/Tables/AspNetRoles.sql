CREATE TABLE [dbo].[AspNetRoles]
(
[Id] [nvarchar] (450) NOT NULL,
[ConcurrencyStamp] [nvarchar] (max) NULL,
[Name] [nvarchar] (256) NULL,
[NormalizedName] [nvarchar] (256) NULL
)
GO
ALTER TABLE [dbo].[AspNetRoles] ADD CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED  ([Id])
GO
SET ANSI_NULLS ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_WARNINGS ON
GO
SET ARITHABORT ON
GO
SET CONCAT_NULL_YIELDS_NULL ON
GO
SET NUMERIC_ROUNDABORT OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] ([NormalizedName]) WHERE ([NormalizedName] IS NOT NULL)
GO
