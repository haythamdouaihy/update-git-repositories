#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -a basePath -b repoToExclude"
   echo -e "\t-a basePath is the base path of the git repositories"
   echo -e "\t-b repoToExclude is the name of the repository to exclude from pulling"
   exit 1 # Exit script after printing help
}

while getopts "a:b:" opt
do
   case "$opt" in
      a ) basePath="$OPTARG" ;;
      b ) repoToExclude="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$basePath" ] || [ -z "$repoToExclude" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
echo "....Pulling in latest changes for all repositories...."
echo "--------------------"
echo "path: $basePath"
echo "excluded repo: $repoToExclude"
echo "--------------------"

CUR_DIR=$(pwd)
echo "current path: $CUR_DIR"
cd $basePath
CUR_DIR=$(pwd)
echo "current path after changing directory: $CUR_DIR"
echo "--------------------"

#Find all git repositories and update it to the master latest revision
for i in $(find . -name ".git" | cut -c 3-); do
   echo "";
   echo "....starting processing repo: " $i "....";

   #if [[ $i =~ $repoToExclude ]]
   if [[ $i != "${repoToExclude}/.git" ]]
   then
      echo "....pulling repo: " $i "....";

      # We have to go to the .git parent directory to call the pull command
      cd "$i";
      cd ..;

      # reset to master before pull
      git checkout master
      git reset --hard

      # finally pull
      git pull origin master;

      # lets get back to the CUR_DIR
      cd $CUR_DIR
      echo "....successfully pulled repo: " $i "...."
   else
      echo "....repo $i was not processed ...."
   fi
done

echo "....Pulling all Repos COMPLETED!...."


