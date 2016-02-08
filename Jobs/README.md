# Mu2 Jobs System - MuReq


## Introduction

This is a new jobs system. It will take some time to familiarize yourself with it but it should become far more useful overtime than Anomaly jobs ever was.
The idea is to not pester  you or present you with an over abundance of information. A list of 300 jobs is not useful when you only need one job.
To tackle this problem MuReq sorts jobs using four main attributes: A category, A list of Tags, The person that opened it, The title, body and comment text.
You can search by any of these to find the jobs you want. A category can be thought of as a bucket, except that unlike Anomaly jobs you can have as many categories as you want and the system doesn't care.
You can assign any category to any job and it will dynamically count that category when you type +jobs. Tags can be thought of as tiny keywords for jobs. They can be big, up to 255 characters, and they should indicate important features that the job applies to.
A major difference will be that +jobs does not return a list of jobs. Instead, it returns a list of job categories and tags along with a count of jobs in each. Again, this follows the philosophy of not spamming you with useless information.
In order to see individual jobs, you have to sift down to at least a category.

## The Philosophy
There were four main words in play.

* Simple
* Unobtrusive
* Useful
* Dynamic

## Permissions
In Anomaly jobs, Permissions are old, static and binary. Have or Have not. There was no in between or complex permission structure. This system fixes that.
Each job has a permission structure like so:
* Staff can read all jobs
* If you opened it, you can read the job
* If you are a commentor, you can read the job and add comments to it
* If you are a reader, you can read the job but not add comments

As you can see, this is a multilevel permission structure, except that it doesn't end there. There are also several flags that get pushed into that.
* Flag 4 - Doesn't show up in searches
* Flag 5 - Staff Only
* Flag 6 - Only Staff can modify the job

And we've added another level to the structure of permissions. I wish I could say it ended there, but it doesn't. Comments also have their own permission structures. They are defined as follows.
* Staff can read all comments at all times
* If the comment has no readers specified, anyone can read the comment if they can read the job (See above)
* If the comment has a list of readers specified, only staff and the readers can see the comment (However, others can still open the job, they just don't see this comment)
* If the comment has flag 5, only staff can see it

## Commands
### Universal Commands
*These commands may not work if you don't have permissions*
*All commands that add comments support coloring and formatting*
#### Commands to Search Jobs
* +jobs - Overview of Categories and Tags
* +jobs/category <category> - List of jobs in <category>
* +jobs/tag <tag> - List of jobs with <tag>
* +jobs/from <name> - List of jobs Opened By <name>
* +jobs/mine - List of jobs Opened By You
* +jobs/search <keyword> - List of jobs with keyword in title or comments

#### Commands to Create Jobs
* ``+request <title>[/<category>]=<opening comments> - Player command to open a job. Creates a job with <title> that has <opening comments> as body. If <category> is specified it has that category. Otherwise it defaults to None.``

#### Commands to Manipulate Jobs
* +job <id> - View Job <id>
* +job/comment <id>=<comment> - Add <comment> to <id>.
* +job/readers <id>=<player> - Add <player> to the readers of <id>.
* +job/commenters <id>=<player> - Add <player> to the commenters of <id>.

#### Commands for Staff
* +job/add <id>=<text> - Add a staff comment to job <id> with <text>. This comment is flagged staff and only ever visible to other staff.
* +job/lock <id> - Lock a job so only staff can modify it
* ``+job/create <title>[/<category>[/<flag>]]=<text> - Create a job with <title> and body of <text>. Staff can also specify a <category> and <flag> (from 0-6).``

## Flags
* 0 - None
* 1 - Global (Anyone can comment on and Read the job)
* 2 - Held
* 3 - Closed
* 4 - Archived
* 5 - Staff
* 6 - Staff Locked

## Dev Status
This is far from done, but it's working. I will keep adding features.
