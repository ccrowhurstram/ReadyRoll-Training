# Readyroll lab - merge conflicts

This labs walks you through examples of resolving merge conflicts in database source code

## Scenario 1

In this scenario you will walk through a merge that does *not have any conflicts*. ie another developer has made some changes that do not touch database object you have changed.

This scenario get's you familar with the steps of performing an easy merge. Later scenarios will then introduce the additional steps you would follow in the case that you and another developer have made changes to the same database objects

**Steps**

1. Checkout branch 'rr-merge-scenario1-begin'
    * This branch represents a snapshot of the code base after completing [basic example | scenario 2](basics-example.md)
2. Ensure that your database is synchronised with the source code:
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13` 
        * (see [basic example | scenario 1](basics-example.md) for how to connect to your local server)
    2. Deploy the solution: Build > Deploy Solution
3. Merge the branch 'rr-merge-scenario1-other' into the current branch you have checked out ('rr-merge-scenario1-begin') 
    * Take note of the following changes that were merged to your branch:
        * Programmable Objects\dbo\Views\vwProducts.sql
        * Migrations\1.0.1\001_Add_Category_code.sql
        * Schema-Model\dbo\Tables\Categories.sql
4. Verify that the merge was successful ie that changes from branch 'rr-merge-scenario1-other' successfully integrate with the changes made on the current branch:
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13`
    2. Deploy the solution: Build > Deploy Solution

To review a completed solution check out the branch: 'rr-merge-scenario1-end'


## Scenario 2

In this scenario you will walk through a merge that has conflicting changes that is *NOT detected by git*.

The conflict will only be detected when using ReadyRoll to verify the final merged set of scripts.

You will resolve this conflict by *modifing your migration (**perferred**)*. In the next scenario you will resolve this conflict by modifing the incoming migration.

**Steps**

1. Checkout branch 'rr-merge-scenario2-begin'
    * This branch represents a snapshot of the code base after completing [basic example | scenario 2](basics-example.md)
2. Ensure that your database is synchronised with the source code:
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13` 
        * (see [basic example | scenario 1](basics-example.md) for how to connect to your local server)
    2. Deploy the solution: Build > Deploy Solution
3. Merge the branch 'rr-merge-scenario2-other' into the current branch you have checked out ('rr-merge-scenario2-begin')
    * Take note of the following changes that were merged to your branch:
        * Programmable Objects\dbo\Views\vwProducts.sql
        * Migrations\1.0.1\001_20180508_Default_Product_RecommendationId.sql
        * Schema-Model\dbo\Tables\Products.sql
4. Verify the merge (this will fail):
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13`
    2. Deploy the solution: Build > Deploy Solution
5. Resolve conflict to the dbo.Products table:
    1. Rename the script Migrations\1.0.1\001_20180507_Support_GBP.sql -> 001_20180509_Support_GBP.sql
        * This ensures your script ('Support_GBP.sql') runs *after* the incoming migration '001_20180508_Default_Product_RecommendationId.sql'`
    2. Modify the script '001_20180509_Support_GBP.sql' so that the constraint `CHK_Products` references the column `PricesUSD` rather than `Price`:
		1. Add the following line of SQL to the start of the script: `ALTER TABLE [dbo].[Products] DROP CONSTRAINT [CHK_Products]`
		2. Add the following line of SQL to the end of the script: `ALTER TABLE [dbo].[Products] ADD CONSTRAINT [CHK_Products] CHECK (([PriceUSD]<=(10000.00) AND [RecommendationId]<=(100)))` 
		3. Append to each SQL line you've just added a `GO` batch seperator
6. Resolve conflict to the dbo.vwProducts view:
    1. Modify the Programmable Objects\dbo\Views\vwProducts.sql to reference the PriceUSD and PriceGBP column
7. Verify the changes:
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13`
    2. Deploy the solution: Build > Deploy Solution

To review a completed solution check out the branch: 'rr-merge-scenario2-end'


## Scenario 3

In this scenario you will *repeat* scenario 2 but this time you resolve the conflict by modifying the incoming script.

**CRITICAL**: Unless you know with *certainty* that an incoming migration has NOT been deployed to a non-developer machine, you should *never* modify an incoming migration script

**Steps**

1. Checkout branch 'rr-merge-scenario3-begin'
    * This branch represents a snapshot of the code base after completing [basic example | scenario 2](basics-example.md)
2. Ensure that your database is synchronised with the source code:
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13` 
        * (see [basic example | scenario 1](basics-example.md) for how to connect to your local server)
    2. Deploy the solution: Build > Deploy Solution
3. Merge the branch 'rr-merge-scenario3-other' into the current branch you have checked out ('rr-merge-scenario3-begin')
    * Take note of the following changes that were merged to your branch:
        * Programmable Objects\dbo\Views\vwProducts.sql
        * Migrations\1.0.1\001_20180508_Default_Product_RecommendationId.sql
        * Schema-Model\dbo\Tables\Products.sql
4. Verify the merge (this will fail):
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13`
    2. Deploy the solution: Build > Deploy Solution
5. Resolve conflict to the dbo.Products table:
    1. Modify the script '001_20180508_Default_Product_RecommendationId.sql' so that the constraint `CHK_Products` references the column `PricesUSD` rather than `Price`
