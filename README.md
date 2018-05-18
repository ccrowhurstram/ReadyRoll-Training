# ReadyRoll-Training

Redgate ReadyRoll training material

This repo includes:
* Material on learning how to create database migrations using ReadyRoll
* Material on learning how to create database migrations using Entity Framework
* Material on using ReadyRoll in junction with:
    * Entity Framework migrations **AND**
    * RAM internal powershell dev-tools ([PSSeries5Dev](https://ram-christianacca.visualstudio.com/PSSeries5Dev) and [PSSeries5DbMigration](https://ram-christianacca.visualstudio.com/PSSeries5DbMigration))

## Readyroll installation

* Install latest version of ReadyRoll:
    * download the latest [SQLToolbelt](https://www.red-gate.com/products/sql-development/sql-toolbelt/) installer
    * run installer and select ReadyRoll product

## Getting started

1. Read [introduction to database development using ReadyRoll](intro-db-development-using-readyroll.md)
2. Work through [ReadyRoll labs](Examples/ReadyRoll_Only/readme.md)
3. Work through [Entity Framework migrations labs](Examples/EntityFramework_Only/readme.md)
4. Work through [Readyroll + RAM internal dev tools labs](Examples/RR_Plus_DevTool/readme.md)
5. Read [Dev tools workflow](devtool-workflow.md)


## Presenter notes

* Workshop 1 (estimate 3 hrs):
    * Talk through [Intro to ReadyRoll](intro-db-development-using-readyroll.md)
    * Let team work through [ReadyRoll lab - basic usage](Examples/ReadyRoll_Only/basics-example.md)
* Workshop 2 (estimate 4 hrs):
    * Talk through [What is ReadyRoll](what-is-ready-roll.md)
    * Give a quick tour of the Ram.Series5.Db Visual Studio solution and the various file in use
    * Give a practical example of how ReadyRoll uses the Shadown Database to detect and generate migration scripts
    * Let team work through [ReadyRoll lab - merge conflicts](Examples/ReadyRoll_Only/merge-conflicts-example.md)
* Workshop 3 (estimate 4 hrs):
    * Let team work through [Entity Framework lab - basic usage](Examples/EntityFramework_Only/basics-example.md)
    * Talk through day-to-day workflow
    * Let team work through [RAM internal dev tools - basic usage](Examples/RR_Plus_DevTool/basics-example.md)
    * Talk through [RAM internal dev tools - merge conflicts](Examples/RR_Plus_DevTool/merge-conflicts-example.md)