
# Dev Workflow

1.  Naming conventions
	-  Git Tags: `YYYY-MM-DD--[succinct description]`
	- Feature branches:
		- If working from a single ticket: `dev-[JIRA/Mantis ticket ID]-[succinct description]`
		- If working from multiple tickets: `dev-YYYY-MM-[succinct description]`
		
2.  New projects
	- Work on ‘Production’ environment
	- Code held in ‘master’ Git branch
	- Once 2 week cool off period has passed after site launch:
		- Create ‘dev’ Git branch, assign to 'Dev' environment
		- Set 'Stage' environment to run off 'master' branch
		- Create new tag and set on 'Prod' environment
		- Clone ‘Prod’ database down to ‘Dev’ & ‘Stage’ environments    
		
3.  Existing projects
	- **If 'Dev' env already on a feature branch, check with branch owner on next steps, do not change branch**
	- Create new feature branch based off latest 'master' branch (see naming conventions above)
	- Set 'Dev' env to run from feature branch
	- Work on local machine
	- When pushing form local to 'Dev' env, `git pull` and import config **first** to check for other changes/conflicts
	- Once pushed, always import config on 'Dev' immediately

4. Promoting new work to Production
	-	Once new work is signed off for production, merge feature branch to 'dev' branch, set 'Dev' env to run from 'dev' branch, check thoroughly
	-	Once happy, merge 'dev' to 'master' branch
	-	Clone DB from 'Prod' to 'Stage' env
	-	Import config on 'Stage' env, check thoroughly
	-	Once happy, tag master branch and assign to 'Prod' env
	-	Import config on 'Prod', check thoroughly
	-	Clear varnish cache in Acquia
	-	Return dev/stage to original dev/stage branches, ensuring they are all merged from master branch

## Notes
- When using Drush on Acquia over SSH, you must set the application & environment like so: 
```
drush @exampleapp.dev cr
drush @exampleapp.prod cim vcs
```
