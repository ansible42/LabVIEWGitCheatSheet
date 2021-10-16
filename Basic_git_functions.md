## Basic function set ##

```git clone [url] [dir]``` This is what you use to retireve a remote repoistory for the first time.  It will clone in to the working directory if you do not provide it with a relative or absolute directory path. 

![MgaV9.png](2037853081-MgaV9.png)

```git checkout ``` If you are used to working with SVN or Perforce this may be the hardest one to get used to. Checkout it gitland is used to move bettwene branches in the local repository, it has nothing to do with interactions with the rempote (sever) 

``` git pull ``` reaches out to the remote and pulls the latest version down, will trigger a merge if there are conflicts 

``` git status``` Returns status of which files have been modified (worksapace vs index). 


Move files into the index also called 'staged for commit' 

``` git add [filename]```  stages a specific file for commit to the local repository   
``` git add -A```  stages all files that are different from the HEAD for commit to the local repository   
``` git add .```  stages all files that are in lower level folders for commit to the local repository   

When you are ready to create a checkpoint. This only commits the code to a place in the local repository. The remote remains unchanged. 

``` git commit``` prompts you to write a commit message and commits your staged changes to the local repository    
``` git commit -m "Commit Message here"``` sets your given commit message and commits your staged changes to the local repository

After committing locally you can keep working and making more commits or you can push to the remote.

Pushing to remote. 

```git push``` pushes the local changes to the remote repository if nothing has changes on the remote it should just go up 
