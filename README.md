# git Cheat Sheet for LabVIEW#

NOTE! If you are coming to git for the first time forget what you know about how centralized source control works. Checkout dosn't mean what you think it means. Git was originally written by and for Linux OS development by Linus Torvalds; decentralized power, radical ideas on the indiviuals power in society and the fact that Linus has a odd sense of humor should all be kept in mind when learning git.   


See [Setting up a new repository](NewRepoSetup.md)


### Resolving Pull Errors ###

Pull errors most commonly result in there being changes in both the local and remote to the same file.  For text files there is a merge process.  Binary files (*.vi, *.vit, *.ctl ect) either need an external diff tool or you can choose 'ours' or 'theirs'

See [git LabVIEW diff/merge setup](LabVIEWGitCompSetup.md) for more information on setting up diff and merge tools that work with LabVIEW. 

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
```git checkout [main branch] ```

To switch back to your topic branch 
```git checkout <TopicBranch> ```  

At this point you can either to a merge with the local master before pushing to the remote.  Or you can turn it into a remote branch, this is recommended if you want other team members to work on the branched codebase.  To turn a local branch into a remote branch do a ```git push -u origin <TopicBranch>```

