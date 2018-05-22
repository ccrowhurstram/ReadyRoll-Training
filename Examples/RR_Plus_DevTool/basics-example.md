# RAM internal dev tools - basic usage

These labs walks you through using RAM internal dev tools (eg PSSeries5) in conjunction with ReadyRoll to perform common database change scenarios.

Note: Internally RAM internal dev tools uses Entity Framework migrations to generate the schema change migrations.

## Scenario 1

In this scenario you've going to create a new property on an existing class. This will require both a schema and data changes (eg the insert of meta data records).

The dev tool will walk you through a wizard via the powershell console. The wizard will ask you what type of migration you want perform and then inform you of the steps you need to take.

By the end of the wizard:
* the tool will have generated a schema migration script using Entity Framework under the covers
* you will have pasted the script into a ReadyRoll migration script file
* ReadyRoll will have captured, as a script, the data changes that support the creation of the new property
* you will have appended this script to the schema migration script

**Steps**

1. Check out the branch 'devtool-training'
2. From this checked out start a new branch. Name the branch 'xx/devtool-training' replacing *xx* with your initials
    * For example, I would create a branch named 'cc/devtool-training'
3. Launch the dev tool Series5\run.bat (make sure to "Run As Administrator")
    * this will launch a powershell console window with the necessary dev tools loaded
4. Start the Db Migration wizard:
    * in the powershell prompt launched above run the command: Rams5d -DbMigrationWizard
    * if this is the first time you've run this command on your machine, the wizard will walk you through installing an 'SqlIdOffset contributor profile'
5. The wizard will now ask you the types of migration that you want to perform. Pick the following responses:
    * "Schema changes...": Yes
    * "SQL Programmable changes...": No
    * "Data changes via c#...": No
    * "Data changes via Spa...": No
6. When the wizard asks you to "Make your Schema changes....", add the following property:
    * `public int? Age { get; set; }`
    * to the class file 'Ram.Series5.Model\Dummy\SampleEntity.cs'
7. Complete the remaining steps of the wizard


## Scenario 2

In this scenario you will add a SQL View (a programmatic object) with the following `SELECT` statement:

```sql
SELECT s.Id,
    s.IsPending,
    s.FirstName,
    s.LastName,
    s.Age
FROM [SampleEntity] s
```

**Steps**

1. Either:
    * Rollback any changes you might have made from previous scenarios: undo the changes in your pending git change set; OR
    * checkout branch 'xx/devtool-training' replacing *xx* with your initials
2. Start the Db migration wizard: Rams5d -DbMigrationWizard
3. When the wizard asks you the types of migration to perform, pick: "SQL Programmable changes..."
4. When prompted by the wizard, add the view using whatever method you prefer
5. Complete the remaining steps of the wizard


## Scenario 3

In this scenario you add configuration data that is being version controlled using the SPA screens to make these data changes

**Steps**

1. Either:
    * Rollback any changes you might have made from previous scenarios: undo the changes in your pending git change set; OR
    * checkout branch 'xx/devtool-training' replacing *xx* with your initials
