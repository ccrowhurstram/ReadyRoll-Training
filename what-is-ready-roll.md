# What is ReadyRoll

## Tooling to create a database migration script

* A migration script will move a database from one version to the next.
* A migration script will include changes to both schema and data
* ReadyRoll allows programmatic objects (eg views and stored procs) to be maintained as a SQL script per database object (state based method)
* ReadyRoll allows ad-hoc scripts to be included which will run on every deployment
* Can be configured to identify data changes in specific tables and generate SQL migration scripts containing the insert/update /delete statements that will "replay" these changes against a target database
* Will identify changes to schema (eg tables) and generate the DDL statements (eg ALTER TABLE) that will apply those changes to the target database
* **TIP**: make sure you have understand how the [Shadow database is used by ReadyRoll](https://documentation.red-gate.com/rr1/key-concepts/target-and-shadow-databases) in order to detect changes

For detailed information see: https://documentation.red-gate.com/rr1/key-concepts


## Executes migration scripts against a target database to update that database to a new version

* Knows which migration scripts that need to be exucuted against a target database (tracks the list of migrations that have already been applied)
* Executes these migrations in a single transaction that either succeeds or rolls back in full
* **IMPORTANT**: in practice not all changes that need to be applied to a database to move it from one version of another can be expressed in SQL migrations
    * In Series5 additional database initialization logic runs when a new migration is applied to a target database

For detailed information see: https://documentation.red-gate.com/rr1/deployment
