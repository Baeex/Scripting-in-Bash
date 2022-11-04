#!/bin/bash

#This script checks your directory /etc/passwd and prints Username and UID within a range given

while IFS=':' read -r user passwd uid gid  
do
	if [ $uid -ge $1 ] && [ $uid -le $2 ] 
    then
        echo "User: $user --> UID: $uid"
    fi
done < /etc/passwd
