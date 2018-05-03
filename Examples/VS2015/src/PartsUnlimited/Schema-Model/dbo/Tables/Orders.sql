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
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED  ([OrderId])
GO
