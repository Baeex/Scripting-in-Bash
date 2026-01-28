#!/bin/bash

# This script prints the contents of multiple files line by line.
# It outputs line 1 of all files, then line 2 of all files, and so on,
# until the longest file is exhausted.
#
# Usage:
#   ./interleave_files.sh file1 [file2 ... fileN]

if (( $# == 0 ))
then
    echo "Incorrect number of arguments" >&2
    echo "Usage: $0 <file1> [file2 ...]" >&2
    exit 1
fi

max_lines=0

# Find the maximum number of lines among all files
for file
do
    if [[ ! -f "$file" ]]
    then
        echo "Error: $file is not a valid file" >&2
        exit 1
    fi

    lines=$(wc -l < "$file")
    if (( lines > max_lines ))
    then
        max_lines=$lines
    fi
done

line=1

# Print files line by line
while (( line <= max_lines ))
do
    for file
    do
        sed -n "${line}p" "$file"
    done
    ((line++))
done

exit 0
