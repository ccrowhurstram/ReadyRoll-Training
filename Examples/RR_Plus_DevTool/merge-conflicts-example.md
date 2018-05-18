# RAM internal dev tools - merge conflicts

Resolving the merge is largely the same process you've already practiced in [Readyroll lab - merge conflicts](../ReadyRoll_Only/merge-conflicts-example.md).

Make sure to practice these Readyroll labs.

Below are the steps to perform a merge, tailored to using the dev tool...

**Steps**

1. Merge branch. Use standard git merge to resolve conflicts:
	* to app code
	* to Programmable objects
	* to offline model
2. Verify the merge:
    1. Drop the database: Rams5d -Remove -Database 
	2. Use the Ram.Series5.Db Visual studio solution to deploy the database (Build > Deploy Solution)
3. If the deploy fails, that means the scripts are in conflict. Resolve these using the same techniques as described in the scenarios xxx. To verify your changes:
	1. Drop the database: Rams5d -Remove -Database 
	2. Use the Ram.Series5.Db Visual studio solution to deploy the database (Build > Deploy Solution)
4. Verify the database installer embedded into the SPA:
	1. Run: Rams5d -Build; Rams5d -Install -Database 
	2. In ReadyRoll click 'Refresh' button - you should NOT see any data or schema changes detected