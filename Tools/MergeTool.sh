#!/bin/bash
# Wrapper script for git mergetool
# This requires the .gitconfig file to have:
#  - mergetool entry for "LVdiff";
# I just added the ctl as an example of how to do multiple file types.  
# These merge tool entries must both specify the
# cmd field. The command to call this script:
# [mergetool "merge_wrapper"]
#	cmd = $HOME/merge-wrapper \"$BASE\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\"
# Locate this script in your $HOME

BASE=$1
LOCAL=$2
REMOTE=$3
MERGED=$4

VIDIFF="\.vi"
CTLDiff="\.ctl"

if echo "$BASE" | grep -q "$VIDIFF"; then
	echo "Using merge LVMerge for labview vi ";
	CMD=$(git config mergetool.LVdiff.cmd)	
	eval $CMD
else if echo "$BASE" | grep -q "$CTLDIFF"; then
	echo "Using LabVIEW .ctl diff"
	CMD=$(git config mergetool.LVdiff.cmd)
	eval $CMD
else
#checking for additional special merge tool cases
#Finally, the default case:
	echo "Using default merge tool";
	CMD=$(git config mergetool.fw_def.cmd)	
	eval $CMD
fi