#!/bin/bash

# Method to determine absolute path
# The -W parameter on the pwd command is necessary to return the Windows version of the path.
# Not using the -W parameter will result in a conversion of temp directory to a 'tmp' path meaningful only in the Linux #

environment.
# Piping the result through tr '/' '\\' translates the forward slashes to backslashes.
# Windows understands forward slashes, but LVMerge.exe does not.

abspath () {
(
DIR=$(dirname "$1")
FN=$(basename "$1")
cd "$DIR"
printf "%s/%s" "$(pwd -W)" "$FN" | tr '/' '\\'
)
}

lvmerge="C:\\Program Files (x86)\National Instruments\\Shared\\LabVIEW Merge\\LVMerge.exe"
local=$(abspath "$1")
remote=$(abspath "$2")
exec "$lvmerge" -nobdpos -nofppos "$local" "$remote"
# For the options, see http://zone.ni.com/r...mp_thirdparty/.