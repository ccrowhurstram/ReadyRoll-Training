-- <Migration ID="de25d7f8-df78-4c73-84b4-ba95d588ce4f" />
GO


GO
PRINT N'Altering [dbo].[Products]...';


GO
ALTER TABLE [dbo].[Products] ALTER COLUMN [PriceGBP] DECIMAL (18, 2) NOT NULL;


GO

