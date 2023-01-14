#! /usr/bin/bash

# Accepts the following runtime arguments:
# the first argument is a path to a directory on the filesystem, referred to below as filesdir; 
# the second argument is a text string which will be searched within these files, referred to below as searchstr
# Exits with return value 1 error and print statements if any of the parameters above were not specified
# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem


# Prints a message "The number of files are X and the number of matching lines are Y" 
# where X is the number of files in the directory and all subdirectories and 
# Y is the number of matching lines found in respective files.

#dir=$(-d $1)
#echo $dir
#dirlen=${#dir}
#echo $dirlen
#filesdir=$(find . -name $1)
#filelen=${#filesdir}

#chk=$(find ./$1/ -mindepth 1)
#echo $chk


#chk=$(grep -r "$2" *)
#echo "$chk"

if (($# < 2))
then
    echo "ERROR: 2 parameters required finder"
    exit 1

else
    if [ -d "$1" ]
    then
        totalfiles=$(find $1 -mindepth 1 | wc -l)
        searchstr=$(grep -r $2 $1 | wc -l)
        echo "The number of files are $totalfiles and the number of matching lines are $searchstr myfile"
    
    else
        echo "ERROR: $1 does not represent a directory on the filesystem"
        exit 1
    
    fi
fi