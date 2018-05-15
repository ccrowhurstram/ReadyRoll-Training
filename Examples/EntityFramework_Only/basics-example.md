# Readyroll lab - basic usage

This labs walks you through using Entity Framework to perform common database change scenarios

## Scenario 1

**Steps**

1. Open the Visual Studio solution: Examples\src\VS2015.EntityFramework\PartsUnlimited-2015.sln
2. Deploy database by following steps in [PartsUnlimited.Infrastructure/ReadMe.md](../src/VS2015.EntityFramework/PartsUnlimited.Infrastructure/ReadMe.md)
3. Confirm that the database was created `PartsUnlimited_Dev` database
    * connection details:
        * server - (localdb)\ProjectsV13
        * database - PartsUnlimitedEF_Dev
    * to follow along with the remaining instructions, connect to the database using SQL Server Object explorer in Visual Studio (see: https://msdn.microsoft.com/en-us/library/hh272693(v=vs.103).aspx)
4. Open the class `Product` and:
    * copy the existing property `Price`. Name this new property `PriceGBP`
    * rename the property `Price` to `PriceUSD`
5. Generate a new Entity Framework migration:
    1. Open Package Manager Console
    2. Run the command: Add-Migration 'Support GBP'
6. Fixup the migration just generated (see 'Migration fixup' section below for details)
7. Add to the `Up` migration method the following line: `Sql("UPDATE dbo.Products SET PriceGBP = PriceUSD * 0.8");`
    * ie populate the new `PriceGBP` column for existing records
8. Remove SQL Default constraint that Entity Framework will add to the new PriceGBP column (see 'Remove SQL Default constraint' section below for details)
9. Update the database with the migration:
    1. Open Package Manager Console
    2. Run the command: Update-Database

### Migration fixup

The migration generated due to the rename of the `Price` property drops the existing column and add a new column with the name `PriceUSD`.

We need to replace this with a migration that renames the existing `Price` column to `PriceUSD`.

**Replace...**

```cs
    public partial class SupportGBP : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Products", "PriceUSD", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.Products", "PriceGBP", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            DropColumn("dbo.Products", "Price");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Products", "Price", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            DropColumn("dbo.Products", "PriceGBP");
            DropColumn("dbo.Products", "PriceUSD");
        }
    }
```

**... with**

```cs
    public partial class SupportGBP : DbMigration
    {
        public override void Up()
        {
            RenameColumn("dbo.Products", "Price", "PriceUSD");
            AddColumn("dbo.Products", "PriceGBP", c => c.Decimal(nullable: false, precision: 18, scale: 2));
        }
        
        public override void Down()
        {
            RenameColumn("dbo.Products", "PriceUSD", "Price");
            DropColumn("dbo.Products", "PriceGBP");
        }
    }
```

### Remove SQL Default constraint

EF migrations will have added a default constraint to the the PriceGBP column. This is so that the *existing* records will automatically have a value updated into this new column and thus satisfy the not-null column constraint.

While this is useful (it stops the migration failing), we do **NOT** want a default value to be applied by the db for *new* records.

Add the following lines to the `Up` method:

```cs
            Sql(@"
DECLARE @var0 nvarchar(128)
SELECT @var0 = name
FROM sys.default_constraints
WHERE parent_object_id = object_id(N'dbo.Products')
AND col_name(parent_object_id, parent_column_id) = 'PriceGBP';
IF @var0 IS NOT NULL
    EXECUTE('ALTER TABLE [dbo].[Products] DROP CONSTRAINT [' + @var0 + ']')
");
```