CREATE TABLE [dbo].[AspNetUsers]
(
[Id] [nvarchar] (450) NOT NULL,
[AccessFailedCount] [int] NOT NULL,
[ConcurrencyStamp] [nvarchar] (max) NULL,
[Email] [nvarchar] (256) NULL,
[EmailConfirmed] [bit] NOT NULL,
[LockoutEnabled] [bit] NOT NULL,
[LockoutEnd] [datetimeoffset] NULL,
[Name] [nvarchar] (max) NULL,
[NormalizedEmail] [nvarchar] (256) NULL,
[NormalizedUserName] [nvarchar] (256) NULL,
[PasswordHash] [nvarchar] (max) NULL,
[PhoneNumber] [nvarchar] (max) NULL,
[PhoneNumberConfirmed] [bit] NOT NULL,
[SecurityStamp] [nvarchar] (max) NULL,
[TwoFactorEnabled] [bit] NOT NULL,
[UserName] [nvarchar] (256) NULL
)
GO
ALTER TABLE [dbo].[AspNetUsers] ADD CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED  ([Id])
GO
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers] ([NormalizedEmail])
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
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] ([NormalizedUserName]) WHERE ([NormalizedUserName] IS NOT NULL)
GO
