# Database development using readyroll

## Problems we're trying to solve

* How to update an existing database (schema and data) *in place* with changes that have been made during development
* How do we version control the database along with the rest of the application code that the db belongs?

## Candidate solutions

**Available approaches**
	
* **State based** approach:
	* developer maintain the latest definition of each database object in a seperate script file *per object* (equivalent of c# class file)
	* use a tool that builds a fresh database from all the scripts (equivalent of compiling an exe or dll)
	* use a tool to compare and sync a target database with the database built from all the db object script files
* **Migrations** approach
	* developer describes the *changes* she has made to the database as a script file
	* use a tool that executes these migration scripts in the order they were created against a target database
* [Redgate ReadyRoll](https://www.red-gate.com/products/sql-development/readyroll/) method:
	* picks the best from the *State based* and *Migrations* approaches
	* uses *State based* approach for programmatic objects (eg stored procs and view)
	* uses *Migrations* for tables

**Overview videos**

* [State based vs migrations](https://app.pluralsight.com/player?course=database-delivery-best-practices&author=vladimir-khorikov&name=database-delivery-best-practices-m1&clip=4&mode=live)
* [Migration approach](https://app.pluralsight.com/player?course=database-delivery-best-practices&author=vladimir-khorikov&name=database-delivery-best-practices-m3&clip=1&mode=live)


### More information

* [Database Delivery Best Practices](https://app.pluralsight.com/library/courses/database-delivery-best-practices/table-of-contents)


## How readyroll migrations fit into the overall application development workflow

* [Intro video](https://sec.ch9.ms/ch9/9fe5/2759956c-adf4-4997-a1ff-6a39a8179fe5/200RedgateDataTools_high.mp4)
* [Extending DevOps practices to SQL Server databases with Redgate's ReadyRoll](https://www.youtube.com/watch?v=jH4ZCU3Oydg)
* Summary notes: [What it ReadyRoll](what-is-ready-roll.md)



