# git Cheat Sheet #

## Typical Workflow ##

![MgaV9.png](https://github.com/ansible42/takednGitCheatSheet/blob/master/2037853081-MgaV9.png)


``` git pull ``` reaches out to the remote and pulls the latest version down, will trigger a merge if there are conflicts 

``` git status``` 


Do your work

``` git add [filename]```  stages a specific file for commit to the local repository   
``` git add -A```  stages all files that are different from the HEAD for commit to the local repository   
``` git add .```  stages all files that are in lower level folders for commit to the local repository   

When you are ready to create a checkpoint. This only commits the code to a place in the local repository. The remote remains unchanged. 

``` git commit``` prompts you to write a commit message and commits your staged changes to the local repository    
``` git commit -m "Commit Message here"``` sets your given commit message and commits your staged changes to the local repository

After committing locally you can keep working and making more commits or you can push to the remote.

Pushing to remote. 

```git push``` pushes the local changes to the remote repository if nothing has changes on the remote it should just go up 

### Resolving push errors ###

Most commonly the issue with pushing is that there have been changes to files on the remote since your last pull.  Resolution to this is using the ```git pull``` before you push.  

### Resolving pull errors ###

Pull errors most commonly result in there being changes in both the local and remote to the same file.  For text files there is a merge process.  Binary files (*.vi, *.vit, *.ctl ect) either need an external diff tool or you can choose 'ours' or 'theirs'

See [git LabVIEW setup](.\LabVIEWGitCompSetup.md)

If you want to go back and un-stage commits when you get this error you will first have to use the ```git merge --abort``` to cancel the merge

If you do not want to bother you can do a pull with ```git pull -Xtheirs``` to just accept the remotes version of the file.