6. Resolve conflict to the dbo.vwProducts view:
    1. Modify the Programmable Objects\dbo\Views\vwProducts.sql to reference the PriceUSD and PriceGBP column
7. Verify the changes:
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13`
    2. Deploy the solution: Build > Deploy Solution

To review a completed solution check out the branch: 'rr-merge-scenario3-end'


## Scenario 4

In this scenario you will walk through a merge that has conflicting changes that is *partially detected by git* using the standard merge tools.

You will see that the schema change is detected at merge time, but the data change goes undetected until ReadyRoll verifies the combined set of merged scripts.

You will resolve the merge by:
* resolving the file conflicts using standard git merge tool
* splitting your migration script into two so that the parts can be run successfully either side of the incoming migration script

**Steps**

1. Checkout branch 'rr-merge-scenario4-begin'. This branch represents:
    * a snapshot of the code base after completing [basic example | scenario 2](basics-example.md)
    * an additional record added to `dbo.Products` table
    * new view `vwProducts`
2. Ensure that your database is synchronised with the source code:
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13` 
        * (see [basic example | scenario 1](basics-example.md) for how to connect to your local server)
    2. Deploy the solution: Build > Deploy Solution
3. Merge the branch 'rr-merge-scenario4-other' into the current branch you have checked out ('rr-merge-scenario4-begin')
    * Take note of the following changes that were merged to your branch:
        * Programmable Objects\dbo\Views\vwProducts.sql
        * Migrations\1.0.1\001_20180508_Products-Price.sql
        * Schema-Model\dbo\Tables\Products.sql
4. Using standard merge tools, resolve conflicts to:
    * Schema-Model\dbo\Tables\Products.sql
    * Programmable Objects\dbo\Views\vwProducts.sql
5. Verify the merge (this will fail):
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13`
    2. Deploy the solution: Build > Deploy Solution
6. Rename the script Migrations\1.0.1\001_20180507_Support_GBP.sql -> 001_20180507_Support_GBP_Part1.sql
7. Create a new script Migrations\1.0.1\001_20180509_Support_GBP_Part2.sql
8. Split the script '001_20180507_Support_GBP_Part1.sql'
	* *move* the rename of `Price` column (lines 4-7) into '001_20180509_Support_GBP_Part2.sql'
        * The rename causes the incoming migration script to fail when it tries to insert into the `Products` table and so needs to be run after this incoming script
	* *modify* the SQL `UPDATE dbo.Products SET PriceGBP = PriceUSD * 0.8` to `UPDATE dbo.Products SET PriceGBP = Price * 0.8`
    * *remove* from '001_20180507_Support_GBP_Part1.sql' the lines starting `PRINT (N'Add 1 row to [dbo].[Products]')` through to `SET IDENTITY_INSERT [dbo].[Products] OFF;`
        * This record is also inserted by the incoming migration script
    * *add* to '001_20180509_Support_GBP_Part2.sql' the following SQL `UPDATE dbo.Products SET PriceGBP = 31.2 WHERE ProductId = 19`
		* This adds the `PriceGBP` value to the `Products` record inserted by the incoming migration script
    * *move* the lines `PRINT N'Altering [dbo].[Products]...';` through to `ALTER TABLE [dbo].[Products] ALTER COLUMN [PriceGBP] DECIMAL (18, 2) NOT NULL;` into '001_20180509_Support_GBP_Part2.sql'
        * This constraint causes the incoming migration script to fail when it tries to insert into the `Products` table and so needs to be run after this incoming script
9. Verify the changes:
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13`
    2. Deploy the solution: Build > Deploy Solution

To review a completed solution check out the branch: 'rr-merge-scenario4-end'

**Are we done?**

Technically, the migration scripts are merged sucessfully. Practically, there is one additional change that should be made to the `PriceGBP` column. What is it?


## Scenario 5

In this scenario you will *repeat* scenario 4 using an alternative approach to resolving the conflict. Instead of splitting the script '001_20180507_Support_GBP_Part1.sql' into two parts, you will:
1. *rename* the script so that it runs after the incoming migration script
2. modify the script so that it does not insert a duplicate record into the `Products` table

**Steps**

1. Repeat steps 1-5 in scenario 4
2. Rename the script Migrations\1.0.1\001_20180507_Support_GBP.sql -> 001_20180509_Support_GBP.sql
3. Modify the script '001_20180509_Support_GBP.sql':
    * *remove* the lines starting `PRINT (N'Add 1 row to [dbo].[Products]')` through to `SET IDENTITY_INSERT [dbo].[Products] OFF;`
        * This record is also inserted by the incoming migration script
4. Verify the changes:
    1. Drop the database `PartsUnlimited_Dev` from your local server `(localdb)\ProjectsV13`
    2. Deploy the solution: Build > Deploy Solution

**Are we done?**

Whilst the merge now all appears to be successful, there is a problem. The record in the `Products` table that was causing us trouble, if you were to compare it to the values it had at the end of scenario 4, you would find it slightly different.

To complete the scenario:
1. Work out what is different about this record compared to it's values at end of scenario 4
2. Explain why there is a difference
3. Make necessary changes to '001_20180509_Support_GBP.sql' script to ensure that it's values are the same as at the end of scenario 4

To review a completed solution check out the branch: 'rr-merge-scenario5-end'