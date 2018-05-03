-- <Migration ID="0c273db2-1b74-45a3-a2a5-c182504c119b" />
GO

PRINT N'Creating [dbo].[AspNetRoles]'
GO
CREATE TABLE [dbo].[AspNetRoles]
(
[Id] [nvarchar] (450) NOT NULL,
[ConcurrencyStamp] [nvarchar] (max) NULL,
[Name] [nvarchar] (256) NULL,
[NormalizedName] [nvarchar] (256) NULL
)
GO
PRINT N'Creating primary key [PK_AspNetRoles] on [dbo].[AspNetRoles]'
GO
ALTER TABLE [dbo].[AspNetRoles] ADD CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [RoleNameIndex] on [dbo].[AspNetRoles]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] ([NormalizedName]) WHERE ([NormalizedName] IS NOT NULL)
GO
PRINT N'Creating [dbo].[AspNetRoleClaims]'
GO
CREATE TABLE [dbo].[AspNetRoleClaims]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ClaimType] [nvarchar] (max) NULL,
[ClaimValue] [nvarchar] (max) NULL,
[RoleId] [nvarchar] (450) NOT NULL
)
GO
PRINT N'Creating primary key [PK_AspNetRoleClaims] on [dbo].[AspNetRoleClaims]'
GO
ALTER TABLE [dbo].[AspNetRoleClaims] ADD CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_AspNetRoleClaims_RoleId] on [dbo].[AspNetRoleClaims]'
GO
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims] ([RoleId])
GO
PRINT N'Creating [dbo].[AspNetUsers]'
GO
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
PRINT N'Creating primary key [PK_AspNetUsers] on [dbo].[AspNetUsers]'
GO
ALTER TABLE [dbo].[AspNetUsers] ADD CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [EmailIndex] on [dbo].[AspNetUsers]'
GO
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers] ([NormalizedEmail])
GO
PRINT N'Creating index [UserNameIndex] on [dbo].[AspNetUsers]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] ([NormalizedUserName]) WHERE ([NormalizedUserName] IS NOT NULL)
GO
PRINT N'Creating [dbo].[AspNetUserClaims]'
GO
CREATE TABLE [dbo].[AspNetUserClaims]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ClaimType] [nvarchar] (max) NULL,
[ClaimValue] [nvarchar] (max) NULL,
[UserId] [nvarchar] (450) NOT NULL
)
GO
PRINT N'Creating primary key [PK_AspNetUserClaims] on [dbo].[AspNetUserClaims]'
GO
ALTER TABLE [dbo].[AspNetUserClaims] ADD CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_AspNetUserClaims_UserId] on [dbo].[AspNetUserClaims]'
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims] ([UserId])
GO
PRINT N'Creating [dbo].[AspNetUserLogins]'
GO
CREATE TABLE [dbo].[AspNetUserLogins]
(
[LoginProvider] [nvarchar] (450) NOT NULL,
[ProviderKey] [nvarchar] (450) NOT NULL,
[ProviderDisplayName] [nvarchar] (max) NULL,
[UserId] [nvarchar] (450) NOT NULL
)
GO
PRINT N'Creating primary key [PK_AspNetUserLogins] on [dbo].[AspNetUserLogins]'
GO
ALTER TABLE [dbo].[AspNetUserLogins] ADD CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED  ([LoginProvider], [ProviderKey])
GO
PRINT N'Creating index [IX_AspNetUserLogins_UserId] on [dbo].[AspNetUserLogins]'
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins] ([UserId])
GO
PRINT N'Creating [dbo].[AspNetUserRoles]'
GO
CREATE TABLE [dbo].[AspNetUserRoles]
(
[UserId] [nvarchar] (450) NOT NULL,
[RoleId] [nvarchar] (450) NOT NULL
)
GO
PRINT N'Creating primary key [PK_AspNetUserRoles] on [dbo].[AspNetUserRoles]'
GO
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED  ([UserId], [RoleId])
GO
PRINT N'Creating index [IX_AspNetUserRoles_RoleId] on [dbo].[AspNetUserRoles]'
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles] ([RoleId])
GO
PRINT N'Creating [dbo].[AspNetUserTokens]'
GO
CREATE TABLE [dbo].[AspNetUserTokens]
(
[UserId] [nvarchar] (450) NOT NULL,
[LoginProvider] [nvarchar] (450) NOT NULL,
[Name] [nvarchar] (450) NOT NULL,
[Value] [nvarchar] (max) NULL
)
GO
PRINT N'Creating primary key [PK_AspNetUserTokens] on [dbo].[AspNetUserTokens]'
GO
ALTER TABLE [dbo].[AspNetUserTokens] ADD CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED  ([UserId], [LoginProvider], [Name])
GO
PRINT N'Creating [dbo].[Products]'
GO
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
PRINT N'Creating primary key [PK_Products] on [dbo].[Products]'
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED  ([ProductId])
GO
PRINT N'Creating index [IX_Products_CategoryId] on [dbo].[Products]'
GO
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products] ([CategoryId])
GO
PRINT N'Creating [dbo].[CartItems]'
GO
CREATE TABLE [dbo].[CartItems]
(
[CartItemId] [int] NOT NULL IDENTITY(1, 1),
[CartId] [nvarchar] (max) NOT NULL,
[Count] [int] NOT NULL,
[DateCreated] [datetime2] NOT NULL,
[ProductId] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_CartItems] on [dbo].[CartItems]'
GO
ALTER TABLE [dbo].[CartItems] ADD CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED  ([CartItemId])
GO
PRINT N'Creating index [IX_CartItems_ProductId] on [dbo].[CartItems]'
GO
CREATE NONCLUSTERED INDEX [IX_CartItems_ProductId] ON [dbo].[CartItems] ([ProductId])
GO
PRINT N'Creating [dbo].[Orders]'
GO
CREATE TABLE [dbo].[Orders]
(
[OrderId] [int] NOT NULL IDENTITY(1, 1),
[Address] [nvarchar] (70) NOT NULL,
[City] [nvarchar] (40) NOT NULL,
[Country] [nvarchar] (40) NOT NULL,
[Email] [nvarchar] (max) NOT NULL,
[Name] [nvarchar] (160) NOT NULL,
[OrderDate] [datetime2] NOT NULL,
[Phone] [nvarchar] (24) NOT NULL,
[PostalCode] [nvarchar] (10) NOT NULL,
[Processed] [bit] NOT NULL,
[State] [nvarchar] (40) NOT NULL,
[Total] [decimal] (18, 2) NOT NULL,
[Username] [nvarchar] (max) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Orders] on [dbo].[Orders]'
GO
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED  ([OrderId])
GO
PRINT N'Creating [dbo].[OrderDetails]'
GO
CREATE TABLE [dbo].[OrderDetails]
(
[OrderDetailId] [int] NOT NULL IDENTITY(1, 1),
[OrderId] [int] NOT NULL,
[ProductId] [int] NOT NULL,
[Quantity] [int] NOT NULL,
[UnitPrice] [decimal] (18, 2) NOT NULL
)
GO
PRINT N'Creating primary key [PK_OrderDetails] on [dbo].[OrderDetails]'
GO
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED  ([OrderDetailId])
GO
PRINT N'Creating index [IX_OrderDetails_OrderId] on [dbo].[OrderDetails]'
GO
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderId] ON [dbo].[OrderDetails] ([OrderId])
GO
PRINT N'Creating index [IX_OrderDetails_ProductId] on [dbo].[OrderDetails]'
GO
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductId] ON [dbo].[OrderDetails] ([ProductId])
GO
PRINT N'Creating [dbo].[Categories]'
GO
CREATE TABLE [dbo].[Categories]
(
[CategoryId] [int] NOT NULL IDENTITY(1, 1),
[Description] [nvarchar] (max) NULL,
[ImageUrl] [nvarchar] (max) NULL,
[Name] [nvarchar] (max) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Categories] on [dbo].[Categories]'
GO
ALTER TABLE [dbo].[Categories] ADD CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED  ([CategoryId])
GO
PRINT N'Creating [dbo].[RainChecks]'
GO
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
PRINT N'Creating primary key [PK_RainChecks] on [dbo].[RainChecks]'
GO
ALTER TABLE [dbo].[RainChecks] ADD CONSTRAINT [PK_RainChecks] PRIMARY KEY CLUSTERED  ([RaincheckId])
GO
PRINT N'Creating index [IX_RainChecks_ProductId] on [dbo].[RainChecks]'
GO
CREATE NONCLUSTERED INDEX [IX_RainChecks_ProductId] ON [dbo].[RainChecks] ([ProductId])
GO
PRINT N'Creating index [IX_RainChecks_StoreId] on [dbo].[RainChecks]'
GO
CREATE NONCLUSTERED INDEX [IX_RainChecks_StoreId] ON [dbo].[RainChecks] ([StoreId])
GO
PRINT N'Creating [dbo].[Stores]'
GO
CREATE TABLE [dbo].[Stores]
(
[StoreId] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (max) NULL
)
GO
PRINT N'Creating primary key [PK_Stores] on [dbo].[Stores]'
GO
ALTER TABLE [dbo].[Stores] ADD CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED  ([StoreId])
GO
PRINT N'Adding foreign keys to [dbo].[AspNetRoleClaims]'
GO
ALTER TABLE [dbo].[AspNetRoleClaims] ADD CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[AspNetUserRoles]'
GO
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[AspNetUserClaims]'
GO
ALTER TABLE [dbo].[AspNetUserClaims] ADD CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[AspNetUserLogins]'
GO
ALTER TABLE [dbo].[AspNetUserLogins] ADD CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[AspNetUserTokens]'
GO
ALTER TABLE [dbo].[AspNetUserTokens] ADD CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[CartItems]'
GO
ALTER TABLE [dbo].[CartItems] ADD CONSTRAINT [FK_CartItems_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[Products]'
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([CategoryId]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[OrderDetails]'
GO
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([OrderId]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[RainChecks]'
GO
ALTER TABLE [dbo].[RainChecks] ADD CONSTRAINT [FK_RainChecks_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Products] ([ProductId]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RainChecks] ADD CONSTRAINT [FK_RainChecks_Stores_StoreId] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[Stores] ([StoreId]) ON DELETE CASCADE
GO
