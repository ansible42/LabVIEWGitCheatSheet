## Setup your git for LabVIEW development 

*   [Install git](https://git-scm.com/downloads)
*   [Clone, comile and install VICompare tool](https://github.com/smithed/vicompare) 
    *   This tool is better at dealing with paths than the one that ships with LabVIEW  
*   Open your global .gitconfg 
    *   May need to be created best way to do this is setup your Name and email 
    *   ```git config --global git config --global user.email "email@email.email"```
    *   ``` git config --global user.name "User Name"```
    *   In windows located at C:\Users\[UserName]\.gitconfig

*   Paste in the following block which tells git that you want to use these tools as merge and diff tools.  

```
[mergetool "LVMerge"]
	cmd = 'C:/viscc/vimerge.exe' \"$BASE\" \"$REMOTE\" \"$LOCAL\" \"$MERGED\"
[difftool "LVDiff"]
	cmd = 'C:/viscc/vidiff.exe' \"$LOCAL\" \"$REMOTE\"
[merge]
	tool = LVMerge
[diff]
    tool = LVDiff

```
 