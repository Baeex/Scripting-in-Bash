#!/bin/bash

# This script searches for .doc and .docx files starting from a given directory
# (or the current directory if none is provided), converts their filenames to
# lowercase, and logs the changes made.
# Log file: $HOME/docChanges.log

LOGFILE="$HOME/docChanges.log"

if (( $# == 1 ))
then
    if [[ ! -d $1 ]]
    then
        echo "The script must be called by specifying a valid directory path" 1>&2
        exit 1
    fi

    echo "The search will start from the path: $1"
    R=$1

elif (( $# == 0 ))
then
    echo "The search will start from the current directory: $(pwd)"
    R=$(pwd)

else
    echo "Incorrect number of arguments" 1>&2
    echo "The script must be called with one directory or no arguments"
    exit 1
fi

find "$R" \( -iname "*.doc" -or -iname "*.docx" \) | while read line
do
    dir_name=$(dirname "$line")
    file_name=$(basename "$line" | tr [:upper:] [:lower:])

    if [[ "$dir_name/$file_name" != "$line" ]]
    then
        mv "$line" "$dir_name/$file_name"
        date_time=$(date --rfc-3339=seconds)
        echo "$date_time $dir_name $file_name" >> "$LOGFILE"
    fi
done

echo "Script finished"
exit 0
