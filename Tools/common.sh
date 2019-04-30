#Functions in this file are called from difftool.sh and mergetool.sh to determine file extension.
#They should return true (0) if given two files both have desired extension and return false (1) otherwise.

LV_DIFF="C:\Program Files (x86)\National Instruments\Shared\LabVIEW Compare\LVCompare.exe"
LV_MERGE="C:\Program Files (x86)\National Instruments\Shared\LabVIEW Merge\LVMerge.exe"

FILE_EXTENSION="sbs"

is_myfile() {
		#extract filename
		filename1=$(basename $1)
		#get the extension
		ext1="${filename1##*.}"
		#do the same for the other file, if any
		if [ "$#" -eq 2 ]; then
			filename2=$(basename $2)
			ext2="${filename2##*.}"
		else
			#if there is only 1 argument (negletting the case of any other
			#argument combination), directly assign it to sbs.
			ext2=$FILE_EXTENSION;
		fi
		#disable case sensitive matching
		shopt -s nocasematch
		if [[ $ext1 = $FILE_EXTENSION && $ext2 = $FILE_EXTENSION ]] ; then
			shopt -u nocasematch
			return 0
		else
			shopt -u nocasematch
			return 1
		fi
}
