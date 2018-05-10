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
3. Merge the branch 'rr-merge-scenario2-other' into the current branch you have checked out ('rr-merge-scenario1-begin')
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