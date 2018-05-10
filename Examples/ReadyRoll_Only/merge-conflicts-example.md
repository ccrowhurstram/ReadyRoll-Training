# Readyroll lab - merge conflicts

This labs walks you through examples of resolving merge conflicts in database source code

# Scenario 1

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