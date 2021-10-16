# git Cheat Sheet #

NOTE! If you are coming to git for the first time forget what you know about how centralized source control works. Checkout dosn't mean what you think it means. Git was originally written by and for Linux OS development by Linus Torvalds; decentralized power, radical ideas on the indiviuals power in society and the fact that Linus has a odd sense of humor should all be kept in mind when learning git.   

## Basic function set ##

```git clone [url] [dir]``` This is what you use to retireve a remote repoistory for the first time.  It will clone in to the working directory if you do not provide it with a relative or absolute directory path. 

![MgaV9.png](https://github.com/ansible42/takednGitCheatSheet/blob/master/2037853081-MgaV9.png)

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

### Resolving push errors ###

Most commonly the issue with pushing is that there have been changes to files on the remote since your last pull.  Resolution to this is using the ```git pull``` before you push.  

### Resolving Pull Errors ###

Pull errors most commonly result in there being changes in both the local and remote to the same file.  For text files there is a merge process.  Binary files (*.vi, *.vit, *.ctl ect) either need an external diff tool or you can choose 'ours' or 'theirs'

See [git LabVIEW diff/merge setup](https://github.com/ansible42/LabVIEWGitCheatSheet/blob/master/LabVIEWGitCompSetup.md) for more information on setting up diff and merge tools that work with LabVIEW. 

If you want to go back and un-stage commits when you get this error you will first have to use the ```git merge --abort``` to cancel the merge

If you do not want to submit your changes you can do a pull with ```git pull -Xtheirs``` to just accept the remote version of the files.  Use this with caution as it will overwrite the local files.  


### Best Work Practices ###

Always always use branches, this way you can locally branch swap to see the original files.  Branch swap workflow below.  It adds one extra step to your development but it will pay for itself soon enough.  

Create a local branch 
```git checkout -b <TopicBranch> ```  

Do your work 
``` git add <file>```
``` git commit -m <comment>```

You forgot something from before. So swap back to the original.  
```git checkout master ```

To switch back to your topic branch 
```git checkout <TopicBranch> ```  

At this point you can either to a merge with the local master before pushing to the remote.  Or you can turn it into a remote branch, this is recommended if you want other team members to work on the branched codebase.  To turn a local branch into a remote branch do a ```git push -u origin <TopicBranch>```

### Environment Setup ###

LabVIEW is sensitive about file paths, so keep all dependencies at a lower level from the project. 

### .gitignore ### 

LabVIEW git repos should always include a .gitignore file I normally have something like this. Passing these files into the repo makes no difference and prevents constant changes in your staging area.  
``` 
**/builds/
**/build/
*.bldcache
*.aliases
*.lvlps
*.md5
*.db
*.exe 
*.nipkg
*.ipk

```

### .gitattributes ###

This file sets the how git treats different file types. 

I like to keep projects as binary files even though they are just xml, this way git will not mess with line endings or try and merge them.  You can also put .vi, .ctl, .vit and .vim files here if you want to not us the merge startigy outlined [here](https://github.com/ansible42/LabVIEWGitCheatSheet/blob/master/LabVIEWGitCompSetup.md).  
```
*.lvproj -merge
*.lvlib -merge
*.lvclass -merge
*.xctl -merge
*.xnode -merge
*.lvsc -merge
*.ctl filter=lfs diff=lfs merge=lfs -text
*.lvlibp filter=lfs diff=lfs merge=lfs -text
*.llb filter=lfs diff=lfs merge=lfs -text
*.vi filter=lfs diff=lfs merge=lfs -text
*.vit filter=lfs diff=lfs merge=lfs -text
*.vim filter=lfs diff=lfs merge=lfs -text
*.ctt filter=lfs diff=lfs merge=lfs -text
*.vip filter=lfs diff=lfs merge=lfs -text
*.vipb filter=lfs diff=lfs merge=lfs -text
```
This marks the xml files (lvproj, lvlib,lvclass and such) to be not merged during an auto merge. Marking all of the binary files as LFS will save you time and space in storeage and will resolve some issues during merges.  

