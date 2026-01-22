#!/bin/bash
# Description:
# Given an integer as an argument, this script lists all system users
# who own a number of files greater than or equal to the given number.
# It uses the 'find' command to count files owned by each user.
# Usage: ./users_by_file_count.sh <number>

# Validate arguments
number='^[0-9]+$'

if [ $# -ne 1 ]; then
    echo "Incorrect number of arguments" >&2
    echo "This script must be called with exactly one integer parameter" >&2
    exit 1
elif ! [[ $1 =~ $number ]]; then
    echo "Error: Please enter a valid integer" >&2
    exit 1
fi

threshold=$1

# Iterate over all system users
for user in $(cut -d: -f1 /etc/passwd); do
    # Count files owned by this user, suppress permission errors
    num_files=$(find / -user "$user" -xdev 2>/dev/null | wc -l)
    
    # Print the user if file count >= threshold
    if (( num_files >= threshold )); then
        echo "$user"
    fi
done
exit 0
