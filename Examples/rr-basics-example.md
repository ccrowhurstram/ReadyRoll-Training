# Readyroll lab - basic usage

This labs walks you through using ReadyRoll to perform common database change scenarios

## Steps

1. Open the Visual Studio solution: Examples\VS2015\PartsUnlimited-2015.sln
2. Deploy the solution: Build > Deploy Solution
    * This will create `PartsUnlimited_Dev` database in LocalDb on your machine
3. Confirm that the database was created `PartsUnlimited_Dev` database
    * connection details:
        * server - (localdb)\ProjectsV13
        * database - PartsUnlimited_Dev
    * to follow along with the remaining instructions, connect to the database using SQL Server Object explorer in Visual Studio (see: https://msdn.microsoft.com/en-us/library/hh272693(v=vs.103).aspx)
4. Complete the steps from the offical Microsoft lab, starting from the section ["Making changes"](https://almvm.azurewebsites.net/labs/tfs/readyroll/#making-changes)