# Environment Setup #

I usually like to setup the repo for the first time though the webide, you are just goiong to be editing text file and maybe making some folders.  But you can also setup a new repo with the ```git init``` command. For more info see [git init](https://git-scm.com/docs/git-init).  

**NOTE!!!** Setup and commit!! your .gitignore and .gitattributs first before you start to populate and LabVIEW code.  This ensures that the binary files will be treated appropratly and marked as lfs files.  For more info on LFS see https://git-lfs.github.com/


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

## File Organization ##
LabVIEW is sensitive about file paths, so keep all dependencies at a lower level from the project. 

Typicical Tree 
```bash
|--readme.md 
|--LICENSE
|--.gitignore
|--.gitattributs
|    |--src
|    |    |--<YourProject.lvsoln>
|    |    |--main.vi
|    |    |--<YourProject.vipc>
|    |    |--<library name>
|    |    |  |--<library name>.lvlib  
|    |    |  |--Class1
|    |    |  |   |--Class1.lvclass
|    |    |  |   |--some.vi
|    |    |  |   |--another.vi
|    |    |  |--Class2
|    |    |  |    |--Class2.lvclass
|    |    |  |    |--some.vi
|    |    |  |    |--another.vi        
----------------------------------
```
Note that all the code is in a lower level directory than the project. With the possible exception of your entry point vi.  
