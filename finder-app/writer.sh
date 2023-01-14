#! /usr/bin/bash

#Accepts the following arguments: 
#the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; 
#the second argument is a text string which will be written within this file, referred to below as writestr

#Exits with value 1 error and print statements if any of the arguments above were not specified

# Creates a new file with name and path writefile with content writestr, 
# overwriting any existing file and creating the path if it doesn’t exist. 
# Exits with value 1 and error print statement if the file could not be created.


#totalfiles=$(find $1/ -mindepth 1 | wc -l)
#searchstr=$(grep -r "$2" * | wc -l)


filedir="$(dirname "${1}")"

#writefile=$(touch $1)
#makedir=$(mkdir -p $filedir)

if (($# != 2))
then
    echo "ERROR: 2 parameters required writer"
    exit 1

else
    
    if [ -d "$filedir" ]
    then
        #echo "Directory $filedir exists"
        #$writefile
        touch $1
        echo $2 > $1
        
    else
        #echo "Directory $filedir does not exist"
        #echo "Creating ..."
        mkdir -p $filedir
        #$makedir
        
        if [ -d "$filedir" ]
        then
            #echo "Creating file: $writefile"
            #$writefile
            touch $1
            echo $2 > $1

        else
            echo "ERROR: Directory $filedir failed to be created"
            exit 1

        fi    
    fi
fi