# git Cheat Sheet for LabVIEW #

**NOTE!** If you are coming to git for the first time forget what you know about how centralized source control works. Checkout dosn't mean what you think it means. Git was originally written by and for Linux OS development by Linus Torvalds; decentralized power, radical ideas on the indiviuals power in society and the fact that Linus has a odd sense of humor should all be kept in mind when learning git.   

git was not built for use with a language that stores it's source code in a binary.  So there are weaknesses in the ability to merge, and diff branches.  But with good planning and proper care you can use git effectivly with LabVIEW.  

[Setting up a new repository](NewRepoSetup.md)

[Workflow Best Pactaces](workflow.md)

[Basic git funcitions](Basic_git_functions.md) But there are way better documents online that can teach you about this. I wrote this mostly for myslelf when I was first learning. 

[submodules as packages](submodules.md)  While there are package managment solutions for LabVIEW, [JKI's wonderful VIPM](https://www.vipm.io/) and open source project organized by MGI [GPM](https://gitlab.com/mgi/gpm/gpm).  Sometimes that a workable solution.  You can use submodules (or subtrees but I have not tried this) as a kind of psudo package mangement system.  
