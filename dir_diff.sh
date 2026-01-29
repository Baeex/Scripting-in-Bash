#!/bin/bash

# This script compares two directories and prints the files
# that exist in one directory but not in the other.
#
# Usage:
#   ./dir_diff.sh <dir1> <dir2>

if (( $# != 2 ))
then
    echo "Incorrect number of arguments" >&2
    echo "Usage: $0 <dir1> <dir2>" >&2
    exit 1
fi

if [[ ! -d "$1" || ! -d "$2" ]]
then
    echo "Both arguments must be valid directories" >&2
    exit 1
fi

# List files that are in dir1 but not in dir2
for file in "$1"/*
do
    base=$(basename "$file")
    if [[ ! -e "$2/$base" ]]
    then
        echo "$file"
    fi
done

# List files that are in dir2 but not in dir1
for file in "$2"/*
do
    base=$(basename "$file")
    if [[ ! -e "$1/$base" ]]
    then
        echo "$file"
    fi
done

exit 0
