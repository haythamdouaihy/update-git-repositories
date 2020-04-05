update-git-repositories
========================

Simple script that runs on unix machines in order to update repositories that exist under a given base folder.


What it does
-------------

This script loops on each of the git repositories inside the provided folder, for each of a repo, it  
1. checks out master branch  
2. resets hard
3. pulls latest code from origin master

How to run
----------

Open a terminal into the right file location, and execute the following command:  
`./update-git-repositories.sh -a basePath -b repoToExclude`

Usage:  
* **-a basePath**: is the base path of the git repositories  
* **-b repoToExculde**: if you are currently working on a repo and you don't want to go back to master, reset, and get latest from remote, simply add it here as a parameter.  

Note
-----

1. make sure the file update-git-repositories is executable  
2. this script currently won't execute if your don't provide the 2 required parameters and with valid values.
3. the script may pause requiring for authentication to get allowed to pull from remote repositories, so, it is recommended that your repositories authenticaiton are already configured, in order to have a smooth run of the script without any intervention.



