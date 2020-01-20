

# Dev Workflow

1.  Naming conventions
	-  Git Tags: `YYYY-MM-DD--[succinct description]`
	- Feature branches:
		- If working from a single ticket: `dev-[JIRA ticket ID]`
		- If working from multiple tickets: `dev-[succinct description]`
		
2.  New projects
	- Work on ‘Production’ environment
	- Code held in ‘master’ Git branch
	- Once 2 week cool off period has passed after site launch:
		- Assign 'Dev' environment to `master` branch
		- Assign 'Stage' environment to `master` branch
		- Create new tag and set on 'Prod' environment (following naming conventions above)
		- Clone 'Prod' database down to 'Dev' & 'Stage' environments    
		
3.  Existing projects
	- **If 'Dev' env already on a feature branch, check with branch owner on next steps, do not change branch**
	- Create new feature branch based off latest 'master' branch (see naming conventions above)
	- Set 'Dev' env to run from feature branch
	- Work on local machine
	- When pushing form local to 'Dev' env, `git pull` and import config **first** to check for other changes/conflicts
	- Once pushed, always import config on 'Dev' immediately

	3.1. Client feedback/signoff
	- Once internally tested & signed off on 'Dev' env:
	- Clone DB from 'Prod' to 'Stage' env
	- Merge feature branch to `master` branch and deploy to 'Stage' env
	- Import config & test for any conflicts/issues
		- Update JIRA ticket with correct 'Stage' urls and assign to PM/Client

	3.2. Promoting new work to Production
	- Once new work is signed off for production:
	- Tag master branch and assign to 'Prod' env
	- Import config on 'Prod', check thoroughly
	- Clear Drupal cache & varnish cache in Acquia
	- Return dev/stage to original master branches,

## Notes
- When using Drush on Acquia over SSH, you must set the application & environment like so: 
```
drush @exampleapp.dev cr
drush @exampleapp.prod cim vcs
```