2. Start the Db migration wizard: Rams5d -DbMigrationWizard
3. When the wizard asks you the types of migration to perform, pick: "Data changes via Spa screens..."
4. The wizard will launch the SPA in a chrome browser; login in using the 'RAMAdmin' user account (it's important to use that user)
5. In the SPA, open the Field Default Values screen and create a default value for the 'First Name' field of the 'Sample Entity'
6. Complete the remaining steps of the wizard
    * The end result should be a new migration script containing an `INSERT` statement to the `EntityPropertyDefault` table

## Scenario 4

In this scenario you add configuration data by adding additional c# seeding code. Specifically, you will be adding additional `TranslactionSysDefined` entries.

**Steps**

1. Either:
    * Rollback any changes you might have made from previous scenarios: undo the changes in your pending git change set; OR
    * checkout branch 'xx/devtool-training' replacing *xx* with your initials
2. Start the Db migration wizard: Rams5d -DbMigrationWizard
3. When the wizard asks you the types of migration to perform, pick: "Data changes via c#..."
4. Modify the code in 'Ram.Series5.Data\DataInitializers\TranslationsMaintenanceList.cs' class file: insert a new `TranslationSysDefined` instance
5. Complete the remaining steps of the wizard
    * The end result should be a new migration script containing an `INSERT` statement to the `TranslationSysDefined` table


### Scenario 5

In this scenario you will repeat scenario 1-4 in a single run of the migration wizard

**Steps**

1. Either:
    * Rollback any changes you might have made from previous scenarios: undo the changes in your pending git change set; OR
    * checkout branch 'xx/devtool-training' replacing *xx* with your initials
2. Start the Db migration wizard: Rams5d -DbMigrationWizard
3. When the wizard asks you the types of migration to perform, pick yes to all the options
4. Add the c# property described in scenario 1
5. Add the SQL view described in scenario 2
6. Add the c# seeding code described in scenario 4
7. Add the configuration data using SPA screen described in scenario 3
8. Complete the remaining steps of the wizard


## Scenario 6

In this scenario you will walk through "pausing" a migration and resume it at a later date.

In practice you will be pause/resuming a migration:
* if you start a migration, and before completing the wizard, close you powershell console
* switching branches whilst in the middle of a migration

In this lab you will close the powershell console in the middle of a migration.

**Steps**

1. Either:
    * Rollback any changes you might have made from previous scenarios: undo the changes in your pending git change set; OR
    * checkout branch 'xx/devtool-training' replacing *xx* with your initials
2. Start the Db migration wizard: Rams5d -DbMigrationWizard
3. When the wizard asks you the types of migration to perform, pick yes to:
    * "Schema changes..."
    * "Data changes via Spa..."
4. As per scenario 1:
    * add the c# property
    * add the ReadyRoll migration script containing the schema change generated by the wizard for this new property
    * execute the ReadyRoll migration script against the database
5. Add the configuration data using SPA screen described in scenario 3
6. **Do NOT** complete the remaining migration wizard steps
    * DO NOT use ReadyRoll to generate an `INSERT` statement to the `EntityPropertyDefault` table
    * close the powershell console
7. Relaunch the dev tool Series5\run.bat (make sure to "Run As Administrator")
8. Start the Db migration wizard: Rams5d -DbMigrationWizard
9. When prompted by the wizard, pick "Resume existing migration"
10. When the wizard asks you the types of migration to perform, pick yes to the following:
    * "Resume Schema changes..."
    * "Resume Data changes via Spa..."
11. When prompted by the wizard whether to "...keep existing database", pick yes
12. You will be prompted "Make your Schema changes"; here you have the opportunity to make additional changes (this is optional). In this lab you will:
    * add `public string HairColor { get; set; }`
    * to the class file 'Ram.Series5.Model\Dummy\SampleEntity.cs'
13. When prompted by the wizard to "Create migration script...", *modify* the existing migration script that you created in step 4:
    * Replace the line `ALTER TABLE [dbo].[SampleEntity] ADD [Age] [int]` with the content of the clipboard
    * Execute the single line of SQL against the `Series5_Dev` db:  `ALTER TABLE [dbo].[SampleEntity] ADD [HairColor]`
        * The migration script just generated by the wizard will include changes you've just made *and* the changes you made in step 4.
        * In step 4 above you already executed the script to add the `Age` column, therefore you only need to execute that part of the migration that adds the `HairColor` column
14. When prompted by the wizard "Make your Data changes via Spa...":
    * Login to the SPA window that the wizard has just launched (use 'RAMAdmin' as the user)
    * Add an addition default value for the 'Age' field of the 'Sample Entity'
15. Complete the remaining steps of the wizard


## Scenario 7

In this scenario you will again walk through "pausing" a migration and resume it at a later date. This time you will switch branches and then later come back to the branch where you started the original migration

**Steps**

1. Repeat steps 1-6 from scenario 6
2. Commit the changes you've made thus far to the 'xx/devtool-training' branch
    * at this point you should have a new migration script with a schema change to add a new `Age` column
    * this new migration script should NOT contain an `INSERT` statement to the `EntityPropertyDefault` table
2. Switch to another branch that you should create from 'devtool-training'. Name this new branch 'xx/devtool-training2' replacing *xx* with your initials
3. On this new branch, create a migration by following scenario 3
4. Commit the changes you've made to the 'xx/devtool-training2' branch
5. Switch back to the branch you started on for scenario 7 (ie 'xx/devtool-training')
6. Repeat steps 7-10 from scenario 6
7. When prompted "...Database will now be dropped. Continue?", pick yes
8. You will be prompted "Make your Schema changes"; here you have the opportunity to make additional changes (this is optional). In this lab you will:
    * **NOT** make any additional changes
    * ignore the SQL migration generated (you've already included the script as a ReadyRoll migration)
9. When prompted by the wizard "Make your Data changes via Spa...":
    * Login to the SPA window that the wizard has just launched (use 'RAMAdmin' as the user)
    * *Repeat* adding the default value for the 'First Name' field of the 'Sample Entity'
        * **Question**: why are you having to repeat what you already entered in step 1?
        * Constrast this with scenario 6 where you did **not** have to add back the field default you'd already entered
10. Complete the remaining steps of the wizard