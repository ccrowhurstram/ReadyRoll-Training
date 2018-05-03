CREATE TABLE [dbo].[AspNetRoleClaims]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ClaimType] [nvarchar] (max) NULL,
[ClaimValue] [nvarchar] (max) NULL,
[RoleId] [nvarchar] (450) NOT NULL
)
GO
ALTER TABLE [dbo].[AspNetRoleClaims] ADD CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED  ([Id])
GO
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims] ([RoleId])
GO
ALTER TABLE [dbo].[AspNetRoleClaims] ADD CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE
GO
