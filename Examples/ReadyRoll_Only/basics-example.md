# Readyroll lab - basic usage

This labs walks you through using ReadyRoll to perform common database change scenarios

## Scenario 1

**Steps**

1. Open the Visual Studio solution: Examples\src\VS2015\PartsUnlimited-2015.sln
2. Deploy the solution: Build > Deploy Solution
    * This will create `PartsUnlimited_Dev` database in LocalDb on your machine
3. Confirm that the database was created `PartsUnlimited_Dev` database
    * connection details:
        * server - (localdb)\ProjectsV13
        * database - PartsUnlimited_Dev
    * to follow along with the remaining instructions, connect to the database using SQL Server Object explorer in Visual Studio (see: https://msdn.microsoft.com/en-us/library/hh272693(v=vs.103).aspx)
4. Complete the steps from the offical Microsoft lab, starting from the section ["Making changes"](https://almvm.azurewebsites.net/labs/tfs/readyroll/#making-changes)

## Scenario 2

Aggregate/collapse all the migration scripts created in scenario 1 ('Migrations\1.0.1\') into 1 migration script

The end result: a single migration script Migrations\1.0.1\001_Support_GBP.sql

**Steps**

1. Complete scenario 1
2. Replace all the script files in 'Migrations\1.0.1' with a single script named '001_Support_GBP.sql'
3. Verify your changes:
    1. Use the ReadyRoll **'Refresh'** button (you should see no changes reported by ReadyRoll)
    2. (Optional) Drop the `PartsUnlimited_Dev` database and redeploy (eg Build > Deploy Solution) (you *might* want to do this to gain more reasurance)


## Scenario 3

Scenario 1 uses *two methods* to make changes to the database:
* add scripts directly to ReadyRoll database project; use ReadyRoll to deploy these changes against the database (see Task 4 and 6)
* make changes directory to the database and use ReadyRoll to import the changes as a script (see Task 5)

In this scenario you will *repeat* scenario 1 but this time using SQL Server Management Studio to make all the changes directly to the database and import them using ReadRoll as script(s)

**Steps**

1. Reset your environment (if you have worked through scenario 1 and/or 2 above):
    1. Undo any changes you may have made in scenario 1
    2. Drop the `PartsUnlimited_Dev` database
    3. Redeploy the database (eg Build > Deploy Solution)
2. Repeat the changes you made in scenario 1 (Task 4-6), but this time make the changes using SQL Server Management Studio


## Scenario 4

This scenario builds on scenario 1 (or 2). You will add a view to the database (a programmatic object). You will add the view directly to the database and then use ReadyRoll to import a Programmatic object migration script

**Steps**

1. Complete scenario 1 if you haven't already
2. Use SQL Server Management Studio to create a view named `vwProduct`. It should have the following body: `SELECT * FROM dbo.Products`
3. Back in ReadyRoll:
    1. click **'Import and generate script'**
    2. click **'Refresh'** to verify the script

## Scenario 5

This scenario builds on scenario 4. You will make a change to the view you created in scenario 4. You make this change in the ReadyRoll script and use ReadyRoll to deploy this change to your dev database

**Steps**

1. Complete scenario 4 if you haven't already
2. In the ReadyRoll database project:
    1. open the script Programmable Objects\dbo\Views\vwProducts.sql
    2. Modify the script, replacing the `SELECT *` with an explicit list of columns
    3. Click **'Deploy Project'**
    4. click **'Refresh'** to verify the script