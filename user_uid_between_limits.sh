#!/bin/bash

#This script checks your directory /etc/passwd and prints Username and UID within a given range

while IFS=':' read user passwd uid gid  
do
	if [ $uid -ge $1 ] && [ $uid -le $2 ] 
    then
        echo "User: $user --> UID: $uid"
    fi
done < /etc/passwd
